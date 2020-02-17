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

                field("Pretreatment Dimension Code"; "Pretreatment Dimension Code")
                {
                    ApplicationArea = All;
                }

                field("Color Dimension Code"; "Color Dimension Code")
                {
                    ApplicationArea = All;
                }

                field("Layer Thickness Dimension Code"; "Layer Thickness Dimension Code")
                {
                    ApplicationArea = All;
                }

                field("Length Unit of Measure Code"; "Length Unit of Measure Code")
                {
                    ApplicationArea = All;
                }

                field("Area Unit of Measure Code"; "Area Unit of Measure Code")
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