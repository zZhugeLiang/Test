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
                    ToolTip = 'Default Package Label Nos.';
                }

                field("Default Bath Card Nos."; "Default Bath Card Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Bath Card Nos.';
                }

                field("Default Project Color Nos."; "Default Project Color Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Project Color Nos.';
                }

                field("Default Measured Color Nos."; "Default Measured Color Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Measured Color Nos.';
                }

                field("Pretreatment Dimension Code"; "Pretreatment Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pretreatment Dimension Code';
                }

                field("Color Dimension Code"; "Color Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Color Dimension Code';
                }

                field("Layer Thickness Dimension Code"; "Layer Thickness Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Layer Thickness Dimension Code';
                }

                field("Length Unit of Measure Code"; "Length Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Length Unit of Measure Code';
                }

                field("Area Unit of Measure Code"; "Area Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Area Unit of Measure Code';
                }

                field("Max. Current Density Bath 1"; "Max. Current Density Bath 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 1';
                }

                field("Max. Current Density Bath 2"; "Max. Current Density Bath 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 2';
                }

                field("Max. Current Density Bath 3"; "Max. Current Density Bath 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 3';
                }

                field("Max. Current Density Bath L"; "Max. Current Density Bath L")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath L';
                }

                field("Min. Anodise Time"; "Min. Anodise Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min. Anodise Time';
                }

                field("Multiple Staining Times Text"; "Multiple Staining Times Text")
                {
                    ApplicationArea = All;
                    ToolTip = 'Multiple Staining Times Text';
                }

                field("Layer Thickness Tolerance"; "Layer Thickness Tolerance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Layer Thickness Tolerance';
                }

                field("Bath Sheet Measure Mu No."; "Bath Sheet Measure Mu No.")
                {
                    ApplicationArea = All;
                    ToolTip = '"Bath Sheet Measure Mu No.';
                }

                field("Rack Packaging Code"; "Rack Packaging Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Rack Packaging Code';
                }

                field("Package Packaging Code"; "Package Packaging Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Package Packaging Code';
                }

                field("Maximum Sawing Length"; "Maximum Sawing Length")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum Sawing Length';
                }

                field("Sawing Routing No."; "Sawing Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sawing Routing No.';
                }

                field("Foil Routing No."; "Foil Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Add Foil Routing No.';
                }

                field("Remove Foil Routing No."; "Remove Foil Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Remove Foil Routing No.';
                }

                field("VEC Routing No."; "VEC Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'VEC Routing No.';
                }

                field("Wrap Routing No."; "Wrap Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Wrap Routing No.';
                }

                field("Net/Gross Weight Factor"; "Net/Gross Weight Factor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Net/Gross Weight Factor';
                }
            }

            group(Aucos)
            {
                field("Min. Residue Saw"; "Min. Residue Saw")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min. Residue Saw';
                }

                field("Aucos Max. No. of Lines"; "Aucos Max. No. of Lines")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Max. No. of Lines';
                }

                field("Aucos Staining Time"; "Aucos Staining Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Staining Time';
                }

                field("Aucos Seal Time"; "Aucos Seal Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Seal Time';
                }

                field("Aucos Sealconstant"; "Aucos Sealconstant")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Sealconstant';

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