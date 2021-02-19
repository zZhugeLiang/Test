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
        ACOSingleInstanceMgt.SetSalesLineProfileCode('');

        ACOAppSetup.Get();

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                if ACOPretreatment.Get(Item."ACO Pretreatment") then
                    Rec."ACO British Standard" := ACOPretreatment."British Standard";

                Rec."ACO Layer Thickness" := Item."ACO Layer Thickness Code";

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

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Pretreatment', false, false)]
    // local procedure SalesLine_OnAfterValidate_ACOPretreatment(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // var
    //     Item: Record Item;
    //     ACOPretreatment: Record "ACO Pretreatment";
    // begin
    //     if Rec.IsTemporary() then
    //         exit;

    //     if Rec.Type = Rec.Type::Item then
    //         if Item.Get(Rec."No.") then
    //             if ACOPretreatment.Get(Item."ACO Pretreatment") then begin
    //                 Rec."ACO Minimum Current Density PT" := ACOPretreatment."Minimum Current Density";
    //                 Rec."ACO Maximum Current Density PT" := ACOPretreatment."Maximum Current Density";
    //                 Rec."ACO Thick Staining Time PT" := ACOPretreatment."Thick Staining Time";
    //                 Rec."ACO Thin Staining Time PT" := ACOPretreatment."Thin Staining Time";
    //                 Rec."ACO Do Not Calc. Short Length" := ACOPretreatment."Do Not Calculate Short Length";
    //                 Rec."ACO Aucos" := ACOPretreatment.Aucos;
    //                 Rec."ACO Aucos Flushing Time" := ACOPretreatment."Aucos Flushing Time";
    //                 Rec."ACO British Standard" := ACOPretreatment."British Standard";
    //             end;
    // end;

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
            ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
            ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
            if not ACOProfileCustomer.FindFirst() then
                Error(CustomerNotLinkedToProfileErr, SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code", Rec."ACO Profile Code")
            else
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
                Rec.Validate("ACO Area Profile", ACOProfile.Circumference * ItemVariant."ACO Number of Meters");

            Rec."ACO Max. Curr. Density Profile" := ACOProfileCustomer."Maximum Current Density";
            Rec."ACO Min. Curr. Density Profile" := ACOProfileCustomer."Minimum Current Density";

            Rec."ACO Euras Profile" := ACOProfileCustomer.Euras;
            Rec."ACO Thin Staining Time Profile" := ACOProfileCustomer."Thin Staining Time";
            Rec."ACO Thick St. Time Profile" := ACOProfileCustomer."Thick Staining Time";
            Rec."ACO Extra to Enumerate Profile" := ACOProfileCustomer."Extra to Enumerate";
            Rec."ACO Customer Item No." := ACOProfileCustomer."Customer Item No.";
            Rec."ACO Profile Cust. Description" := ACOProfileCustomer."Profile Description";

            if ACOCategory.Get(ACOProfile.Category) then
                Rec."ACO Max. Cur. Density Category" := ACOCategory."Maximum Current Density";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Receipt Bag', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOReceiptBag(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        if Rec."ACO Shipping Bag" = '' then
            Rec."ACO Shipping Bag" := Rec."ACO Receipt Bag";
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Routing No.', false, false)]
    // local procedure SalesLine_OnAfterValidate_RoutingNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // var
    //     Item: Record Item;
    // begin
    //     if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then
    //         Rec."ACO Sawing" := Item."Routing No." = 'ZAGEN'; // Code nog naar Setup
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Start Length', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOFinalLength(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."ACO Qty. After Production" := Rec.Quantity;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'ACO Number of Units', false, false)]
    // local procedure SalesHeader_OnAfterValidate_ACONumberofUnits(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    // var
    //     Item: Record Item;
    //     ACOCategory: Record "ACO Category";
    // begin
    //     if Rec.IsTemporary() then
    //         exit;
    // end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure SalesLine_OnAfterValidate_Quantity(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec.ACOCalculateUnitPrice();
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
            ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
            ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
            // ACOProfileCustomer.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
            if ACOProfileCustomer.FindFirst() then
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopySalesInvLine', '', false, false)]
    local procedure CopyDocumentMgt_OnAfterCopySalesInvLine(var TempDocSalesLine: Record "Sales Line" temporary; var ToSalesHeader: Record "Sales Header"; var FromSalesLineBuf: Record "Sales Line"; var FromSalesInvLine: Record "Sales Invoice Line")
    begin
        TempDocSalesLine.ACOCopyCustomFieldsFromSalesInvoiceLines(FromSalesInvLine);
    end;
}