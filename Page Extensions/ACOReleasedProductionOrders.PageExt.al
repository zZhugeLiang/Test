pageextension 50021 "ACO Released Production Orders" extends "Released Production Orders"
{
    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", false);
    end;
}
