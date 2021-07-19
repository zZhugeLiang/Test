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
            Rec."ACO Euras" := Customer."ACO Euras";
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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnBeforeValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetSalesLineProfileCode(Rec."ACO Profile Code");
        ACOSingleInstanceMgt.SetSalesLineCustomerItemNo(Rec."ACO Customer Item No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        RoutingLine: Record "Routing Line";
        ACOAppSetup: Record "ACO App Setup";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOPretreatment: Record "ACO Pretreatment";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        if Rec.IsTemporary() then
            exit;

        Rec."ACO Profile Code" := ACOSingleInstanceMgt.GetSalesLineProfileCode();
        Rec."ACO Customer Item No." := ACOSingleInstanceMgt.GetSalesLineCustomerItemNo();
        ACOSingleInstanceMgt.SetSalesLineProfileCode('');
        ACOSingleInstanceMgt.SetSalesLineCustomerItemNo('');

        ACOAppSetup.Get();

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                if ACOPretreatment.Get(Item."ACO Pretreatment") then begin
                    Rec."ACO British Standard" := ACOPretreatment."British Standard";
                    Rec."ACO Maximum Current Density PT" := ACOPretreatment."Maximum Current Density";
                    Rec."ACO Minimum Current Density PT" := ACOPretreatment."Minimum Current Density";
                end;

                Rec.Validate("ACO Layer Thickness", Item."ACO Layer Thickness Code");

                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
            end;

        Rec.Validate("ACO Color", Item."ACO Color");

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

        // if DateConflict(SalesLine."Shipment Date", ForceRequest, ReservEntry) then
        //     if ForceRequest then
        //         IssueError(SalesLine."Shipment Date");

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
        Item: Record Item;
        ACOColor: Record "ACO Color";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOColor.Get(Item."ACO Color") then begin
                    Rec."ACO Min. Current Density Color" := ACOColor."Minimum Current Density";
                    Rec."ACO Max. Current Density Color" := ACOColor."Maximum Current Density";
                end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Layer Thickness', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOLayerThickness(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        ACOLayerThickness: Record "ACO Layer Thickness";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOLayerThickness.Get(Item."ACO Layer Thickness Code") then begin
                    Rec."ACO Minimum Current Density LT" := ACOLayerThickness."Minimum Current Density";
                    Rec."ACO Maximum Current Density LT" := ACOLayerThickness."Maximum Current Density";
                end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Profile Code', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOProfileCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOCategory: Record "ACO Category";
        CustomerNotLinkedToProfileErr: Label 'Customer %1 with shipping code %2 does not have a link with the profile %3.';
        ProfileInactiveErr: Label 'Profile %1 is inactive for Customer %2.';
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec."ACO Profile Code" = '' then
            exit;

        if ACOProfile.Get(Rec."ACO Profile Code") then begin
            ACOProfile.TestField(Circumference);

            SalesHeader.Get(Rec."Document Type", Rec."Document No.");

            // TODO issue 8
            // ACOSingleInstanceMgt.GetACOProfileCustomerPK(ProfileCode, CustomerNo, CustomerItemNo); // TODO issue 8
            // if not ACOProfileCustomer.Get(ProfileCode, CustomerNo, CustomerItemNo) then
            if not ACOProfileCustomer.Get(Rec."ACO Profile Code", SalesHeader."Sell-to Customer No.", Rec."ACO Customer Item No.") then begin
                ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
                ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                if not ACOProfileCustomer.FindFirst() then
                    Error(CustomerNotLinkedToProfileErr, SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code", Rec."ACO Profile Code");
            end;

            if ACOProfileCustomer.Status = ACOProfileCustomer.Status::Inactive then
                Error(ProfileInactiveErr, ACOProfile.Code, SalesHeader."Sell-to Customer No.");

            Rec."ACO Profile Description" := ACOProfile.Description;
            Rec."ACO Profile Category" := ACOProfile.Category;
            Rec."ACO Profile Circumference" := ACOProfile."Circumference";
            Rec."ACO Not Measurable" := ACOProfile."Not Measurable";
            Rec."ACO Extra Flushing" := ACOProfile."Extra Flushing";
            Rec."ACO Correction Factor Profile" := ACOProfile."Correction Factor";
            Rec."ACO Height Level Profile" := ACOProfile."Height Level";

            Rec."ACO Attach Method Code Profile" := ACOProfile."Attach Method Code";
            Rec."ACO Type of Clamp Code" := ACOProfile."Type of Clamp Code";
            Rec."ACO Holders Profile" := ACOProfile.Holders;
            Rec.Validate("ACO Charges per Bath Profile", ACOProfile."Charges per Bath Profile");
            if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                Rec.Validate("ACO Area Profile", ACOProfile.Circumference * ItemVariant."ACO Number of Meters" / 1000);

            Rec."ACO Max. Curr. Density Profile" := ACOProfileCustomer."Maximum Current Density";
            Rec."ACO Min. Curr. Density Profile" := ACOProfileCustomer."Minimum Current Density";

            Rec."ACO Euras Profile" := ACOProfileCustomer.Euras;
            Rec."ACO Thin Staining Time Profile" := ACOProfileCustomer."Thin Staining Time";
            Rec."ACO Thick St. Time Profile" := ACOProfileCustomer."Thick Staining Time";
            Rec."ACO Extra to Enumerate Profile" := ACOProfileCustomer."Extra to Enumerate";
            Rec."ACO High End" := ACOProfileCustomer."High End";
            Rec."ACO Customer Item No." := ACOProfileCustomer."Customer Item No.";
            Rec."ACO Profile Cust. Description" := ACOProfileCustomer."Profile Description";

            if ACOCategory.Get(ACOProfile.Category) then
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
            Rec.ACOSetACOUnitPrice(Rec."Unit Price");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure SalesLine_OnAfterValidate_Quantity(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec.ClearFieldCausedPriceCalculation();

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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Variant Code', false, false)]
    local procedure SalesLine_OnAfterValidate_VariantCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOManagement: Codeunit "ACO Management";
    begin
        if not ItemVariant.Get(Rec."No.", Rec."Variant Code") then
            Clear(ItemVariant);

        if ACOProfile.Get(Rec."ACO Profile Code") then
            Rec.Validate("ACO Area Profile", ACOProfile.Circumference * ItemVariant."ACO Number of Meters" / 1000)
        else
            Rec.Validate("ACO Area Profile", 0);

        SalesHeader.Get(Rec."Document Type", Rec."Document No.");

        ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
    end;

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

    [EventSubscriber(ObjectType::Table, Database::"ACO Bath Sheet Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure ACOBathSheetLine_OnAfterDelete(Rec: Record "ACO Bath Sheet Line"; RunTrigger: Boolean)
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        if ProdOrderLine.Get(Rec."Production Order Status", Rec."Production Order No.", Rec."Production Order Line No.") then begin
            ProdOrderLine."ACO Remaining Quantity" += Rec.Quantity;
            ProdOrderLine."ACO Complete" := false;
            ProdOrderLine.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostUpdateOrderLineModifyTempLine', '', false, false)]
    local procedure SalesPost_OnBeforePostUpdateOrderLineModifyTempLine(var TempSalesLine: Record "Sales Line" temporary; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean)
    begin
        //TODO issue 1.6 + 1.7
        TempSalesLine."ACO Number of Units" := TempSalesLine."ACO Number of Units" - TempSalesLine."ACO Number of Units to Ship";
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
        //TODO1.7
        SalesShptLine."ACO Reject Billable Shipped" := SalesLine."ACO Reject Billable";
        SalesShptLine."ACO Rej. Not Billable Shipped" := SalesLine."ACO Reject Not Billable";
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
        ProdOrderLine.Validate("ACO Quantity to Bath Sheet", SalesLine."ACO Number of Units");
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
        ProdOrderLine.Validate("ACO Quantity to Bath Sheet", SalesLine."ACO Number of Units");
        ProdOrderLine."ACO Charges per Bath Profile" := SalesLine."ACO Charges per Bath Profile";
        ProdOrderLine."ACO Quantity Charges" := SalesLine."ACO Quantity Charges";

        if not ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then
            Clear(ItemVariant);

        if SalesLine."ACO Sawing" then
            ProdOrderLine."ACO Total m2" := SalesLine."ACO Profile Circumference" * ItemVariant."ACO Number of Meters" * SalesLine."ACO Number of Units" / 1000;

        if ProdOrderLine."ACO Number of Units" <> 0 then
            ProdOrderLine."ACO Profile m2 per Qty." := ProdOrderLine."ACO Total m2" / ProdOrderLine."ACO Number of Units";
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
                NewDescription := SalesShipmentHeader.FieldCaption("Shipment Date") + ' ' + Format(SalesShipmentHeader."Shipment Date");
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



    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterUpdateSalesLineBeforePost', '', false, false)]
    // local procedure SalesPost_OnAfterUpdateSalesLineBeforePost(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean)
    // begin
    //     SalesLine."ACO Reject Billable Shipped" += SalesLine."ACO Reject Billable";
    //     SalesLine."ACO Rej. Not Billable Shipped" += SalesLine."ACO Reject Not Billable";
    // end;

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

    // TODO issue 8
    // [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnClosePageEvent', '', false, false)]
    // local procedure SalesOrder_OnClosePage(var Rec: Record "Sales Header");
    // var
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     SingleInstance.SetCustomerNo('');
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterGetRecordEvent', '', false, false)]
    // local procedure SalesOrder_OnAfterGetRecord(var Rec: Record "Sales Header");
    // var
    //     Customer: Record Customer;
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     if not Customer.Get(Rec."Sell-to Customer No.") then
    //         Clear(Customer);

    //     SingleInstance.SetCustomerNo(Customer."No.");
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnClosePageEvent', '', false, false)]
    // local procedure SalesQuote_OnClosePage(var Rec: Record "Sales Header");
    // var
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     SingleInstance.SetCustomerNo('');
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnAfterGetRecordEvent', '', false, false)]
    // local procedure SalesQuote_OnAfterGetRecord(var Rec: Record "Sales Header");
    // var
    //     Customer: Record Customer;
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     if not Customer.Get(Rec."Sell-to Customer No.") then
    //         Clear(Customer);

    //     SingleInstance.SetCustomerNo(Customer."No.");
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnClosePageEvent', '', false, false)]
    // local procedure SalesInvoice_OnClosePage(var Rec: Record "Sales Header");
    // var
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     SingleInstance.SetCustomerNo('');
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnAfterGetRecordEvent', '', false, false)]
    // local procedure SalesInvoice_OnAfterGetRecord(var Rec: Record "Sales Header");
    // var
    //     Customer: Record Customer;
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     if not Customer.Get(Rec."Sell-to Customer No.") then
    //         Clear(Customer);

    //     SingleInstance.SetCustomerNo(Customer."No.");
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Credit Memo", 'OnClosePageEvent', '', false, false)]
    // local procedure SalesCreditMemo_OnClosePage(var Rec: Record "Sales Header");
    // var
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     SingleInstance.SetCustomerNo('');
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Credit Memo", 'OnAfterGetRecordEvent', '', false, false)]
    // local procedure SalesCreditMemo_OnAfterGetRecord(var Rec: Record "Sales Header");
    // var
    //     Customer: Record Customer;
    //     SingleInstance: Codeunit "ACO Single Instance Mgt";
    // begin
    //     if not Customer.Get(Rec."Sell-to Customer No.") then
    //         Clear(Customer);

    //     SingleInstance.SetCustomerNo(Customer."No.");
    // end;
}