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
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure SalesLine_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                Rec.Validate("ACO Pretreatment", Rec."ACO Pretreatment");
                Rec.Validate("ACO Color", Rec."ACO Color");
                Rec.Validate("ACO Layer Thickness", Rec."ACO Layer Thickness");
                Rec.Validate("ACO Category", Rec."ACO Category");
                //Rec."ACO Profile Code";
            end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Pretreatment', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOPretreatment(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        ACOPretreatment: Record "ACO Pretreatment";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOPretreatment.Get(Item."ACO Pretreatment") then begin
                    Rec."ACO Minimum Current Density PT" := ACOPretreatment."Minimum Current Density";
                    Rec."ACO Maximum Current Density PT" := ACOPretreatment."Maximum Current Density";
                    Rec."ACO Thick Staining Time PT" := ACOPretreatment."Thick Staining Time";
                    Rec."ACO Thin Staining Time PT" := ACOPretreatment."Thin Staining Time";
                    Rec."ACO Do Not Calc. Short Length" := ACOPretreatment."Do Not Calculate Short Length";
                    Rec."ACO Aucos" := ACOPretreatment.Aucos;
                    Rec."ACO Aucos Flushing Time" := ACOPretreatment."Aucos Flushing Time";
                    Rec."ACO British Standard" := ACOPretreatment."British Standard";
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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Category', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOCategory(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        ACOCategory: Record "ACO Category";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOCategory.Get(Item."ACO Category Code") then
                    Rec."ACO Max. Cur. Density Category" := ACOCategory."Maximum Current Density";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'ACO Profile Code', false, false)]
    local procedure SalesLine_OnAfterValidate_ACOProfileCode(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        CustomerNotLinkedToProfileErr: Label 'Customer %1 with shipping code %2 does not have a link with the profile %3.';
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then
                if ACOProfile.Get(Rec."ACO Profile Code") then begin
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