codeunit 50000 "ACO Event Subscribers"
{
    Permissions = TableData "Item Ledger Entry" = rm;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
    local procedure SalesHeader_OnAfterValidate_SelltoCustomerNo(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Rec.IsTemporary() then
            exit;

        if Customer.Get(Rec."Sell-to Customer No.") then begin
            Rec."ACO Extra to Enumerate" := Customer."ACO Extra to Enumerate";
            Rec."ACO Thick Staining Time" := Customer."ACO Thick Staining Time";
            Rec."ACO Thin Staining Time" := Customer."ACO Thin Staining Time";
            Rec."ACO Week Capacity" := Customer."ACO Week Capacity";
            Rec."ACO Customer Comment" := Customer."ACO Comment Sales Order";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'ACO Delivery Date', false, false)]
    local procedure SalesHeader_OnAfterValidate_ACODeliveryDate(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec."ACO Delivery Day" := Date2DWY(Rec."ACO Delivery Date", 1);
        Rec."ACO Delivery Week" := Date2DWY(Rec."ACO Delivery Date", 2);
        Rec."ACO Delivery Year" := Date2DWY(Rec."ACO Delivery Date", 3);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'ACO Logged In DateTime', false, false)]
    local procedure SalesHeader_OnAfterValidate_ACOLoggedInDateTime(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec.Validate("ACO Delivery Date", DT2Date(Rec."ACO Logged In DateTime"));
        Rec."ACO Logged In Day" := Date2DWY(DT2Date(Rec."ACO Logged In DateTime"), 1);
        Rec."ACO Logged In Week" := Date2DWY(DT2Date(Rec."ACO Logged In DateTime"), 2);
        Rec."ACO Logged In Year" := Date2DWY(DT2Date(Rec."ACO Logged In DateTime"), 3);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Document Date', false, false)]
    local procedure SalesHeader_OnAfterValidate_DocumentDate(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec."ACO Document Date Day" := Date2DWY(Rec."Document Date", 1);
        Rec."ACO Document Date Week" := Date2DWY(Rec."Document Date", 2);
        Rec."ACO Document Date Year" := Date2DWY(Rec."Document Date", 3);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Shipping Agent Code', false, false)]
    local procedure SalesHeader_OnAfterValidate_ShippingAgentCode(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        ShippingAgent: Record "Shipping Agent";
    begin
        if ShippingAgent.Get(Rec."Shipping Agent Code") then
            Rec."ACO Own Shipping Agent" := ShippingAgent."ACO Own";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Unit of Measure Code', false, false)]
    local procedure SalesLine_OnAfterValidate_UnitofMeasureCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ItemUnitofMeasure: Record "Item Unit of Measure";
    begin
        if Rec.Type = Rec.Type::Item then
            if ItemUnitofMeasure.Get(Rec."No.", Rec."Unit of Measure Code") then begin
                Rec."ACO Profile Length" := ItemUnitofMeasure."ACO Length";
                Rec."ACO Profile Circumference" := ItemUnitofMeasure."ACO Circumference";
                Rec."ACO Correction Factor Profile" := ItemUnitofMeasure."ACO Correction Factor";
                Rec.ACOGetPricingPrice();
            end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnBeforeValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetSalesLineProfileCode(Rec."ACO Profile Code");
        ACOSingleInstanceMgt.SetSalesLineCustomerItemNo(Rec."ACO Customer Item No.");
        ACOSingleInstanceMgt.SetProfileCustomerPK(Rec."ACO Profile Customer PK");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        ItemReference: Record "Item Reference";
        SalesHeader: Record "Sales Header";
        RoutingLine: Record "Routing Line";
        ACOAppSetup: Record "ACO App Setup";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOPretreatment: Record "ACO Pretreatment";
        ItemUnitofMeasure: Record "Item Unit of Measure";
        ACOCategory: Record "ACO Category";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
        ACOManagement: Codeunit "ACO Management";
    begin
        if Rec.IsTemporary() then
            exit;

        Rec."ACO Profile Code" := ACOSingleInstanceMgt.GetSalesLineProfileCode();
        Rec."ACO Customer Item No." := ACOSingleInstanceMgt.GetSalesLineCustomerItemNo();
        Rec."ACO Profile Customer PK" := ACOSingleInstanceMgt.GetProfileCustomerPK();

        ACOSingleInstanceMgt.SetSalesLineProfileCode('');
        ACOSingleInstanceMgt.SetSalesLineCustomerItemNo('');
        ACOSingleInstanceMgt.SetProfileCustomerPK('');

        ACOAppSetup.Get();

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                Rec."ACO Thin Staining Time Profile" := Item."ACO Thin Staining Time";
                Rec."ACO Thick St. Time Profile" := Item."ACO Thick Staining Time";
                Rec."ACO Max. Curr. Density Profile" := Item."ACO Maximum Current Density";
                Rec."ACO Min. Curr. Density Profile" := Item."ACO Minimum Current Density";
                Rec."ACO Pretreatment" := Item."ACO Pretreatment";
                Rec."ACO Extra to Enumerate Profile" := Item."ACO Extra to Enumerate";

                if ACOPretreatment.Get(Rec."ACO Pretreatment") then begin
                    Rec."ACO British Standard" := ACOPretreatment."British Standard";
                    Rec."ACO Maximum Current Density PT" := ACOPretreatment."Maximum Current Density";
                    Rec."ACO Minimum Current Density PT" := ACOPretreatment."Minimum Current Density";
                end;

                Rec."ACO Posttreatment" := Item."ACO Posttreatment";
                Rec."ACO Particularity" := Item."ACO Particularity";
                Rec."ACO Not Measurable" := Item."ACO Not Measurable";
                Rec."ACO Charges per Bath Profile" := Item."ACO Charges per Bath Profile";

                if ItemUnitofMeasure.Get(Rec."No.", Rec."Unit of Measure Code") then begin
                    Rec."ACO Profile Length" := ItemUnitofMeasure."ACO Length";
                    Rec."ACO Profile Circumference" := ItemUnitofMeasure."ACO Circumference";
                    Rec."ACO Correction Factor Profile" := ItemUnitofMeasure."ACO Correction Factor";
                end;

                Rec."ACO Profile Category" := Item."ACO Category Code";
                if ACOCategory.Get(Rec."ACO Profile Category") then
                    Rec."ACO Max. Cur. Density Category" := ACOCategory."Maximum Current Density";

                Rec.Validate("ACO Area Profile", Rec."ACO Profile Circumference" * Rec."ACO Profile Length" / 1000000);
                Rec.Validate("ACO Layer Thickness", Item."ACO Layer Thickness Code");
                Rec."ACO Charges per Bath Profile" := Item."ACO Charges per Bath Profile";

                SalesHeader.Get(Rec."Document Type", Rec."Document No.");

                ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
            end;

        Rec.Validate("ACO Color", Item."ACO Color");
        if not ACOSingleInstanceMgt.GetSkipAssignItemReference() then
            Rec."ACO Customer Item Reference" := Rec."Item Reference No.";

        if ACOAppSetup."Sawing Routing No." <> '' then begin
            RoutingLine.SetRange("Routing No.", Item."Routing No.");
            if RoutingLine.FindSet() then
                repeat
                    Rec.Validate("ACO Sawing", RoutingLine."No." = ACOAPPSetup."Sawing Routing No.");
                until (RoutingLine.Next() = 0) or Rec."ACO Sawing";
        end;

        ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
        ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
        if not ACOProfileCustomer.IsEmpty() then
            Rec.Validate("ACO Profile Code");

        Rec.ACOSetDescription();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Item Reference No.', false, false)]
    local procedure SalesLine_OnAfterValidate_ItemReferenceNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."ACO Customer Item Reference" := Rec."Item Reference No.";
        Rec.ACOSetDescription();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'Shipment Date', false, false)]
    local procedure SalesLine_OnBeforeValidate_ShipmentDate(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ReservEntry: Record "Reservation Entry";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        ReservationCheckDateConfl: Codeunit "Reservation-Check Date Confl.";
        ReservMgt: Codeunit "Reservation Management";
    begin
        if not SalesLineReserve.FindReservEntry(Rec, ReservEntry) then
            exit;

        ReservationCheckDateConfl.UpdateDate(ReservEntry, Rec."Shipment Date");

        ReservMgt.SetReservSource(Rec);
        ReservMgt.ClearSurplus();
        ReservMgt.AutoTrack(Rec."Outstanding Qty. (Base)");

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Shipment Date', false, false)]
    local procedure SalesLine_OnAfterValidate_ShipmentDate(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ProductionOrder: Record "Production Order";
        ProductionOrderLine: Record "Prod. Order Line";
        ProdOrderLine: Record "Prod. Order Line";
        ReservationEntry: Record "Reservation Entry";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        UOMMgt: Codeunit "Unit of Measure Management";
        ReservQty: Decimal;
        ReservQtyBase: Decimal;
        ProdOrderRowID: Text[250];
    begin
        if Rec.IsTemporary() then
            exit;

        ProductionOrderLine.SetFilter("Prod. Order No.", '<>%1', '');
        ProductionOrderLine.SetRange("ACO Source No.", Rec."Document No.");
        ProductionOrderLine.SetRange("ACO Source Line No.", Rec."Line No.");
        if ProductionOrderLine.FindFirst() then begin
            if ProductionOrder.Get(ProductionOrderLine.Status, ProductionOrderLine."Prod. Order No.") then begin
                ProductionOrder.SetUpdateEndDate();
                ProductionOrder.Validate("Due Date", Rec."Shipment Date");
                ProductionOrder.Modify(true);


                ReservationEntry.SetRange("Source ID", Rec."Document No.");
                ReservationEntry.SetRange("Source Ref. No.", Rec."Line No.");
                if ReservationEntry.IsEmpty() then begin
                    ProdOrderLine.Get(ProductionOrderLine.Status, ProductionOrderLine."Prod. Order No.", ProductionOrderLine."Line No.");
                    ProdOrderRowID :=
                      ItemTrackingMgt.ComposeRowID(
                        Database::"Prod. Order Line", ProdOrderLine.Status.AsInteger(),
                        ProdOrderLine."Prod. Order No.", '', ProdOrderLine."Line No.", 0);
                    ItemTrackingMgt.CopyItemTracking(Rec.RowID1, ProdOrderRowID, true, true);

                    Rec.CalcFields("Reserved Quantity", "Reserved Qty. (Base)");
                    if ProdOrderLine."Remaining Qty. (Base)" > (Rec."Outstanding Qty. (Base)" - Rec."Reserved Qty. (Base)")
                    then begin
                        ReservQty := (Rec."Outstanding Quantity" - Rec."Reserved Quantity");
                        ReservQtyBase := (Rec."Outstanding Qty. (Base)" - Rec."Reserved Qty. (Base)");
                    end else begin
                        ReservQty := Round(ProdOrderLine."Remaining Qty. (Base)" / Rec."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision);
                        ReservQtyBase := ProdOrderLine."Remaining Qty. (Base)";
                    end;
                    SalesLineReserve.BindToProdOrder(Rec, ProdOrderLine, ReservQty, ReservQtyBase);
                    if Rec.Reserve = Rec.Reserve::Never then begin
                        Rec.Reserve := Rec.Reserve::Optional;
                        Rec.Modify();
                    end;
                    ProdOrderLine.Modify();
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Color', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOColor(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ACOColor: Record "ACO Color";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if ACOColor.Get(Rec."ACO Color") then begin
                Rec."ACO Min. Current Density Color" := ACOColor."Minimum Current Density";
                Rec."ACO Max. Current Density Color" := ACOColor."Maximum Current Density";
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Layer Thickness', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOLayerThickness(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ACOLayerThickness: Record "ACO Layer Thickness";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if ACOLayerThickness.Get(Rec."ACO Layer Thickness") then begin
                Rec."ACO Minimum Current Density LT" := ACOLayerThickness."Minimum Current Density";
                Rec."ACO Maximum Current Density LT" := ACOLayerThickness."Maximum Current Density";
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Profile Code', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOProfileCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        Item: Record Item;
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOCategory: Record "ACO Category";
        CustomerNotLinkedToProfileErr: Label 'Customer %1 with shipping code %2 does not have a link with the profile %3.';
        ProfileInactiveErr: Label 'Profile %1 is inactive for Customer %2.';
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec."ACO Profile Code" = '' then
            exit;

        // if ACOProfile.Get(Rec."ACO Profile Code") then begin
        if Item.Get(Rec."No.") then begin
            //ACOProfile.TestField(Circumference);

            SalesHeader.Get(Rec."Document Type", Rec."Document No.");

            //Rec."ACO Max. Curr. Density Profile" := Item."ACO Maximum Current Density";
            Rec."ACO Max. Curr. Density Profile" := Item."ACO Maximum Current Density";
            Rec."ACO Min. Curr. Density Profile" := Item."ACO Minimum Current Density";

            if not ACOProfileCustomer.Get(Rec."ACO Profile Code", SalesHeader."Sell-to Customer No.", Rec."ACO Customer Item No.") then begin
                ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
                ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                if not ACOProfileCustomer.FindFirst() then
                    Error(CustomerNotLinkedToProfileErr, SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code", Rec."ACO Profile Code");
            end;

            if ACOProfileCustomer.Status = ACOProfileCustomer.Status::Inactive then
                Error(ProfileInactiveErr, ACOProfile.Code, SalesHeader."Sell-to Customer No.");

            Rec."ACO Profile Description" := ACOProfile.Description;
            // Rec."ACO Profile Category" := ACOProfile.Category;
            Rec."ACO Correction Factor Profile" := ACOProfile."Correction Factor";
            Rec."ACO Height Level Profile" := ACOProfile."Height Level";

            Rec."ACO Attach Method Code Profile" := ACOProfile."Attach Method Code";
            Rec."ACO Type of Clamp Code" := ACOProfile."Type of Clamp Code";
            Rec."ACO Holders Profile" := ACOProfile.Holders;

            Rec."ACO Thin Staining Time Profile" := ACOProfileCustomer."Thin Staining Time";
            Rec."ACO Thick St. Time Profile" := ACOProfileCustomer."Thick Staining Time";
            Rec."ACO Extra to Enumerate Profile" := ACOProfileCustomer."Extra to Enumerate";
            Rec."ACO Customer Item No." := ACOProfileCustomer."Customer Item No.";
            Rec."ACO Profile Cust. Description" := ACOProfileCustomer."Profile Description";
            Rec."ACO Profile Customer PK" := ACOProfileCustomer."PK as a field";

            if ACOCategory.Get(Rec."ACO Profile Category") then
                Rec."ACO Max. Cur. Density Category" := ACOCategory."Maximum Current Density";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Start Length', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOFinalLength(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."ACO Qty. After Production" := Rec.Quantity;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure SalesLine_OnBeforeValidate_Quantity(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec.Quantity := Round(Rec.Quantity, 0.001);
        Rec.PlanPriceCalcByField(Rec.FieldNo(Quantity));
        if Rec."ACO Manual Unit Price" then
            Rec.ACOSetACOUnitPrice(Rec."Unit Price")
        else
            Rec."Unit Price" := 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure SalesLine_OnAfterValidate_Quantity(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec.ClearFieldCausedPriceCalculation();

        if Rec."Unit Price" = 0 then
            Rec.ACOGetPricingPrice();

        if Rec."ACO Manual Unit Price" then begin
            Rec.Validate("Unit Price", Rec.ACOGetACOUnitPrice());
            Rec.ACOSetACOUnitPrice(0);
        end else
            Rec.ACOCalculateUnitPrice();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure SalesLine_OnBeforeValidate_QtytoShip(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Qty. to Ship" := Round(Rec."Qty. to Ship", 0.001);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'Qty. to Invoice', false, false)]
    local procedure SalesLine_OnBeforeValidate_QtytoInvoice(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Qty. to Invoice" := Round(Rec."Qty. to Invoice", 0.001);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Unit Price', false, false)]
    local procedure SalesLine_OnAfterValidate_UnitPrice(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        ACOProfileCustomer: Record "ACO Profile Customer";
    begin
        if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") and Item."ACO Sawing" then begin
            SalesHeader.Get(Rec."Document Type", Rec."Document No.");
            if ACOProfileCustomer.Get(Rec."ACO Profile Code", SalesHeader."Sell-to Customer No.", Rec."ACO Customer Item No.") then
                Rec."Unit Price" := Rec."Unit Price" - (Rec."Unit Price" * ACOProfileCustomer."Sawing Discount" / 100);
        end;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Variant Code', false, false)]
    // local procedure SalesLine_OnAfterValidate_VariantCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // var
    //     SalesHeader: Record "Sales Header";
    //     ItemVariant: Record "Item Variant";
    //     ACOManagement: Codeunit "ACO Management";
    // begin
    //     if not ItemVariant.Get(Rec."No.", Rec."Variant Code") then
    //         Clear(ItemVariant);

    //     SalesHeader.Get(Rec."Document Type", Rec."Document No.");

    //     ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitOutstandingQty', '', false, false)]
    local procedure SalesLine_OnAfterInitOutstandingQty(var SalesLine: Record "Sales Line");
    begin
        SalesLine."Outstanding Quantity" := Round(SalesLine."Outstanding Quantity", 0.001);
        SalesLine."Outstanding Qty. (Base)" := Round(SalesLine."Outstanding Qty. (Base)", 0.001);
        SalesLine."Return Qty. Rcd. Not Invd." := Round(SalesLine."Return Qty. Rcd. Not Invd.", 0.001);
        SalesLine."Ret. Qty. Rcd. Not Invd.(Base)" := Round(SalesLine."Ret. Qty. Rcd. Not Invd.(Base)", 0.001);
        SalesLine."Qty. Shipped Not Invoiced" := Round(SalesLine."Qty. Shipped Not Invoiced", 0.001);
        SalesLine."Qty. Shipped Not Invd. (Base)" := Round(SalesLine."Qty. Shipped Not Invd. (Base)", 0.001);
    end;
    // /////
    // [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnAfterInsertEvent', '', false, false)]
    // local procedure ACOBathSheetLine_OnAfterInsert(var Rec: Record "Prod. Order Line"; RunTrigger: Boolean)
    // var
    //     Done: Integer;
    // begin
    //     Done := 1;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnAfterModifyEvent', '', false, false)]
    // local procedure ACOBathSheetLine_OnAfterModify(var Rec: Record "Prod. Order Line"; var xRec: Record "Prod. Order Line"; RunTrigger: Boolean)
    // var
    //     Done: Integer;
    // begin
    //     Done := 2;
    // end;
    // ////

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Reference Management", 'OnValidateSalesReferenceNoOnBeforeAssignNo', '', false, false)]
    local procedure OnValidateSalesReferenceNoOnBeforeAssignNo(var SalesLine: Record "Sales Line"; ReturnedItemReference: Record "Item Reference");
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetSkipAssignItemReference(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Reference Management", 'OnValidateSalesReferenceNoOnAfterAssignNo', '', false, false)]
    local procedure OnValidateSalesReferenceNoOnAfterAssignNo(var SalesLine: Record "Sales Line"; ReturnedItemReference: Record "Item Reference");
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        SalesLine."ACO Customer Item Reference" := ReturnedItemReference."Reference No.";
        ACOSingleInstanceMgt.SetSkipAssignItemReference(false);
    end;

    [EventSubscriber(ObjectType::Table, Database::"ACO Bath Sheet Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure ACOBathSheetLine_OnAfterDelete(var Rec: Record "ACO Bath Sheet Line"; RunTrigger: Boolean)
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        if Rec.IsTemporary() then
            exit;

        if ProdOrderLine.Get(Rec."Production Order Status", Rec."Production Order No.", Rec."Production Order Line No.") then begin
            ProdOrderLine."ACO Remaining Quantity" += Rec.Quantity;
            ProdOrderLine."ACO Complete" := false;
            ProdOrderLine.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostUpdateOrderLineModifyTempLine', '', false, false)]
    local procedure SalesPost_OnBeforePostUpdateOrderLineModifyTempLine(var TempSalesLine: Record "Sales Line" temporary; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean)
    begin
        if TempSalesLine."Qty. to Ship" = 0 then
            TempSalesLine."ACO Number of Units to Ship" := 0;
        if TempSalesLine."Qty. to Invoice" = 0 then
            TempSalesLine."ACO Number of Units to Invoice" := 0;
        TempSalesLine."ACO Reject Billable Shipped" += TempSalesLine."ACO Reject Billable";
        TempSalesLine."ACO Rej. Not Billable Shipped" += TempSalesLine."ACO Reject Not Billable";
        TempSalesLine."ACO Reject Billable" := 0;
        TempSalesLine."ACO Reject Not Billable" := 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptHeaderInsert', '', false, false)]
    local procedure SalesPost_OnAfterSalesShptHeaderInsert(var SalesShipmentHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; SuppressCommit: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header")
    var
        ACOPackageHeader: Record "ACO Package Header";
        ACOPackageLine: Record "ACO Package Line";
        PackageNo: Code[20];
    begin
        ACOPackageLine.SetCurrentKey("Sales Order No.", Ship);
        ACOPackageLine.SetRange("Sales Order No.", SalesHeader."No.");
        ACOPackageLine.Setrange(Ship, true);
        if ACOPackageLine.FindSet() then
            repeat
                if ACOPackageLine."Package No." <> PackageNo then begin
                    ACOPackageHeader.Get(ACOPackageLine."Package No.");
                    ACOPackageHeader."Sales Shipment No." := SalesShipmentHeader."No.";
                    ACOPackageHeader.Modify();
                end;
                PackageNo := ACOPackageLine."Package No.";
            until ACOPackageLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesShptLineInsert', '', false, false)]
    local procedure SalesPost_OnBeforeSalesShptLineInsert(var SalesShptLine: Record "Sales Shipment Line"; SalesShptHeader: Record "Sales Shipment Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; PostedWhseShipmentLine: Record "Posted Whse. Shipment Line"; SalesHeader: Record "Sales Header"; WhseShip: Boolean; WhseReceive: Boolean; ItemLedgShptEntryNo: Integer; xSalesLine: record "Sales Line"; var TempSalesLineGlobal: record "Sales Line" temporary; var IsHandled: Boolean)
    begin
        SalesShptLine."ACO Number of Units" := SalesLine."ACO Number of Units to Ship";
        SalesShptLine."ACO Reject Billable Shipped" := SalesLine."ACO Reject Billable";
        SalesShptLine."ACO Rej. Not Billable Shipped" := SalesLine."ACO Reject Not Billable";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvLineInsert', '', false, false)]
    local procedure SalesPost_OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean)
    begin
        SalesInvLine."ACO Number of Units" := SalesLine."ACO Number of Units to Invoice";
        SalesInvLine."ACO Reject Billable Shipped" := SalesLine."ACO Reject Billable";
        SalesInvLine."ACO Rej. Not Billable Shipped" := SalesLine."ACO Reject Not Billable";
        SalesInvLine."ACO Reject Billable Shipped" := SalesLine."ACO Reject Billable Shipped";
        SalesInvLine."ACO Rej. Not Billable Shipped" := SalesLine."ACO Rej. Not Billable Shipped";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Prod. Order Lines", 'OnBeforeProdOrderLineInsert', '', false, false)]
    local procedure CreateProdOrderLines_OnBeforeProdOrderLineInsert(var ProdOrderLine: Record "Prod. Order Line"; var ProductionOrder: Record "Production Order"; SalesLineIsSet: Boolean; var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        ItemVariant: Record "Item Variant";
    begin
        ProdOrderLine."ACO Source Type Enum" := ProductionOrder."Source Type";
        ProdOrderLine."ACO Source No." := ProductionOrder."Source No.";
        ProdOrderLine."ACO Source Line No." := SalesLine."Line No.";
        ProdOrderLine."ACO Profile Code" := SalesLine."ACO Profile Code";

        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        if SalesHeader."ACO Large Line" then
            ProdOrderLine."ACO Production Line" := ProdOrderLine."ACO Production Line"::Long
        else
            ProdOrderLine."ACO Production Line" := ProdOrderLine."ACO Production Line"::Short;

        ProdOrderLine."ACO Number of Units" := SalesLine."ACO Number of Units";
        ProdOrderLine."ACO Remaining Quantity" := SalesLine."ACO Number of Units";
        ProdOrderLine."ACO Charges per Bath Profile" := SalesLine."ACO Charges per Bath Profile";
        ProdOrderLine."ACO Quantity Charges" := SalesLine."ACO Quantity Charges";

        if not ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then
            Clear(ItemVariant);

        if SalesLine."ACO Sawing" then
            ProdOrderLine."ACO Total m2" := SalesLine."ACO Profile Circumference" * ItemVariant."ACO Number of Meters" * SalesLine."ACO Number of Units" / 1000;

        if ProdOrderLine."ACO Number of Units" <> 0 then
            ProdOrderLine."ACO Profile m2 per Qty." := ProdOrderLine."ACO Total m2" / ProdOrderLine."ACO Number of Units";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ACO Create Prod. Order Lines", 'OnBeforeProdOrderLineInsert', '', false, false)]
    local procedure ACOCreateProdOrderLines_OnBeforeProdOrderLineInsert(var ProdOrderLine: Record "Prod. Order Line"; var ProductionOrder: Record "Production Order"; SalesLineIsSet: Boolean; var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        ItemVariant: Record "Item Variant";
    begin
        ProdOrderLine."ACO Source Type Enum" := ProductionOrder."Source Type";
        ProdOrderLine."ACO Source No." := ProductionOrder."Source No.";
        ProdOrderLine."ACO Source Line No." := SalesLine."Line No.";
        ProdOrderLine."ACO Profile Code" := SalesLine."ACO Profile Code";

        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        if SalesHeader."ACO Large Line" then
            ProdOrderLine."ACO Production Line" := ProdOrderLine."ACO Production Line"::Long
        else
            ProdOrderLine."ACO Production Line" := ProdOrderLine."ACO Production Line"::Short;

        ProdOrderLine."ACO Number of Units" := SalesLine."ACO Number of Units";
        ProdOrderLine."ACO Remaining Quantity" := SalesLine."ACO Number of Units";
        ProdOrderLine."ACO Charges per Bath Profile" := SalesLine."ACO Charges per Bath Profile";
        ProdOrderLine."ACO Quantity Charges" := SalesLine."ACO Quantity Charges";

        if not ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then
            Clear(ItemVariant);

        if SalesLine."ACO Sawing" then
            ProdOrderLine."ACO Total m2" := SalesLine."ACO Profile Circumference" * ItemVariant."ACO Number of Meters" * SalesLine."ACO Number of Units" / 1000;

        if ProdOrderLine."ACO Number of Units" <> 0 then
            ProdOrderLine."ACO Profile m2 per Qty." := ProdOrderLine."ACO Total m2" / ProdOrderLine."ACO Number of Units";

        ProdOrderLine."ACO Pretreatment" := SalesLine."ACO Pretreatment";
        ProdOrderLine."ACO Layer Thickness" := SalesLine."ACO Layer Thickness";
        ProdOrderLine."ACO Color" := SalesLine."ACO Color";
        ProdOrderLine."ACO Posttreatment" := SalesLine."ACO Posttreatment";
        ProdOrderLine."ACO Particularity" := SalesLine."ACO Particularity";
        ProdOrderLine."ACO Customer Item Reference" := SalesLine."ACO Customer Item Reference";
        ProdOrderLine."ACO Profile Length" := SalesLine."ACO Profile Length";
        ProdOrderLine."ACO Profile Circumference" := SalesLine."ACO Profile Circumference";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopySalesInvLine', '', false, false)]
    local procedure CopyDocumentMgt_OnAfterCopySalesInvLine(var TempDocSalesLine: Record "Sales Line" temporary; var ToSalesHeader: Record "Sales Header"; var FromSalesLineBuf: Record "Sales Line"; var FromSalesInvLine: Record "Sales Invoice Line")
    begin
        TempDocSalesLine.ACOCopyCustomFieldsFromSalesInvoiceLines(FromSalesInvLine);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterDescriptionSalesLineInsert', '', false, false)]
    local procedure SalesShptLine_OnAfterDescriptionSalesLineInsert(var SalesLine: Record "Sales Line"; SalesShipmentLine: Record "Sales Shipment Line"; var NextLineNo: Integer)
    var
        SalesHeader: Record "Sales Header";
        SalesShipmentHeader: Record "Sales Shipment Header";
        ACOManagement: Codeunit "ACO Management";
        TranslationHelper: Codeunit "Translation Helper";
        NewDescription: Text;
    begin
        if SalesShipmentHeader.Get(SalesShipmentLine."Document No.") then
            if StrPos(SalesLine.Description, SalesShipmentLine."Document No.") <> 0 then begin
                SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
                TranslationHelper.SetGlobalLanguageByCode(SalesHeader."Language Code");
                NewDescription := SalesShipmentHeader.FieldCaption("Shipment Date") + ' ' + Format(SalesShipmentHeader."Posting Date");
                ACOManagement.InsertExtraSalesLineFromSalesShptLine(SalesShipmentLine, SalesLine, 10, NewDescription);
                NewDescription := SalesShipmentHeader.FieldCaption("Order No.") + ' ' + Format(SalesShipmentHeader."Order No.");
                ACOManagement.InsertExtraSalesLineFromSalesShptLine(SalesShipmentLine, SalesLine, 20, NewDescription);
                NewDescription := SalesShipmentHeader.FieldCaption("Your Reference") + ' ' + Format(SalesShipmentHeader."External Document No.") + ' / ' + Format(SalesShipmentHeader."Your Reference");
                ACOManagement.InsertExtraSalesLineFromSalesShptLine(SalesShipmentLine, SalesLine, 30, NewDescription);
                TranslationHelper.RestoreGlobalLanguage();
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unit of Measure Management", 'OnAfterCalcQtyFromBasePerUnitOfMeasure', '', false, false)]
    local procedure UnitofMeasureManagement_OnAfterCalcQtyFromBasePerUnitOfMeasure(ItemNo: Code[20]; VariantCode: Code[10]; UOMCode: Code[10]; QtyBase: Decimal; QtyPerUOM: Decimal; var QtyRounded: Decimal)
    begin
        QtyRounded := Round(QtyRounded, 0.001);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", 'OnBeforeRunProductionJnl', '', false, false)]
    local procedure ProductionJournalMgt_OnBeforeRunProductionJnl(ToTemplateName: Code[10]; ToBatchName: Code[10]; ProdOrder: Record "Production Order"; ActualLineNo: Integer; PostingDate: Date; var IsHandled: Boolean)
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlTemplate: Record "Item Journal Template";
        ProdOrderLine: Record "Prod. Order Line";
        ACOAppSetup: Record "ACO App Setup";
        ItemVariant: Record "Item Variant";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
        PageTemplate: Option Item,Transfer,"Phys. Inventory",Revaluation,Consumption,Output,Capacity,"Prod. Order";
        User: Text;
        QtyInPackage: Decimal;
        NewQuantity: Decimal;
    begin
        // TODO Create Production Journal
        if ACOSingleInstanceMgt.GetPostProductionJournal() then begin
            ItemJnlTemplate.Reset();
            ItemJnlTemplate.SetRange("Page ID", PAGE::"Production Journal");
            ItemJnlTemplate.SetRange(Recurring, false);
            ItemJnlTemplate.SetRange(Type, PageTemplate::"Prod. Order");
            if ItemJnlTemplate.FindFirst() then begin
                User := UpperCase(UserId);
                if User <> '' then
                    if (StrLen(User) < MaxStrLen(ItemJnlLine."Journal Batch Name")) and (ItemJnlLine."Journal Batch Name" <> '') then
                        ToBatchName := CopyStr(ItemJnlLine."Journal Batch Name", 1, MaxStrLen(ItemJnlLine."Journal Batch Name") - 1) + 'A'
                    else
                        ToBatchName := DelChr(CopyStr(User, 1, MaxStrLen(ItemJnlLine."Journal Batch Name")), '>', '0123456789');
            end;

            ACOAppSetup.Get();

            ItemJnlLine.Reset();
            ItemJnlLine.SetRange("Journal Template Name", ToTemplateName);
            ItemJnlLine.SetRange("Journal Batch Name", ToBatchName);
            ItemJnlLine.SetRange("Order Type", ItemJnlLine."Order Type"::Production);
            ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::Output);
            ItemJnlLine.SetRange("Flushing Method", ItemJnlLine."Flushing Method"::Backward);
            ItemJnlLine.SetRange("Order No.", ProdOrder."No.");
            //570000 Consumption
            // SetRange("Journal Template Name", ToTemplateName);
            // SetRange("Journal Batch Name", ToBatchName);
            // SetRange("Order Type", "Order Type"::Production);
            // SetRange("Order No.", ProdOrder."No.");
            // if ProdOrderLineNo <> 0 then
            //     SetRange("Order Line No.", ProdOrderLineNo);
            // SetFlushingFilter;

            // TODO cannot find anything, opens page afterwards, when selecting 'Backwards', lines appear, look at trigger on page
            if ItemJnlLine.FindSet() then
                repeat
                    //if package
                    //    ItemJnlLine.Validate("Output Quantity", NewQuantity);
                    // if OBR/ Rejection
                    // ProdOrderLine.Reset();
                    // ProdOrderLine.SetRange("Prod. Order No.", ItemJnlLine."Document No.");
                    // ProdOrderLine.SetRange("Line No.", ItemJnlLine."Document Line No.");
                    // ProdOrderLine.FindFirst();
                    ProdOrderLine.Get(ProdOrderLine.Status::Released, ItemJnlLine."Document No.", ItemJnlLine."Order Line No.");
                    NewQuantity := ProdOrderLine.Quantity;
                    QtyInPackage := ACOSingleInstanceMgt.GetTotalRejectionQuantity();

                    if QtyInPackage = 0 then begin
                        // ACOBathSheetLine.SetRange("Production Order No.", ItemJnlLine."Document No.");
                        // ACOBathSheetLine.SetRange("Production Order Status", ACOBathSheetLine."Production Order Status"::Released);
                        // ACOBathSheetLine.SetRange("Production Order Line No.", ItemJnlLine."Order Line No.");
                        // if ACOBathSheetLine.FindFirst() then
                        if ACOBathSheetLine.Get(ACOSingleInstanceMgt.GetBathSheetNo(), ItemJnlLine."Document No.", ACOBathSheetLine."Production Order Status"::Released, ItemJnlLine."Order Line No.") then
                            QtyInPackage := ACOBathSheetLine."Qty in Package";
                    end;

                    case ProdOrderLine."Unit of Measure Code" of
                        ACOAppSetup."Length Unit of Measure Code":
                            begin
                                if ProdOrderLine."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then begin
                                    // ItemVariant.Get(ProdOrderLine."Item No.", ProdOrderLine."Variant Code");
                                    // if ItemVariant."ACO Number of Meters" <> 0 then
                                    // NewQuantity := QtyInPackage * ItemVariant."ACO Number of Meters"; //6,5
                                    NewQuantity := QtyInPackage * ProdOrderLine."ACO Profile Length" / 1000;
                                end;
                            end;
                        ACOAppSetup."Area Unit of Measure Code":
                            begin
                                if ProdOrderLine."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                                    if ProdOrderLine."ACO Profile m2 per Qty." <> 0 then
                                        NewQuantity := QtyInPackage * ProdOrderLine."ACO Profile m2 per Qty.";
                            end;
                        else begin
                            NewQuantity := QtyInPackage;
                        end;
                    end;
                    ItemJnlLine.Validate("Output Quantity", Round(NewQuantity, 0.001));
                    ItemJnlLine.Modify(true);
                until ItemJnlLine.Next() = 0;

            Commit();

            IsHandled := true;
            //ItemJnlLine.ModifyAll("Output Quantity");
            //
            // Post Production Journal
            ItemJnlLine.FilterGroup(2);
            ItemJnlLine.Reset();
            ItemJnlLine.SetRange("Journal Template Name", ToTemplateName);
            ItemJnlLine.SetRange("Journal Batch Name", ToBatchName);
            ItemJnlLine.SetRange("Document No.", ProdOrder."No.");
            ItemJnlLine.SetRange("Order Type", ItemJnlLine."Order Type"::Production);
            ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::Output);
            //ItemJnlLine.FindFirst(); 04-10-2021
            // TODO ItemJnlLine = empty, gives error
            // Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemJnlLine);

            // ItemJnlLine.DeleteRecTemp;

            ItemJnlLine.FilterGroup(0);
            // FilterGroup(2);
            // SetRange("Journal Template Name", ToTemplateName);
            // SetRange("Journal Batch Name", ToBatchName);
            // SetRange("Order Type", "Order Type"::Production);
            // SetRange("Order No.", ProdOrder."No.");
            // if ProdOrderLineNo <> 0 then
            //     SetRange("Order Line No.", ProdOrderLineNo);
            // SetFlushingFilter;
            // OnAfterSetFilterGroup(Rec, ProdOrder, ProdOrderLineNo);
            // FilterGroup(0);

            ItemJnlLine.PostingItemJnlFromProduction(false);

            // ItemJnlLine.InsertTempRec;
            ACOSingleInstanceMgt.SetPostProductionJournal(false);
            // end;
        end;
        //ACOSingleInstanceMgt
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure ItemJnlPost_OnBeforeCode(var ItemJournalLine: Record "Item Journal Line"; var HideDialog: Boolean; var SuppressCommit: Boolean; var IsHandled: Boolean)
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        if ACOSingleInstanceMgt.GetPostProductionJournal() then
            HideDialog := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnBeforeInsertInvLineFromShptLine', '', false, false)]
    local procedure SalesGetShipment_OnBeforeInsertInvLineFromShptLine(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; SalesOrderLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        NewLineDiscountAmount: Decimal;
    begin
        // Issue 1.8
        SalesLine."ACO Number of Units" := SalesShptLine."ACO Number of Units";
        SalesLine."Description 2" := SalesShptLine."Description 2";
        SalesLine."ACO Reject Billable" := 0;
        SalesLine."ACO Reject Not Billable" := 0;
        SalesLine."ACO Reject Billable Shipped" := SalesShptLine."ACO Reject Billable Shipped";
        SalesLine."ACO Rej. Not Billable Shipped" := SalesShptLine."ACO Rej. Not Billable Shipped";
        SalesLine."ACO Number of Units to Invoice" := SalesLine."ACO Number of Units";
        if (SalesLine."ACO Number of Units" * SalesShptLine."ACO Rej. Not Billable Shipped" * SalesLine."Unit Price") <> 0 then
            NewLineDiscountAmount := SalesShptLine.Quantity / SalesShptLine."ACO Number of Units" * SalesShptLine."ACO Rej. Not Billable Shipped" * SalesLine."Unit Price";

        SalesLine.Validate("Line Discount Amount", NewLineDiscountAmount);
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Prod. Order from Sale", 'OnAfterCreateProdOrderFromSalesLine', '', false, false)]
    // local procedure CreateProdOrderfromSale_OnAfterCreateProdOrderFromSalesLine(var ProdOrder: Record "Production Order"; SalesLine: Record "Sales Line");
    // var
    //     LeadTimeMgt: Codeunit "Lead-Time Management";
    // begin
    //     ProdOrder."Location Code" := '';
    //     ProdOrder."Bin Code" := '';
    //     ProdOrder.Validate("Source No.", '');
    //     ProdOrder.Validate(Description, '');
    //     // SalesLine.CalcFields("Reserved Qty. (Base)");
    //     ProdOrder.Quantity := 0;
    //     ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
    //     ProdOrder.Validate("Source No.", SalesLine."Document No.");
    //     ProdOrder."Due Date" := SalesLine."Shipment Date";
    //     ProdOrder."Ending Date" :=
    //       LeadTimeMgt.PlannedEndingDate(SalesLine."No.", SalesLine."Location Code", '', ProdOrder."Due Date", '', 2);
    // end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnClosePageEvent', '', false, false)]
    local procedure SalesOrder_OnClosePage(var Rec: Record "Sales Header");
    var
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        SingleInstance.SetCustomerNo('');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure SalesOrder_OnAfterGetRecord(var Rec: Record "Sales Header");
    var
        Customer: Record Customer;
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        if not Customer.Get(Rec."Sell-to Customer No.") then
            Clear(Customer);

        SingleInstance.SetCustomerNo(Customer."No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnClosePageEvent', '', false, false)]
    local procedure SalesQuote_OnClosePage(var Rec: Record "Sales Header");
    var
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        SingleInstance.SetCustomerNo('');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure SalesQuote_OnAfterGetRecord(var Rec: Record "Sales Header");
    var
        Customer: Record Customer;
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        if not Customer.Get(Rec."Sell-to Customer No.") then
            Clear(Customer);

        SingleInstance.SetCustomerNo(Customer."No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnClosePageEvent', '', false, false)]
    local procedure SalesInvoice_OnClosePage(var Rec: Record "Sales Header");
    var
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        SingleInstance.SetCustomerNo('');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure SalesInvoice_OnAfterGetRecord(var Rec: Record "Sales Header");
    var
        Customer: Record Customer;
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        if not Customer.Get(Rec."Sell-to Customer No.") then
            Clear(Customer);

        SingleInstance.SetCustomerNo(Customer."No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Credit Memo", 'OnClosePageEvent', '', false, false)]
    local procedure SalesCreditMemo_OnClosePage(var Rec: Record "Sales Header");
    var
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        SingleInstance.SetCustomerNo('');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Credit Memo", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure SalesCreditMemo_OnAfterGetRecord(var Rec: Record "Sales Header");
    var
        Customer: Record Customer;
        SingleInstance: Codeunit "ACO Single Instance Mgt";
    begin
        if not Customer.Get(Rec."Sell-to Customer No.") then
            Clear(Customer);

        SingleInstance.SetCustomerNo(Customer."No.");
    end;
}