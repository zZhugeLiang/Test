pageextension 50020 "ACO Finished Production Orders" extends "Finished Production Orders"
{
    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", true);
    end;
}
