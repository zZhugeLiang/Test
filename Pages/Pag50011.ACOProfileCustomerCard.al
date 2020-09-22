page 50011 "ACO Profile Customer Card"
{
    Caption = 'Profile Customer Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ACO Profile Customer";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }

                field("Profile Code"; "Profile Code")
                {
                    ApplicationArea = All;
                }

                field("Profile Description"; "Profile Description")
                {
                    ApplicationArea = All;
                }

                field("Customer Item No."; "Customer Item No.")
                {
                    ApplicationArea = All;
                }

                field("Customer of Customer"; "Customer of Customer")
                {
                    ApplicationArea = All;

                }
                field("Price Scheme Code"; "Price Scheme Code")
                {
                    ApplicationArea = All;
                }

                field("Last DateTime Modified"; "Last DateTime Modified")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }

            group(AddressInformation)
            {
                Caption = 'Address';

                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    ApplicationArea = All;
                }
            }
            group(ProductionParameters)
            {
                Caption = 'Production Parameters';

                field("Packaging Instr. Filename"; "Packaging Instr. Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                        tmpFileName: Text;
                    begin
                        "Packaging Instructions File".CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', tmpFileName, InStr);
                        CopyStream(OutStr, InStr);
                        "Packaging Instr. Filename" := CopyStr(tmpFileName, 1, 250);
                        Modify();
                    end;
                }
                field(Euras; Euras)
                {
                    ApplicationArea = All;
                }
                field("High End"; "High End")
                {
                    ApplicationArea = All;
                }
                field("Extra to Enumerate"; "Extra to Enumerate")
                {
                    ApplicationArea = All;
                }
                field("Thick Staining Time"; "Thick Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Thin Staining Time"; "Thin Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Minimum Current Density"; "Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; "Maximum Current Density")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(DownloadPackagingInstructions)
            {
                Caption = 'Download Packaging Instructions';
                ApplicationArea = All;
                Image = Document;
                ToolTip = 'Download Packaging Instructions';
                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    "Packaging Instructions File".CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Packaging Instr. Filename");
                end;
            }
        }

        area(Navigation)
        {
            action("ACO Linked Holders")
            {
                Caption = 'Linked Holders';
                Image = Category;
                RunObject = Page "ACO Linked Holders";
                RunPageLink = "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code");
                ApplicationArea = All;
            }

            action("ACO Holders")
            {
                Caption = 'Holders';
                Image = Category;
                RunObject = Page "ACO Holders";
                ApplicationArea = All;
            }

            action("ACO Linked Packaging List")
            {
                Caption = 'Linked Packaging List';
                Image = CoupledItem;
                RunObject = Page "ACO Linked Packaging List";
                RunPageLink = "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code");
                ApplicationArea = All;
            }

            action("ACO Packaging List")
            {
                Caption = 'Packaging List';
                Image = CopyItem;
                RunObject = Page "ACO Packaging List";
                ApplicationArea = All;
            }
        }
    }
}