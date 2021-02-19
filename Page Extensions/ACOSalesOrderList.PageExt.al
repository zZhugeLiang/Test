pageextension 50017 "ACO Sales Order List" extends "Sales Order List"
{
    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", true);
    end;
}