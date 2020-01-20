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
        Rec."ACO Delivery Week" := Date2DWY(Rec."ACO Delivery Date", 2);
        Rec."ACO Delivery Year" := Date2DWY(Rec."ACO Delivery Date", 3);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'ACO Logged In DateTime', false, false)]
    local procedure SalesHeader_OnAfterValidate_ACOLoggedInDateTime(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec."ACO Logged In Week" := Date2DWY(DT2Date(Rec."ACO Logged In DateTime"), 2);
        Rec."ACO Logged In Year" := Date2DWY(DT2Date(Rec."ACO Logged In DateTime"), 3);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Document Date', false, false)]
    local procedure SalesHeader_OnAfterValidate_DocumentDate(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec."ACO Document Date Week" := Date2DWY(Rec."Document Date", 2);
        Rec."ACO Document Date Year" := Date2DWY(Rec."Document Date", 3);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        ACOProfileCustomer: Record "ACO Profile Customer";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                //Rec.Validate("ACO Pretreatment", Rec."ACO Pretreatment");
                Rec.Validate("ACO Profile Code");
                Rec.Validate("ACO Color", Item."ACO Color");

                Rec."ACO Sawing" := Item."Routing No." = 'ZAGEN'; // Code nog naar Setup
                //Rec.Validate("ACO Layer Thickness", Item."ACO Layer Thickness");
                //if
                //Rec.Validate("ACO Category", Rec."ACO Category");
                //Rec."ACO Profile Code";
            end;
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

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Category', false, false)]
    // local procedure SalesLine_OnAfterValidate_ACOCategory(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // var
    //     Item: Record Item;
    //     ACOCategory: Record "ACO Category";
    // begin
    //     if Rec.IsTemporary() then
    //         exit;

    //     if Rec.Type = Rec.Type::Item then
    //         if Item.Get(Rec."No.") then
    //             if ACOCategory.Get(Item."ACO Category Code") then
    //                 Rec."ACO Max. Cur. Density Category" := ACOCategory."Maximum Current Density";
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Profile Code', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOProfileCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        CustomerNotLinkedToProfileErr: Label 'Customer %1 with shipping code %2 does not have a link with the profile %3.';
        ProfileInactiveErr: Label 'Profile %1 is inactive.';
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOProfile.Get(Rec."ACO Profile Code") then begin
                    if ACOProfile."Blocked State Inactive" then
                        Error(ProfileInactiveErr, ACOProfile.Code);

                    SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                    // ACOProfileCustomer.SetRange("Profile Code", Rec."ACO Profile Code");
                    // ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                    if not ACOProfileCustomer.Get(Rec."ACO Profile Code", SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code") then
                        Error(CustomerNotLinkedToProfileErr, SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code", Rec."ACO Profile Code");

                    Rec."ACO Profile Description" := ACOProfile.Description;
                    Rec."ACO Profile Category" := ACOProfile.Category;
                    Rec."ACO Profile Circumference" := ACOProfile."Circumference";
                    Rec."ACO Not Measurable" := ACOProfile."Not Measurable";
                    Rec."ACO Area" := ACOProfile.Area;
                    Rec."ACO Extra Flushing" := ACOProfile."Extra Flushing";
                    Rec."ACO Correction Factor Profile" := ACOProfile."Correction Factor";
                    Rec."ACO Height Level Profile" := ACOProfile."Height Level";
                    Rec."ACO Bent Profile" := ACOProfile.Bent;
                    Rec."ACO Max. Curr. Density Profile" := ACOProfile."Minimum Current Density";
                    Rec."ACO Min. Curr. Density Profile" := ACOProfile."Maximum Current Density";
                    Rec."ACO Thin Staining Time Profile" := ACOProfile."Thin Staining Time";
                    Rec."ACO Thick St. Time Profile" := ACOProfile."Thick Staining Time";
                    Rec."ACO Euras Profile" := ACOProfile."Euras";
                    Rec."ACO Extra to Enumerate Profile" := ACOProfile."Extra to Enumerate";
                end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Receipt Bag', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOReceiptBag(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        if Rec."ACO Shipping Bag" = '' then
            Rec."ACO Shipping Bag" := Rec."ACO Receipt Bag";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Number of Units', false, false)]
    local procedure SalesLine_OnAfterValidate_ACONumberOfUnits(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        ACOProfile: Record "ACO Profile";
    begin
        if ACOProfile.Get(Rec."ACO Profile Code") then
            Rec.Validate(Quantity, Rec."ACO Number of Units" * ACOProfile."Area");
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Routing No.', false, false)]
    // local procedure SalesLine_OnAfterValidate_RoutingNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // var
    //     Item: Record Item;
    // begin
    //     if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then
    //         Rec."ACO Sawing" := Item."Routing No." = 'ZAGEN'; // Code nog naar Setup
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Final Length', false, false)]
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
}