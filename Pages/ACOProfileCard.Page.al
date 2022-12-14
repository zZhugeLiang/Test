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

                field("Last DateTime Modified"; "Last DateTime Modified")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }

            group(ProductionParameters)
            {
                Caption = 'Production Parameters';

                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Area"; "Area")
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
                    ShowMandatory = true;
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
            }
            group(Documents)
            {
                Caption = 'Documents';
                field("Picture Filename"; "Picture Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnValidate()
                    begin
                        if Rec."Picture Filename" = '' then
                            Clear(Rec."Picture File");
                        CurrPage.Update();
                    end;

                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                        tmpFileName: Text;
                    begin
                        "Picture File".CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', tmpFileName, InStr);

                        if tmpFileName = '' then
                            exit;

                        CopyStream(OutStr, InStr);
                        "Picture Filename" := CopyStr(tmpFileName, 1, 250);
                        Rec.Modify();
                    end;
                }
                field("Clamping Method Filename"; "Clamping Method Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnValidate()
                    begin
                        if Rec."Clamping Method Filename" = '' then
                            Clear(Rec."Clamping Method File");
                        CurrPage.Update();
                    end;

                    trigger OnAssistEdit()
                    var
                        InStr: InStream;
                        OutStr: OutStream;
                        tmpFileName: Text;
                    begin
                        "Clamping Method File".CreateOutStream(OutStr);
                        UploadIntoStream('Upload document', '', '', tmpFileName, InStr);

                        if tmpFileName = '' then
                            exit;

                        CopyStream(OutStr, InStr);
                        "Clamping Method Filename" := CopyStr(tmpFileName, 1, 250);
                        Rec.Modify();
                    end;
                }
                field("Packaging Instr. Filename"; "Packaging Instr. Filename")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnValidate()
                    begin
                        if Rec."Packaging Instr. Filename" = '' then
                            Clear(Rec."Packaging Instructions File");
                        CurrPage.Update();
                    end;

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
                        Rec.Modify();
                    end;
                }
            }
            group(Comments)
            {
                Caption = 'Comments';
                field("ACO Comment Bath Card"; "Comment Bath Card")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }

                field("ACO Comment Work Note"; "Comment Work Note")
                {
                    MultiLine = true;
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
                SubPageLink = "Code" = field("Code");
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
                ToolTip = 'Download Picture';
                trigger OnAction()
                begin
                    DownloadPicture();
                end;
            }

            action(DownloadClampingMethod)
            {
                Caption = 'Download Clamping Method';
                ApplicationArea = All;
                Image = Document;
                ToolTip = 'Download Clamping Method';
                trigger OnAction()
                begin
                    DownloadClampingMethod();
                end;
            }

            action(DownloadPackagingInstructions)
            {
                Caption = 'Download Packaging Instructions';
                ApplicationArea = All;
                Image = Document;
                ToolTip = 'Download Packaging Instructions';
                trigger OnAction()
                begin
                    DownloadPackagingInstructions();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.CalcFields(Rec."Picture File");
    end;
}