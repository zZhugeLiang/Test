codeunit 50000 "ACO Event Subscribers"
{
    Permissions = TableData "Item Ledger Entry" = rm;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
    local procedure SalesHeader_OnAfterInsertEvent(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
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
}