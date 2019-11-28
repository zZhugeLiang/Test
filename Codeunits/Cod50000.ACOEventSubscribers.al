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
    // ACOPretreatment: Record "ACO Pretreatment";
    // ACOColor: Record "ACO Color";
    // ACOLayerThickness: Record "ACO Layer Thickness";
    // ACOCategory: Record "ACO Category";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type = Rec.Type::Item then
            if Item.Get(Rec."No.") then begin
                // Provide subscribers to fill other fields
                Rec.Validate("ACO Pretreatment", Rec."ACO Pretreatment");
                Rec.Validate("ACO Color", Rec."ACO Color");
                Rec.Validate("ACO Layer Thickness", Rec."ACO Layer Thickness");
                Rec.Validate("ACO Category", Rec."ACO Category");
            end;
    end;


}