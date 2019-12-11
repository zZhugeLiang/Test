page 50009 "ACO Profile Card"
{
    Caption = 'Profile Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ACO Profile";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

            }

            group(ProductionParameters)
            {
                Caption = 'Production Parameters';

                field(Hollow; Hollow)
                {
                    ApplicationArea = All;
                }
                field(Bent; Bent)
                {
                    ApplicationArea = All;
                }
                field("Extra Flushing"; "Extra Flushing")
                {
                    ApplicationArea = All;
                }
                field("Area"; "Area")
                {
                    ApplicationArea = All;
                }
                field("Not Measurable"; "Not Measurable")
                {
                    ApplicationArea = All;
                }

                field("Weight per meter"; "Weight per meter")
                {
                    ApplicationArea = All;
                }
                field("Category"; "Category")
                {
                    ApplicationArea = All;
                }
                field("Circumference"; "Circumference")
                {
                    ApplicationArea = All;
                }
                field("Correction Factor"; "Correction Factor")
                {
                    ApplicationArea = All;
                }
                field("Height Level"; "Height Level")
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
            group(Documents)
            {
                Caption = 'Documents';
                field("Picture Filename"; "Picture Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        Picture.CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Picture Filename", InStr);
                        CopyStream(OutStr, InStr);
                        Modify();
                    end;
                }
                field("Clamping Method Filename"; "Clamping Method Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        "Clamping Method".CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Clamping Method Filename", InStr);
                        CopyStream(OutStr, InStr);
                        Modify();
                    end;
                }
                field("Packaging Instr. Filename"; "Packaging Instr. Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        "Packaging Instructions".CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Packaging Instr. Filename", InStr);
                        CopyStream(OutStr, InStr);
                        Modify();
                    end;
                }
            }
            group(Comments)
            {
                Caption = 'Comments';
                field("ACO Comment Bath Card"; "Comment Bath Card")
                {
                    ApplicationArea = All;
                }

                field("ACO Comment Work Note"; "Comment Work Note")
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
            action(ProfileCustomers)
            {
                Caption = 'Profile Customers';
                ApplicationArea = All;
                RunObject = Page "ACO Profile Customers";
                RunPageLink = "Profile Code" = field("Code");
            }

            action(DownloadPicture)
            {
                Caption = 'Download Picture';
                ApplicationArea = All;
                Image = Document;
                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    Picture.CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Picture Filename")
                end;
            }
            action(DownloadClampingMethod)
            {
                Caption = 'Download Clamping Method';
                ApplicationArea = All;
                Image = Document;
                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    "Clamping Method".CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Clamping Method Filename")
                end;
            }
            action(DownloadPackagingInstructions)
            {
                Caption = 'Download Packaging Instructions';
                ApplicationArea = All;
                Image = Document;
                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    "Packaging Instructions".CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Packaging Instr. Filename")
                end;
            }
        }
    }

            action(DownloudDocument1)
            {
                Caption = 'Download Document 1';
                ApplicationArea = All;
                Image = Document;

                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    Document1.CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Document1 Filename")
                end;
            }

            action(DownloudDocument2)
            {
                Caption = 'Download Document 2';
                ApplicationArea = All;
                Image = Document;

                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    Document1.CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Document2 Filename")
                end;
            }

            action(DownloudDocument3)
            {
                Caption = 'Download Document 3';
                ApplicationArea = All;
                Image = Document;

                trigger OnAction()
                var
                    InStr: InStream;
                begin
                    Document1.CreateInStream(InStr);
                    DownloadFromStream(InStr, '', '', '', "Document3 Filename")
                end;
            }
        }
    }
}