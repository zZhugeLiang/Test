page 50000 "ACO App Setup"
{
    Caption = 'App Setup';
    PageType = Card;
    SourceTable = "ACO App Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
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

                field("Default Project Color Nos."; "Default Project Color Nos.")
                {
                    ApplicationArea = All;
                }
                field("Max. Current Density Bath 1"; "Max. Current Density Bath 1")
                {
                    ApplicationArea = All;
                }

                field("Max. Current Density Bath 2"; "Max. Current Density Bath 2")
                {
                    ApplicationArea = All;
                }

                field("Max. Current Density Bath 3"; "Max. Current Density Bath 3")
                {
                    ApplicationArea = All;
                }

                field("Min. Anodise Time"; "Min. Anodise Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Reset();
        if not Get() then
            Insert();
    end;
}