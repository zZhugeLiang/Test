page 50000 "ACO App Setup"
{
    Caption = 'App Setup';
    PageType = Card;
    SourceTable = "ACO App Setup";
    InsertAllowed = true;
    Editable = true;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Package Label Nos."; "Default Package Label Nos.")
                {
                    ApplicationArea = All;
                }

                field("Default Bath Card Nos."; "Default Bath Card Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Get() then
            Insert();
    end;
}