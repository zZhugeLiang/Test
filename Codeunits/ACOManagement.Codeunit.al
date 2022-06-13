codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var SalesLine: Record "Sales Line"; CustomerNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ACOLinkedHolder: Record "ACO Linked Holder";
        ACOLinkedPackaging: Record "ACO Linked Packaging";
        ACOColor: Record "ACO Color";
    begin
        if SalesLine.Type <> SalesLine.Type::Item then
            exit;

        ACOLinkedHolder.SetRange("Item No.", SalesLine."No.");
        ACOLinkedHolder.SetRange("Customer No.", CustomerNo);

        if ACOColor.Get(SalesLine."ACO Color") then
            ACOLinkedHolder.SetRange("Color Group Code", ACOColor."Color Group");
        // if Item.Get(SalesLine."No.") then
        //     if ACOColor.Get(Item."ACO Color") then
        //         ACOLinkedHolder.SetRange("Color Group Code", ACOColor."Color Group");

        if SalesLine."ACO Profile Length" <> 0 then
            ACOLinkedHolder.SetRange(Length, SalesLine."ACO Profile Length");

        if ACOLinkedHolder.FindFirst() then begin
            SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
            if CheckStatusLinkedHolders(ACOLinkedHolder.Code, SalesHeader."Sell-to Customer No.", SalesLine."ACO Profile Code", false) then
                SalesLine."ACO Linked Holder" := ACOLinkedHolder.Code;
        end else
            SalesLine."ACO Linked Holder" := '';

        ACOLinkedPackaging.SetRange("Item No.", SalesLine."No.");
        ACOLinkedPackaging.SetRange("Customer No.", CustomerNo);
        if SalesLine."ACO Profile Length" <> 0 then
            ACOLinkedPackaging.SetRange("Length", SalesLine."ACO Profile Length");

        if ACOLinkedPackaging.Count() = 1 then begin
            ACOLinkedPackaging.FindFirst();
            SalesLine."ACO Packaging" := ACOLinkedPackaging.Code;
        end else
            SalesLine."ACO Packaging" := '';
    end;

    procedure CheckStatusLinkedHolders(HolderCode: Code[30]; CustomerNo: Code[20]; ProfileCode: Code[30]; ShowError: Boolean): Boolean
    var
        ACOLinkedHolderType: Record "ACO Linked Holder Type";
        ACOLinkedSupportHolder: Record "ACO Linked Support Holder";
        ACOLinkedDistanceHolder: Record "ACO Linked Distance Holder";
        InactiveHolderErr: Label 'An inactive holder cannot be selected.';
        InactiveHolderMsg: Label 'A Holder has been found, but it is inactive, the value of Holder has not changed.';
    begin
        ACOLinkedHolderType.SetRange("Holder Code", HolderCode);
        ACOLinkedHolderType.SetRange("Customer No.", CustomerNo);
        ACOLinkedHolderType.SetRange("Item No.", ProfileCode);
        ACOLinkedHolderType.SetRange(Status, ACOLinkedHolderType.Status::Inactive);
        if not ACOLinkedHolderType.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        ACOLinkedSupportHolder.SetRange("Holder Code", HolderCode);
        ACOLinkedSupportHolder.SetRange("Customer No.", CustomerNo);
        ACOLinkedSupportHolder.SetRange("Item No.", ProfileCode);
        ACOLinkedSupportHolder.SetRange(Status, ACOLinkedSupportHolder.Status::Inactive);
        if not ACOLinkedSupportHolder.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        ACOLinkedDistanceHolder.SetRange("Holder Code", HolderCode);
        ACOLinkedDistanceHolder.SetRange("Customer No.", CustomerNo);
        ACOLinkedDistanceHolder.SetRange("Item No.", ProfileCode);
        ACOLinkedDistanceHolder.SetRange(Status, ACOLinkedDistanceHolder.Status::Inactive);
        if not ACOLinkedDistanceHolder.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        exit(true);
    end;

    procedure InsertExtraSalesLineFromSalesShptLine(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; LineNoIncrement: Integer; NewDescription: Text)
    var
        NewSalesLine: Record "Sales Line";
    begin
        NewSalesLine := SalesLine;
        NewSalesLine."Line No." += LineNoIncrement;
        NewSalesLine.Description := CopyStr(NewDescription, 1, MaxStrLen(NewSalesLine.Description));
        NewSalesLine.Insert();
    end;


    var
        UOMMgt: Codeunit "Unit of Measure Management";

    local procedure CreateProdOrder(var SalesLine: Record "Sales Line");//; ProdOrderStatus: Enum "Production Order Status"; OrderType: Option ItemOrder,ProjectOrder)
    var
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        ACOCreateProdOrderLines: Codeunit "ACO Create Prod. Order Lines";
        ProdOrderStatusMgt: Codeunit "Prod. Order Status Management";
        LeadTimeMgt: Codeunit "Lead-Time Management";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ReservQty: Decimal;
        ReservQtyBase: Decimal;
        ProdOrderRowID: Text[250];
        IsHandled: Boolean;
    begin
        ProdOrder.Init();
        ProdOrder.Status := ProdOrder.Status::Released;
        ProdOrder."No." := '';
        //OnCreateProdOrderOnBeforeProdOrderInsert(ProdOrder, SalesLine);
        ProdOrder.Insert(true);
        //OnCreateProdOrderOnAfterProdOrderInsert(ProdOrder, SalesLine);

        ProdOrder."Starting Date" := WorkDate;
        ProdOrder."Creation Date" := WorkDate;
        ProdOrder."Low-Level Code" := 0;
        ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
        ProdOrder.Validate("Source No.", SalesLine."Document No.");
        ProdOrder."Due Date" := SalesLine."Shipment Date";
        ProdOrder."Ending Date" :=
            LeadTimeMgt.PlannedEndingDate(SalesLine."No.", SalesLine."Location Code", '', ProdOrder."Due Date", '', 2);
        //OnAfterCreateProdOrderFromSalesLine(ProdOrder, SalesLine);
        ProdOrder.Modify();
        ProdOrder.SetRange("No.", ProdOrder."No.");

        IsHandled := false;
        if not IsHandled then begin
            ACOCreateProdOrderLines.SetSalesLine(SalesLine);
            ACOCreateProdOrderLines.Copy(ProdOrder, 1, SalesLine, true);
        end;

        IsHandled := false;
        if not IsHandled then
            if ProdOrder."Source Type" = ProdOrder."Source Type"::Item then begin
                ProdOrderLine.SetRange(Status, ProdOrder.Status);
                ProdOrderLine.SetRange("Prod. Order No.", ProdOrder."No.");

                if ProdOrderLine.FindFirst then begin
                    ProdOrderRowID :=
                      ItemTrackingMgt.ComposeRowID(
                        Database::"Prod. Order Line", ProdOrderLine.Status.AsInteger(),
                        ProdOrderLine."Prod. Order No.", '', ProdOrderLine."Line No.", 0);
                    ItemTrackingMgt.CopyItemTracking(SalesLine.RowID1, ProdOrderRowID, true, true);

                    SalesLine.CalcFields("Reserved Quantity", "Reserved Qty. (Base)");
                    if ProdOrderLine."Remaining Qty. (Base)" > (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)")
                    then begin
                        ReservQty := (SalesLine."Outstanding Quantity" - SalesLine."Reserved Quantity");
                        ReservQtyBase := (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)");
                    end else begin
                        ReservQty := Round(ProdOrderLine."Remaining Qty. (Base)" / SalesLine."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision);
                        ReservQtyBase := ProdOrderLine."Remaining Qty. (Base)";
                    end;
                    SalesLineReserve.BindToProdOrder(SalesLine, ProdOrderLine, ReservQty, ReservQtyBase);
                    if SalesLine.Reserve = SalesLine.Reserve::Never then begin
                        SalesLine.Reserve := SalesLine.Reserve::Optional;
                        SalesLine.Modify();
                    end;
                    ProdOrderLine.Modify();
                end;
            end;

        if ProdOrder.Status = ProdOrder.Status::Released then
            ProdOrderStatusMgt.FlushProdOrder(ProdOrder, ProdOrder.Status, WorkDate);
    end;


    procedure CreateOrders(var SalesHeader: Record "Sales Header") OrdersCreated: Boolean
    var
        SalesLine: Record "Sales Line";
        Item: Record Item;
        SKU: Record "Stockkeeping Unit";
        Counter: Integer;
        DoCreateProdOrder: Boolean;
        EndLoop: Boolean;
        IsHandled: Boolean;
        ProductionOrdersCreated: Label 'Number of Production Order(s) created: %1';
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if not SalesLine.FindSet() then
            exit;

        repeat
            SalesLine.TestField("Shipment Date");
            SalesLine.CalcFields("Reserved Qty. (Base)");

            IsHandled := false;
            if IsHandled then
                exit;

            if SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" then begin
                if SKU.Get(SalesLine."Location Code", SalesLine."No.", SalesLine."Variant Code") then
                    DoCreateProdOrder := SKU."Replenishment System" = SKU."Replenishment System"::"Prod. Order"
                else begin
                    Item.Get(SalesLine."No.");
                    DoCreateProdOrder := Item."Replenishment System" = Item."Replenishment System"::"Prod. Order";
                end;
                if DoCreateProdOrder then begin
                    CreateProdOrder(SalesLine);//, NewStatus, NewOrderType)
                    Counter += 1;
                end;
            end;
        until (SalesLine.Next = 0) or EndLoop;

        Message(ProductionOrdersCreated, Format(Counter));
    end;

    procedure SelectPackageForShipment(var Rec: Record "Sales Header"; var UpdateCurrPage: Boolean)
    var
        ACOPackageHeader: Record "ACO Package Header";
        ACOPackageLine: Record "ACO Package Line";
        SalesLine: Record "Sales Line";
        TempSalesLine: Record "Sales Line" temporary;
        ACOAppSetup: Record "ACO App Setup";
        ReasonCode: Record "Reason Code";
        ProdOrderLine: Record "Prod. Order Line";
        ItemVariant: Record "Item Variant";
        ProdOrderFromSale: Codeunit "Create Prod. Order from Sale";
        ACOSelectionPackageLines: Page "ACO Selection Package Lines";
        ProductionOrderStatus: Enum "Production Order Status";
        ProdOrderNos: Text;
        NewNumberOfUnits: Decimal;
        FinishedNumberOfUnits: Decimal;
        ShowMessage: Boolean;
        ProductionOrderFinishedMsg: Label 'The following Production Orders have been set to Finished: %1.';
    begin
        ACOAppSetup.Get();
        ACOPackageLine.SetFilter("Sales Order No.", Rec."No.");
        ACOPackageLine.SetRange(Ship, false);
        if ACOPackageLine.FindSet() then
            repeat
                if ACOPackageHeader.Get(ACOPackageLine."Package No.") and (ACOPackageHeader."Sales Shipment No." = '') then
                    ACOPackageLine.Mark(true);
            until ACOPackageLine.Next() = 0;

        ACOPackageLine.MarkedOnly(true);
        ACOSelectionPackageLines.SetTableView(ACOPackageLine);
        ACOSelectionPackageLines.LookupMode(true);
        ACOSelectionPackageLines.Editable(true);

        if ACOSelectionPackageLines.RunModal() = Action::LookupOK then begin
            ACOSelectionPackageLines.SetSelectionFilter(ACOPackageLine);
            if ACOPackageLine.FindSet(true) then
                repeat
                    if TempSalesLine.Get(TempSalesLine."Document Type"::Order, ACOPackageLine."Sales Order No.", ACOPackageLine."Sales Line No") then begin
                        TempSalesLine.Quantity += ACOPackageLine.Quantity;
                        if ReasonCode.Get(ACOPackageLine."Reject Reason Code") then begin
                            if ReasonCode."ACO Billable" then
                                TempSalesLine."ACO Reject Billable" += ACOPackageLine.Quantity
                            else
                                TempSalesLine."ACO Reject Not Billable" += ACOPackageLine.Quantity;
                        end else
                            Clear(ReasonCode);

                        TempSalesLine.Modify();
                    end else begin
                        TempSalesLine.Init();
                        TempSalesLine."Document Type" := TempSalesLine."Document Type"::Order;
                        TempSalesLine."Document No." := ACOPackageLine."Sales Order No.";
                        TempSalesLine."Line No." := ACOPackageLine."Sales Line No";
                        TempSalesLine.Quantity := ACOPackageLine.Quantity;

                        if ReasonCode.Get(ACOPackageLine."Reject Reason Code") then begin
                            if ReasonCode."ACO Billable" then
                                TempSalesLine."ACO Reject Billable" := ACOPackageLine.Quantity
                            else
                                TempSalesLine."ACO Reject Not Billable" := ACOPackageLine.Quantity;
                        end else
                            Clear(ReasonCode);

                        TempSalesLine.Insert();
                    end;
                    ACOPackageLine.Ship := true;
                    ACOPackageLine.Modify();
                until ACOPackageLine.Next() = 0;

            if TempSalesLine.FindSet() then
                repeat
                    if SalesLine.Get(TempSalesLine."Document Type", TempSalesLine."Document No.", TempSalesLine."Line No.") then begin
                        ACOAppSetup.Get();

                        NewNumberOfUnits := SalesLine."Quantity Shipped";

                        if not ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then
                            Clear(ItemVariant);

                        if SalesLine."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then
                            NewNumberOfUnits := SalesLine."Quantity Shipped" / SalesLine."ACO Profile Length" / 1000;

                        if SalesLine."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                            NewNumberOfUnits := SalesLine."Quantity Shipped" / (SalesLine."ACO Profile Circumference" * SalesLine."ACO Profile Length");

                        NewNumberOfUnits := TempSalesLine.Quantity + NewNumberOfUnits;
                        NewNumberOfUnits := Round(NewNumberOfUnits, 1);

                        if NewNumberOfUnits >= SalesLine."ACO Number of Units" then begin
                            ShowMessage := true;
                            if NewNumberOfUnits > SalesLine."ACO Number of Units" then begin
                                ProdOrderLine.SetRange("ACO Source Type Enum", ProdOrderLine."ACO Source Type Enum"::"Sales Header");
                                ProdOrderLine.SetRange("ACO Source No.", SalesLine."Document No.");
                                ProdOrderLine.SetRange("ACO Source Line No.", SalesLine."Line No.");
                                if ProdOrderLine.FindFirst() then begin

                                    FinishedNumberOfUnits := ProdOrderLine."Finished Quantity";

                                    if not ItemVariant.Get(ProdOrderLine."Item No.", ProdOrderLine."Variant Code") then
                                        Clear(ItemVariant);

                                    if ProdOrderLine."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then
                                        FinishedNumberOfUnits := ProdOrderLine."Finished Quantity" / ItemVariant."ACO Number of Meters";

                                    if ProdOrderLine."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                                        FinishedNumberOfUnits := ProdOrderLine."Finished Quantity" * 1000 / (SalesLine."ACO Profile Circumference" * ItemVariant."ACO Number of Meters");

                                    FinishedNumberOfUnits := Round(FinishedNumberOfUnits, 1);

                                    if FinishedNumberOfUnits <> 0 then
                                        SalesLine.Validate("ACO Number of Units", FinishedNumberOfUnits)
                                    else
                                        SalesLine.Validate("ACO Number of Units", NewNumberOfUnits);

                                    UpdateSalesLine(SalesLine, TempSalesLine);

                                    // Finished Quantity Production ORder (103* area profile) compare to 78 ColliQty
                                    if (FinishedNumberOfUnits <= NewNumberOfUnits) then begin
                                        if FinishedNumberOfUnits < NewNumberOfUnits then begin
                                            // Create Production Order
                                            ProdOrderFromSale.SetHideValidationDialog(true);
                                            ProdOrderFromSale.CreateProdOrder(SalesLine, ProductionOrderStatus::Released, 1);
                                        end;
                                        FinishProductionOrder(SalesLine, ProdOrderNos);
                                    end;
                                end;
                            end else begin
                                UpdateSalesLine(SalesLine, TempSalesLine);
                                FinishProductionOrder(SalesLine, ProdOrderNos);
                            end;
                        end else begin
                            UpdateSalesLine(SalesLine, TempSalesLine);

                            if SalesLine."Qty. to Ship" = SalesLine."Outstanding Quantity" then
                                FinishProductionOrder(SalesLine, ProdOrderNos);
                        end;
                    end;
                until TempSalesLine.Next() < 1;

            TempSalesLine.DeleteAll();

            if ShowMessage then
                if ProdOrderNos <> '' then
                    Message(ProductionOrderFinishedMsg, ProdOrderNos);

            UpdateCurrPage := true;
        end;
    end;

    local procedure UpdateSalesLine(var SalesLine: Record "Sales Line"; SalesLine2: Record "Sales Line")
    var
        NewLineDiscountAmount: Decimal;
        RejectInvoiceDiscountLbl: Label 'Reject: %1 PCE Invoice / %2 PCE Discount';
    begin
        SalesLine.Validate("ACO Number of Units to Ship", SalesLine2.Quantity);
        SalesLine.Validate("ACO Number of Units to Invoice", SalesLine2.Quantity);
        SalesLine."ACO Reject Billable" := SalesLine2."ACO Reject Billable";
        SalesLine."ACO Reject Not Billable" := SalesLine2."ACO Reject Not Billable";
        if (SalesLine2."ACO Reject Billable" = 0) and (SalesLine2."ACO Reject Not Billable" = 0) then
            SalesLine."Description 2" := ''
        else
            SalesLine."Description 2" := StrSubstNo(RejectInvoiceDiscountLbl, SalesLine."ACO Reject Billable", SalesLine."ACO Reject Not Billable");

        NewLineDiscountAmount := SalesLine.Quantity / SalesLine."ACO Number of Units" * SalesLine."ACO Reject Not Billable" * SalesLine."Unit Price";
        SalesLine.Validate("Line Discount Amount", NewLineDiscountAmount);
        SalesLine.Modify();
    end;

    local procedure FinishProductionOrder(SalesLine: Record "Sales Line"; var ProdOrderNos: Text)
    var
        ProdOrderLine: Record "Prod. Order Line";
        ProductionOrder: Record "Production Order";
        ProdOrderStatusMgt: Codeunit "Prod. Order Status Management";
    begin
        ProdOrderLine.SetRange("ACO Source No.", SalesLine."Document No.");
        ProdOrderLine.SetRange("ACO Source Line No.", SalesLine."Line No.");
        if ProdOrderLine.FindSet() then
            repeat
                if ProductionOrder.Get(ProductionOrder.Status::Released, ProdOrderLine."Prod. Order No.") then begin
                    // Status Production Order to Finished
                    ProdOrderStatusMgt.ChangeProdOrderStatus(ProductionOrder, "Production Order Status"::Finished, Today(), false);
                    if ProdOrderNos = '' then
                        ProdOrderNos += ProductionOrder."No."
                    else
                        ProdOrderNos += ', ' + ProductionOrder."No.";
                end;
            until ProdOrderLine.Next() = 0;
    end;

    procedure PostProductionJournal(PackageHeaderNo: Code[20]; ProdOrderLine: Record "Prod. Order Line")
    var
        ProductionOrder: Record "Production Order";
        ProductionJnlMgt: Codeunit "Production Journal Mgt";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        // TODO Create Production Journal <<
        ACOSingleInstanceMgt.SetPostProductionJournal(true);

        if ProductionOrder.Get(ProdOrderLine."Status", ProdOrderLine."Prod. Order No.") then
            if ProdOrderLine.Get(ProductionOrder."Status", ProductionOrder."No.", ProdOrderLine."Line No.") then begin
                ProductionJnlMgt.Handling(ProductionOrder, ProdOrderLine."Line No.");
            end;

        ACOSingleInstanceMgt.SetPostProductionJournal(false);
        Commit();
        // TODO Create Production Journal >>
    end;
}