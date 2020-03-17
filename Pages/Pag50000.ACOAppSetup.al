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

                field("Default Measured Color Nos."; "Default Measured Color Nos.")
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

                field("Max. Current Density Bath L"; "Max. Current Density Bath L")
                {
                    ApplicationArea = All;
                }

                field("Min. Anodise Time"; "Min. Anodise Time")
                {
                    ApplicationArea = All;
                }

                field("Multiple Staining Times Text"; "Multiple Staining Times Text")
                {
                    ApplicationArea = All;
                }

                field("Layer Thickness Tolerance"; "Layer Thickness Tolerance")
                {
                    ApplicationArea = All;
                }

                field("Bath Sheet Measure Mu No."; "Bath Sheet Measure Mu No.")
                {
                    ApplicationArea = All;
                }

                field("Rack Packaging Code"; "Rack Packaging Code")
                {
                    ApplicationArea = All;
                }

                field("Package Packaging Code"; "Package Packaging Code")
                {
                    ApplicationArea = All;
                }
            }

            group(Aucos)
            {
                field("Min. Residue Saw"; "Min. Residue Saw")
                {
                    ApplicationArea = All;
                }

                field("Aucos Max. No. of Lines"; "Aucos Max. No. of Lines")
                {
                    ApplicationArea = All;
                }

                field("Aucos Staining Time"; "Aucos Staining Time")
                {
                    ApplicationArea = All;
                }

                field("Aucos Seal Time"; "Aucos Seal Time")
                {
                    ApplicationArea = All;
                }

                field("Aucos Sealconstant"; "Aucos Sealconstant")
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