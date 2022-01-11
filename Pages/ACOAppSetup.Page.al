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
                field("Default Package Label Nos."; Rec."Default Package Label Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Package Label Nos.';
                }

                field("Default Bath Card Nos."; Rec."Default Bath Card Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Bath Card Nos.';
                }

                field("Default Project Color Nos."; Rec."Default Project Color Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Project Color Nos.';
                }

                field("Default Measured Color Nos."; Rec."Default Measured Color Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Measured Color Nos.';
                }

                field("Default Linked Packaging Nos."; Rec."Default Linked Packaging Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Linked Packaging Nos.';
                }

                field("Pretreatment Dimension Code"; Rec."Pretreatment Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pretreatment Dimension Code';
                }

                field("Color Dimension Code"; Rec."Color Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Color Dimension Code';
                }

                field("Layer Thickness Dimension Code"; Rec."Layer Thickness Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Layer Thickness Dimension Code';
                }

                field("Length Unit of Measure Code"; Rec."Length Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Length Unit of Measure Code';
                }

                field("Area Unit of Measure Code"; Rec."Area Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Area Unit of Measure Code';
                }

                field("Max. Current Density Bath 1"; Rec."Max. Current Density Bath 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 1';
                }

                field("Max. Current Density Bath 2"; Rec."Max. Current Density Bath 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 2';
                }

                field("Max. Current Density Bath 3"; Rec."Max. Current Density Bath 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath 3';
                }

                field("Max. Current Density Bath L"; Rec."Max. Current Density Bath L")
                {
                    ApplicationArea = All;
                    ToolTip = 'Max. Current Density Bath L';
                }

                field("Min. Anodise Time"; Rec."Min. Anodise Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min. Anodise Time';
                }

                field("Maximum Surface Attachrack"; Rec."Maximum Surface Attachrack")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum Surface Attachrack';
                }

                field("Multiple Staining Times Text"; Rec."Multiple Staining Times Text")
                {
                    ApplicationArea = All;
                    ToolTip = 'Multiple Staining Times Text';
                }

                field("Layer Thickness Tolerance"; Rec."Layer Thickness Tolerance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Layer Thickness Tolerance';
                }

                field("Bath Sheet Measure Mu No."; Rec."Bath Sheet Measure Mu No.")
                {
                    ApplicationArea = All;
                    ToolTip = '"Bath Sheet Measure Mu No.';
                }

                field("Rack Packaging Code"; Rec."Rack Packaging Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Rack Packaging Code';
                }

                field("Package Packaging Code"; Rec."Package Packaging Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Package Packaging Code';
                }

                field("Maximum Sawing Length"; Rec."Maximum Sawing Length")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum Sawing Length';
                }

                field("Sawing Routing No."; Rec."Sawing Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sawing Routing No.';
                }

                field("Foil Routing No."; Rec."Foil Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Add Foil Routing No.';
                }

                field("Remove Foil Routing No."; Rec."Remove Foil Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Remove Foil Routing No.';
                }

                field("VEC Routing No."; Rec."VEC Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'VEC Routing No.';
                }

                field("Wrap Routing No."; Rec."Wrap Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Wrap Routing No.';
                }

                field("Net/Gross Weight Factor"; Rec."Net/Gross Weight Factor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Net/Gross Weight Factor';
                }
            }

            group(Aucos)
            {
                field("Min. Residue Saw"; Rec."Min. Residue Saw")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min. Residue Saw';
                }

                field("Aucos Max. No. of Lines"; Rec."Aucos Max. No. of Lines")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Max. No. of Lines';
                }

                field("Aucos Staining Time"; Rec."Aucos Staining Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Staining Time';
                }

                field("Aucos Seal Time"; Rec."Aucos Seal Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Seal Time';
                }

                field("Aucos Sealconstant"; Rec."Aucos Sealconstant")
                {
                    ApplicationArea = All;
                    ToolTip = 'Aucos Sealconstant';

                }
            }
            group(Communication)
            {
                Caption = 'Communications';
                field("Aucos FTP Server"; Rec."Aucos FTP Server")
                {
                    ApplicationArea = All;
                    Caption = 'Aucos FTP Server';
                    ToolTip = 'Contains the Aucos FTP Server Hostname or IP';
                }
                field("Aucos FTP Port"; Rec."Aucos FTP Port")
                {
                    ApplicationArea = All;
                    Caption = 'Aucos FTP Port';
                    ToolTip = 'Contains the Port of the Aucos FTP Server';
                }
                field("Aucos FTP Username"; Rec."Aucos FTP Username")
                {
                    ApplicationArea = All;
                    Caption = 'Aucos FTP Username';
                    ToolTip = 'Contains the Username for the Aucos FTP Server';
                }
                field("Aucos FTP Password"; Rec."Aucos FTP Password")
                {
                    ApplicationArea = All;
                    Caption = 'Aucos FTP Password';
                    ToolTip = 'Contains the Username for the Aucos FTP Server';

                }
                field("Aucos FTP Path"; Rec."Aucos FTP Path")
                {
                    ApplicationArea = All;
                    Caption = 'Aucos FTP Path';
                    ToolTip = 'Contains the path for the Aucos FTP Server';
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