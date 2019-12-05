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

                field("Document1 Filename"; "Document1 Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        Document1.CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Document1 Filename", InStr);
                        CopyStream(OutStr, InStr);

                        Modify();
                    end;
                }
                field("Document2 Filename"; "Document2 Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        Document1.CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Document2 Filename", InStr);
                        CopyStream(OutStr, InStr);

                        Modify();
                    end;
                }
                field("Document3 Filename"; "Document3 Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                    begin
                        Document1.CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', "Document3 Filename", InStr);
                        CopyStream(OutStr, InStr);

                        Modify();
                    end;
                }
            }
            group(Comments)
            {
                Caption = 'Comments';
                field("ACO Comment Bath Card"; "ACO Comment Bath Card")
                {
                    ApplicationArea = All;
                }

                field("ACO Comment Work Note"; "ACO Comment Work Note")
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