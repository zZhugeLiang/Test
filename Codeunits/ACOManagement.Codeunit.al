codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var Salesline: Record "Sales Line"; CustomerNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ACOLinkedHolder: Record "ACO Linked Holder";
        ACOLinkedPackaging: Record "ACO Linked Packaging";
        ItemVariant: Record "Item Variant";
    begin
        if not ItemVariant.Get(Salesline."No.", Salesline."Variant Code") then
            Clear(ItemVariant);

        ACOLinkedHolder.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOLinkedHolder.SetRange("Customer No.", CustomerNo);
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
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        NewSalesLine := SalesLine;
        NewSalesLine."Line No." += LineNoIncrement;
        NewSalesLine.Description := CopyStr(NewDescription, 1, MaxStrLen(NewSalesLine.Description));
        NewSalesLine.Insert();
    end;


    var
        Text000: Label '%1 Prod. Order %2 has been created.';
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

        if not HideValidationDialog then
            Message(
              Text000,
              ProdOrder.Status, ProdOrder."No.");
    end;


    procedure CreateOrders(var SalesLine: Record "Sales Line") OrdersCreated: Boolean
    var
        Item: Record Item;
        SKU: Record "Stockkeeping Unit";
        CreateProdOrder: Boolean;
        EndLoop: Boolean;
        IsHandled: Boolean;
    begin
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
                    CreateProdOrder := SKU."Replenishment System" = SKU."Replenishment System"::"Prod. Order"
                else begin
                    Item.Get(SalesLine."No.");
                    CreateProdOrder := Item."Replenishment System" = Item."Replenishment System"::"Prod. Order";
                end;
                CreateProdOrder(SalesLine);//, NewStatus, NewOrderType)
            end;
        until (SalesLine.Next = 0) or EndLoop;

    end;

    // procedure Copy(ProdOrder2: Record "Production Order"; Direction: Option Forward,Backward; VariantCode: Code[10]; LetDueDateDecrease: Boolean): Boolean
    // var
    //     SalesHeader: Record "Sales Header";
    //     ErrorOccured: Boolean;
    //     IsHandled: Boolean;
    // begin
    //     if IsHandled then
    //         exit(ErrorOccured);


    //     ProdOrder2.TestField("Source No.");
    //     ProdOrder2.TestField("Starting Time");
    //     ProdOrder2.TestField("Starting Date");
    //     ProdOrder2.TestField("Ending Time");
    //     ProdOrder2.TestField("Ending Date");
    //     if Direction = Direction::Backward then
    //         ProdOrder2.TestField("Due Date");

    //     ProdOrder := ProdOrder2;

    //     CreateProdOrderLine(ProdOrder, VariantCode, ErrorOccured);

    //     if not ProcessProdOrderLines(Direction, LetDueDateDecrease) then
    //         ErrorOccured := true;

    //     CheckMultiLevelStructure(Direction, true, LetDueDateDecrease);


    //     exit(not ErrorOccured);
    // end;


    // local procedure CreateProdOrderLine(ProdOrder: Record "Production Order"; VariantCode: Code[10]; var ErrorOccured: Boolean)
    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     ProdOrderLine.LockTable();
    //     ProdOrderLine.SetRange(Status, ProdOrder.Status);
    //     ProdOrderLine.SetRange("Prod. Order No.", ProdOrder."No.");
    //     ProdOrderLine.DeleteAll(true);

    //     NextProdOrderLineNo := 10000;

    //     InsertNew := false;

    //     case ProdOrder."Source Type" of
    //         ProdOrder."Source Type"::"Sales Header":
    //             begin
    //                 InsertNew := true;
    //                 if ProdOrder.Status <> ProdOrder.Status::Simulated then
    //                     SalesHeader.Get(SalesHeader."Document Type"::Order, ProdOrder."Source No.")
    //                 else
    //                     SalesHeader.Get(SalesHeader."Document Type"::Quote, ProdOrder."Source No.");
    //                 if not CopyFromSalesOrder(SalesHeader) then
    //                     ErrorOccured := true;
    //             end;
    //     end;

    // end;

    // local procedure CopyFromSalesOrder(SalesHeader: Record "Sales Header"): Boolean
    // var
    //     SalesPlanLine: Record "Sales Planning Line" temporary;
    //     Location: Record Location;
    //     LeadTimeMgt: Codeunit "Lead-Time Management";
    //     ItemTrackingMgt: Codeunit "Item Tracking Management";
    //     SalesLineReserve: Codeunit "Sales Line-Reserve";
    //     ErrorOccured: Boolean;
    //     QuantityBase: Decimal;
    //     //
    //     SalesLine: Record "Sales Line";
    //     ProdOrderLine: Record "Prod. Order Line";
    // //
    // begin
    //     SalesLine.SetRange("Document Type", SalesHeader."Document Type");
    //     SalesLine.SetRange("Document No.", SalesHeader."No.");
    //     if SalesLine.FindSet then
    //         repeat
    //             SalesLine.CalcFields("Reserved Quantity");
    //             if (SalesLine.Type = SalesLine.Type::Item) and
    //                (SalesLine."No." <> '') and
    //                ((SalesLine."Outstanding Quantity" - SalesLine."Reserved Quantity") <> 0)
    //             then
    //                 if IsReplSystemProdOrder(SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code") then begin
    //                     SalesPlanLine.Init();
    //                     SalesPlanLine."Sales Order No." := SalesLine."Document No.";
    //                     SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
    //                     SalesPlanLine.Validate("Item No.", SalesLine."No.");
    //                     SalesPlanLine.Insert();
    //                 end;
    //         until SalesLine.Next = 0;

    //     SalesPlanLine.SetCurrentKey("Low-Level Code");
    //     if SalesPlanLine.FindSet then
    //         repeat
    //             SalesLine.Get(SalesHeader."Document Type", SalesPlanLine."Sales Order No.", SalesPlanLine."Sales Order Line No.");
    //             SalesLine.CalcFields("Reserved Quantity");

    //             InitProdOrderLine(SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code");
    //             ProdOrderLine.Description := SalesLine.Description;
    //             ProdOrderLine."Description 2" := SalesLine."Description 2";
    //             SalesLine.CalcFields("Reserved Qty. (Base)");
    //             QuantityBase := SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)";
    //             ProdOrderLine.Validate("Quantity (Base)", QuantityBase);

    //             if Location.Get(ProdOrderLine."Location Code") and not Location."Require Pick" and (SalesLine."Bin Code" <> '') then
    //                 ProdOrderLine."Bin Code" := SalesLine."Bin Code";

    //             ProdOrderLine."Due Date" := SalesLine."Shipment Date";
    //             ProdOrderLine."Ending Date" :=
    //               LeadTimeMgt.PlannedEndingDate(ProdOrderLine."Item No.", ProdOrderLine."Location Code", '', ProdOrderLine."Due Date", '', 2);
    //             ProdOrderLine.Validate("Ending Date");

    //             InsertProdOrderLine;
    //             if ProdOrderLine.HasErrorOccured then
    //                 ErrorOccured := true;
    //             ItemTrackingMgt.CopyItemTracking(SalesLine.RowID1, ProdOrderLine.RowID1, true, true);

    //             if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin // Not simulated
    //                 ProdOrderLine.CalcFields("Reserved Quantity", "Reserved Qty. (Base)");
    //                 SalesLineReserve.BindToProdOrder(SalesLine, ProdOrderLine,
    //                   ProdOrderLine."Remaining Quantity" - ProdOrderLine."Reserved Quantity",
    //                   ProdOrderLine."Remaining Qty. (Base)" - ProdOrderLine."Reserved Qty. (Base)");
    //             end;
    //             ProdOrderLine.Modify();
    //         until (SalesPlanLine.Next = 0);
    //     exit(not ErrorOccured);
    // end;


    // local procedure IsReplSystemProdOrder(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]): Boolean
    // var
    //     SKU: Record "Stockkeeping Unit";
    //     Item: Record Item;
    //     IsHandled: Boolean;
    //     ReplanSystemProdOrder: Boolean;
    // begin
    //     OnBeforeIsReplSystemProdOrder(SalesLine, ReplanSystemProdOrder, IsHandled);
    //     if IsHandled then
    //         exit(ReplanSystemProdOrder);

    //     if SKU.Get(LocationCode, ItemNo, VariantCode) then
    //         exit(SKU."Replenishment System" = SKU."Replenishment System"::"Prod. Order");

    //     Item.Get(ItemNo);
    //     exit(Item."Replenishment System" = Item."Replenishment System"::"Prod. Order");
    // end;



    // local procedure InitProdOrderLine(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10])
    // var
    //     Item: Record Item;
    // begin
    //     ProdOrderLine.Init();
    //     ProdOrderLine.SetIgnoreErrors;
    //     ProdOrderLine.Status := ProdOrder.Status;
    //     ProdOrderLine."Prod. Order No." := ProdOrder."No.";
    //     ProdOrderLine."Line No." := NextProdOrderLineNo;
    //     ProdOrderLine."Routing Reference No." := ProdOrderLine."Line No.";
    //     OnInitProdOrderLineBeforeAssignItemNo(ProdOrderLine, ItemNo, VariantCode, LocationCode);
    //     ProdOrderLine.Validate("Item No.", ItemNo);
    //     ProdOrderLine."Location Code" := LocationCode;
    //     ProdOrderLine."Variant Code" := VariantCode;
    //     OnInitProdOrderLineAfterVariantCode(ProdOrderLine, VariantCode);
    //     if (LocationCode = ProdOrder."Location Code") and (ProdOrder."Bin Code" <> '') then
    //         ProdOrderLine.Validate("Bin Code", ProdOrder."Bin Code")
    //     else
    //         CalcProdOrder.SetProdOrderLineBinCodeFromRoute(ProdOrderLine, ProdOrderLine."Location Code", ProdOrderLine."Routing No.");

    //     Item.Get(ItemNo);
    //     ProdOrderLine."Scrap %" := Item."Scrap %";
    //     OnInitProdOrderLineAfterScrap(ProdOrderLine, ProdOrder);
    //     ProdOrderLine."Due Date" := ProdOrder."Due Date";
    //     ProdOrderLine."Starting Date" := ProdOrder."Starting Date";
    //     ProdOrderLine."Starting Time" := ProdOrder."Starting Time";
    //     ProdOrderLine."Ending Date" := ProdOrder."Ending Date";
    //     ProdOrderLine."Ending Time" := ProdOrder."Ending Time";
    //     ProdOrderLine."Planning Level Code" := 0;
    //     ProdOrderLine."Inventory Posting Group" := Item."Inventory Posting Group";
    //     ProdOrderLine.UpdateDatetime;
    //     ProdOrderLine.Validate("Unit Cost");

    //     OnAfterInitProdOrderLine(ProdOrderLine, ProdOrder, SalesLine);

    //     NextProdOrderLineNo := NextProdOrderLineNo + 10000;
    // end;

    // local procedure MyProcedure()
    // begin

    //     InsertNew := true;
    //     if ProdOrder.Status <> ProdOrder.Status::Simulated then
    //         SalesHeader.Get(SalesHeader."Document Type"::Order, ProdOrder."Source No.")
    //     else
    //         SalesHeader.Get(SalesHeader."Document Type"::Quote, ProdOrder."Source No.");
    //     if not CopyFromSalesOrder(SalesHeader) then
    //         ErrorOccured := true;
    // end;
}