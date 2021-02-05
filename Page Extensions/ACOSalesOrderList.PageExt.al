pageextension 50017 "ACO Sales Order List" extends "Sales Order List"
{


    trigger OnOpenPage()
    begin
        //Rec.SetCurrentKey("No.");
        Rec.SetAscending("No.", false);
    end;
}