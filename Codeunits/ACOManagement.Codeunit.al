codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var Salesline: Record "Sales Line"; CustomerNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ACOLinkedHolder: Record "ACO Linked Holder";
        ACOLinkedPackaging: Record "ACO Linked Packaging";
        Item: Record Item;
        ACOColor: Record "ACO Color";
        ItemVariant: Record "Item Variant";
    begin
        if not ItemVariant.Get(Salesline."No.", Salesline."Variant Code") then
            Clear(ItemVariant);

        ACOLinkedHolder.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOLinkedHolder.SetRange("Customer No.", CustomerNo);

        if Item.Get(Salesline."No.") then
            if ACOColor.Get(Item."ACO Color") then
                ACOLinkedHolder.SetRange("Color Group Code", ACOColor."Color Group");

        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOLinkedHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

        if ACOLinkedHolder.FindFirst() then begin
            SalesHeader.Get(Salesline."Document Type", SalesLine."Document No.");
            if CheckStatusLinkedHolders(ACOLinkedHolder.Code, SalesHeader."Sell-to Customer No.", Salesline."ACO Profile Code", false) then
                Salesline."ACO Linked Holder" := ACOLinkedHolder.Code;
        end else
            Salesline."ACO Linked Holder" := '';

        ACOLinkedPackaging.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOLinkedPackaging.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOLinkedPackaging.SetRange("Length", ItemVariant."ACO Number of Meters" * 1000);

        if ACOLinkedPackaging.Count() = 1 then begin
            ACOLinkedPackaging.FindFirst();
            Salesline."ACO Packaging" := ACOLinkedPackaging.Code;
        end else
            Salesline."ACO Packaging" := '';
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
        ACOLinkedHolderType.SetRange("Profile Code", ProfileCode);
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
        ACOLinkedSupportHolder.SetRange("Profile Code", ProfileCode);
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
        ACOLinkedDistanceHolder.SetRange("Profile Code", ProfileCode);
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

    protected var
        HideValidationDialog: Boolean;

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
        ItemType: Record Item;
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
        ProdOrderFromSale: Codeunit "Create Prod. Order from Sale";
        ACOSelectionPackageLines: Page "ACO Selection Package Lines";
        ProductionOrderStatus: Enum "Production Order Status";
        ProdOrderNos: Text;
        ShowMessage: Boolean;
        PackageQuantityMsg: Label 'The package quantity is larger than the Sales Line quantity. A new Production Order has to be created before you can ship the package(s).';
        ProductionOrderFinishedMsg: Label 'The following Production Orders have been set to Finished: %1.';
        NoProductionOrderFinishedMsg: Label 'No Production Order have been set to Finished.';
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
                        if TempSalesLine.Quantity >= SalesLine."ACO Number of Units" then begin
                            ShowMessage := true;
                            if TempSalesLine.Quantity > SalesLine."ACO Number of Units" then begin
                                SalesLine.Validate("ACO Number of Units", TempSalesLine.Quantity);
                                UpdateSalesLine(SalesLine, TempSalesLine);

                                // Create Production Order
                                ProdOrderFromSale.SetHideValidationDialog(true);
                                ProdOrderFromSale.CreateProdOrder(SalesLine, ProductionOrderStatus::Released, 1);
                            end else
                                UpdateSalesLine(SalesLine, TempSalesLine);

                            // Message per case?
                            FinishProductionOrder(SalesLine, ProdOrderNos);
                        end else begin
                            UpdateSalesLine(SalesLine, TempSalesLine);

                            if SalesLine."Qty. to Ship" = SalesLine."Outstanding Quantity" then
                                FinishProductionOrder(SalesLine, ProdOrderNos);
                            // else
                            //     if SalesLine."Qty. to Ship" < SalesLine."Outstanding Quantity" then
                            //         FillProductionJournalAndPost(SalesLine);
                        end;
                    end;
                until TempSalesLine.Next() < 1;

            TempSalesLine.DeleteAll();

            if ShowMessage then begin
                if ProdOrderNos = '' then
                    Message(NoProductionOrderFinishedMsg)
                else
                    Message(ProductionOrderFinishedMsg, ProdOrderNos)
            end;
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

    local procedure FillProductionJournalAndPost(SalesLine: Record "Sales Line")
    var
        myInt: Integer;
    begin

    end;
}