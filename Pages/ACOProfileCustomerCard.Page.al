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
                Group(Column1)
                {
                    ShowCaption = false;
                    field("Customer No."; Rec."Customer No.")
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                    }

                    field("Profile Code"; Rec."Profile Code")
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                    }

                    field("Customer Item No."; Rec."Customer Item No.")
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                    }
                }


                Group(Column2)
                {
                    ShowCaption = false;
                    field("Customer Name"; Rec."Customer Name")
                    {
                        ApplicationArea = All;
                    }

                    field("Profile Description"; Rec."Profile Description")
                    {
                        ApplicationArea = All;
                    }

                    field("Customer of Customer"; Rec."Customer of Customer")
                    {
                        ApplicationArea = All;
                    }
                }
                field("Price Scheme Code"; Rec."Price Scheme Code")
                {
                    ApplicationArea = All;
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }

            group(AddressInformation)
            {
                Caption = 'Address';

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
            }
            group(ProductionParameters)
            {
                Caption = 'Production Parameters';

                field("Packaging Instr. Filename"; Rec."Packaging Instr. Filename")
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
                        if tmpFileName = '' then
                            exit;
                        CopyStream(OutStr, InStr);
                        "Packaging Instr. Filename" := CopyStr(tmpFileName, 1, 250);
                        Modify();
                    end;
                }
                field(Euras; Euras)
                {
                    ApplicationArea = All;
                }
                field("High End"; Rec."High End")
                {
                    ApplicationArea = All;
                }
                field("Extra to Enumerate"; Rec."Extra to Enumerate")
                {
                    ApplicationArea = All;
                }
                field("Thick Staining Time"; Rec."Thick Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Thin Staining Time"; Rec."Thin Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Minimum Current Density"; Rec."Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; Rec."Maximum Current Density")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(ProfilePicture; "ACO Profile Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "Code" = field("Profile Code");
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
                begin
                    if Rec.DownloadPackagingInstructions() then;
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
                RunPageLink = "Customer No." = field("Customer No."), "Item No." = field("Profile Code");
                ApplicationArea = All;
            }

            // action("ACO Holders")
            // {
            //     Caption = 'Holders';
            //     Image = Category;
            //     RunObject = Page "ACO Holders";
            //     ApplicationArea = All;
            // }

            action("ACO Linked Packaging List")
            {
                Caption = 'Linked Packaging List';
                Image = CoupledItem;
                RunObject = Page "ACO Linked Packaging List";
                RunPageLink = "Customer No." = field("Customer No."), "Item No." = field("Profile Code");
                ApplicationArea = All;
            }
        }
    }

    trigger OnClosePage()
    begin
        Rec.TestPK();
    end;
}