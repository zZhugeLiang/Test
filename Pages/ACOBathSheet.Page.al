page 50020 "ACO Bath Sheet"
{
    PageType = Document;
    SourceTable = "ACO Bath Sheet Header";
    Caption = 'Bath Sheet';
    InsertAllowed = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Production Line"; "Production Line")
                {
                    ApplicationArea = All;
                }
                field("Note Bath Sheet"; "Note Bath Sheet")
                {
                    ApplicationArea = All;
                }
                field("Attach Method"; "Attach Method")
                {
                    ApplicationArea = All;
                }
                field(Circumference; Circumference)
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Creation Week"; "Creation Week")
                {
                    ApplicationArea = All;
                }
                field("Creation Year"; "Creation Year")
                {
                    ApplicationArea = All;
                }
                field("Report Date"; "Report Date")
                {
                    ApplicationArea = All;
                }
                field("Report Day Part"; "Report Day Part")
                {
                    ApplicationArea = All;
                }
                field("Report Day"; "Report Day")
                {
                    ApplicationArea = All;
                }
                field("Report Week"; "Report Week")
                {
                    ApplicationArea = All;
                }
                field("Report Year"; "Report Year")
                {
                    ApplicationArea = All;
                }
                field("Production Date"; "Production Date")
                {
                    ApplicationArea = All;
                }
                field("Production Week"; "Production Week")
                {
                    ApplicationArea = All;
                }
                field("Production Year"; "Production Year")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field(Complete; Complete)
                {
                    ApplicationArea = All;
                }
                field("Bath Sheet Comment"; "Bath Sheet Comment")
                {
                    ApplicationArea = All;
                }
                field("Total Quantity"; "Total Quantity")
                {
                    ApplicationArea = All;
                }
                field("Measure Y-value"; "Measure Y-value")
                {
                    ApplicationArea = All;
                }
                field(Measure; Measure)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }

            group(Details)
            {
                Caption = 'Details';
                field("More Than One Thick"; "More Than One Thick")
                {
                    ApplicationArea = All;
                }
                field(Thick; Thick)
                {
                    ApplicationArea = All;
                }
                field("More Than One Thin"; "More Than One Thin")
                {
                    ApplicationArea = All;
                }
                field(Thin; Thin)
                {
                    ApplicationArea = All;
                }
                field(Euras; Euras)
                {
                    ApplicationArea = All;
                }
                field("Total Surface Profiles"; "Total Surface Profiles")
                {
                    ApplicationArea = All;
                }
                field("Surface Attachrack"; "Surface Attachrack")
                {
                    ApplicationArea = All;
                }
                field("Surface Addition"; "Surface Addition")
                {
                    ApplicationArea = All;
                }
                field("Total Surface"; "Total Surface")
                {
                    ApplicationArea = All;
                }
                field("Layer Thickness"; "Layer Thickness")
                {
                    ApplicationArea = All;
                }
                field("Extra to Enumerate"; "Extra to Enumerate")
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
                field("Color Measurement"; "Color Measurement")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = All;
                }
                group(CalculatedValues)
                {
                    Caption = 'Calculated Values';
                    field("GSX 1 Str."; "GSX 1 Str.")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX 1 Dhd."; "GSX 1 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 1 Time"; "GSX 1 Time")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX 2 Str."; "GSX 2 Str.")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX 2 Dhd."; "GSX 2 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 2 Time"; "GSX 2 Time")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX 3 Str."; "GSX 3 Str.")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX 3 Dhd."; "GSX 3 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 3 Time"; "GSX 3 Time")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }

                    field("GSX LL Str."; "GSX LL Str.")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                    field("GSX LL Dhd."; "GSX LL Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX LL Time"; "GSX LL Time")
                    {
                        DecimalPlaces = 0;
                        ApplicationArea = All;
                    }
                }
            }

            part("ACO Bath Sheet Subpage"; "ACO Bath Sheet Subpage")
            {
                SubPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Update Process Times")
            {
                Caption = 'Update Process Times';
                Image = Approval;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TestField("Surface Attachrack");
                    TestField("Attach Method");
                    CalculateProcessTimes();
                end;
            }

            action("Complete Bath Sheet")
            {
                Caption = 'Complete Bath Sheet';
                Image = Approval;
                ShortcutKey = F11;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Validate(Complete, true);
                end;
            }

            action("Print Bath Sheet")
            {
                Caption = 'Print Bath Sheet';
                Image = Print;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ACOBathSheetHeader: Record "ACO Bath Sheet Header";
                begin
                    ACOBathSheetHeader := Rec;
                    ACOBathSheetHeader.SetRecFilter();
                    Report.Run(Report::"ACO Bath Sheet", true, false, ACOBathSheetHeader);

                    CurrPage.Update(true);
                end;
            }

            action("Download Aucos")
            {
                Caption = 'Download Aucos File';
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ACOBathSheetHeader: Record "ACO Bath Sheet Header";
                    ACOBathSheetLine: Record "ACO Bath Sheet Line";
                    ACOColor: Record "ACO Color";
                    ACOProfile: Record "ACO Profile";
                    ACOPretreatment: Record "ACO Pretreatment";
                    ACOAppSetup: Record "ACO App Setup";
                    Item: Record Item;
                    TempBlob: Codeunit "Temp Blob";
                    FileOutStream: OutStream;
                    FileInStream: InStream;
                    LastColorCode: Code[20];
                    LastPretreatmentCode: Code[20];
                    AucosFileName: Text;
                    ExtraFlushing: Boolean;
                    MaxNumberOfLinesErr: Label 'The number of lines in the Bath Sheet is larger than the maximum number of lines allowed.';
                    NotIntendedforLongLineErr: Label 'This Bath Sheet is not intended for the long line.';
                    NotAllLinesSameColorErr: Label 'Not all lines have the same color.';
                    NotAllLinesSamePretreatmentErr: Label 'Not all lines have the same pretreatment.';
                    ColorCannotBeExportedToAucosErr: Label 'This color cannot be exported to Aucos.';
                begin
                    ACOAppSetup.Get();
                    ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
                    if ACOAppSetup."Aucos Max. No. of Lines" > 0 then
                        if ACOBathSheetLine.Count() > ACOAppSetup."Aucos Max. No. of Lines" then
                            Error(MaxNumberOfLinesErr);

                    if "Production Line" <> "Production Line"::Long then
                        Error(NotIntendedforLongLineErr);

                    if ACOBathSheetLine.FindSet() then
                        repeat
                            if LastColorCode <> '' then
                                if LastColorCode <> ACOBathSheetLine.Color then
                                    Error(NotAllLinesSameColorErr);

                            ACOColor.Get(ACOBathSheetLine.Color);
                            if not ACOColor.Aucos then
                                Error(ColorCannotBeExportedToAucosErr);

                            Item.Get(ACOBathSheetLine.Treatment);

                            ACOPretreatment.Get(Item."ACO Pretreatment");

                            if LastPretreatmentCode <> '' then
                                if LastPretreatmentCode <> Item."ACO Pretreatment" then
                                    Error(NotAllLinesSamePretreatmentErr);

                            LastColorCode := ACOBathSheetLine.Color;
                            LastPretreatmentCode := Item."ACO Pretreatment";
                            ACOProfile.Get(ACOBathSheetLine."Profile Code");
                            if ACOProfile."Extra Flushing" then
                                ExtraFlushing := true;
                        // ACOBathSheetLine
                        until ACOBathSheetLine.Next() = 0;

                    TempBlob.CreateOutStream(FileOutStream);
                    ACOBathSheetHeader := Rec;
                    ACOBathSheetHeader.SetRecFilter();
                    Xmlport.Export(Xmlport::"ACO Aucos Export", FileOutStream, ACOBathSheetHeader);
                    TempBlob.CreateInStream(FileInStream);

                    AucosFileName := "No." + '_export.csv';
                    DownloadFromStream(FileInStream, '', '', '', AucosFileName);
                end;
            }
            action("Send to Aucos")
            {
                Caption = 'Send to Aucos';
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ACOBathSheetHeader: Record "ACO Bath Sheet Header";
                    ACOBathSheetLine: Record "ACO Bath Sheet Line";
                    ACOColor: Record "ACO Color";
                    ACOProfile: Record "ACO Profile";
                    ACOPretreatment: Record "ACO Pretreatment";
                    ACOAppSetup: Record "ACO App Setup";
                    Item: Record Item;
                    TempBlob: Codeunit "Temp Blob";
                    base64Convert: Codeunit "Base64 Convert";
                    ACOFTPConnector: Codeunit "ACO FTP Connector";
                    FileOutStream: OutStream;
                    FileInStream: InStream;
                    FileBuffer: Text;
                    LastColorCode: Code[20];
                    LastPretreatmentCode: Code[20];
                    ExtraFlushing: Boolean;
                    MaxNumberOfLinesErr: Label 'The number of lines in the Bath Sheet is larger than the maximum number of lines allowed.';
                    NotIntendedforLongLineErr: Label 'This Bath Sheet is not intended for the long line.';
                    NotAllLinesSameColorErr: Label 'Not all lines have the same color.';
                    NotAllLinesSamePretreatmentErr: Label 'Not all lines have the same pretreatment.';
                    ColorCannotBeExportedToAucosErr: Label 'This color cannot be exported to Aucos.';
                begin
                    ACOAppSetup.Get();
                    ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
                    if ACOAppSetup."Aucos Max. No. of Lines" > 0 then
                        if ACOBathSheetLine.Count() > ACOAppSetup."Aucos Max. No. of Lines" then
                            Error(MaxNumberOfLinesErr);

                    if "Production Line" <> "Production Line"::Long then
                        Error(NotIntendedforLongLineErr);

                    if ACOBathSheetLine.FindSet() then
                        repeat
                            if LastColorCode <> '' then
                                if LastColorCode <> ACOBathSheetLine.Color then
                                    Error(NotAllLinesSameColorErr);

                            ACOColor.Get(ACOBathSheetLine.Color);
                            if not ACOColor.Aucos then
                                Error(ColorCannotBeExportedToAucosErr);

                            Item.Get(ACOBathSheetLine.Treatment);

                            ACOPretreatment.Get(Item."ACO Pretreatment");

                            if LastPretreatmentCode <> '' then
                                if LastPretreatmentCode <> Item."ACO Pretreatment" then
                                    Error(NotAllLinesSamePretreatmentErr);

                            LastColorCode := ACOBathSheetLine.Color;
                            LastPretreatmentCode := Item."ACO Pretreatment";
                            ACOProfile.Get(ACOBathSheetLine."Profile Code");
                            if ACOProfile."Extra Flushing" then
                                ExtraFlushing := true;
                        // ACOBathSheetLine
                        until ACOBathSheetLine.Next() = 0;

                    TempBlob.CreateOutStream(FileOutStream);
                    ACOBathSheetHeader := Rec;
                    ACOBathSheetHeader.SetRecFilter();
                    Xmlport.Export(Xmlport::"ACO Aucos Export", FileOutStream, ACOBathSheetHeader);
                    TempBlob.CreateInStream(FileInStream);
                    FileInStream.Read(FileBuffer, TempBlob.Length());


                    ACOFTPConnector.uploadFile(
                        ACOAppSetup."Aucos FTP Path" + "No." + '_export.csv',
                        ACOAppSetup."Aucos FTP Server",
                        ACOAppSetup."Aucos FTP Port",
                        ACOAppSetup."Aucos FTP Username",
                        ACOAppSetup."Aucos FTP Password",
                        base64Convert.ToBase64(FileBuffer));
                end;
            }
            action("Export Aucos2")
            {
                Caption = 'Export Aucos test';
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ACOBathSheetHeader: Record "ACO Bath Sheet Header";
                    TempBlob: Codeunit "Temp Blob";
                    FileOutStream: OutStream;
                    FileInStream: InStream;
                    AucosFileName: Text;
                begin
                    TempBlob.CreateOutStream(FileOutStream);

                    ACOBathSheetHeader := Rec;
                    ACOBathSheetHeader.SetRecFilter();
                    Xmlport.Export(Xmlport::"ACO Aucos Export", FileOutStream, ACOBathSheetHeader);
                    TempBlob.CreateInStream(FileInStream);

                    AucosFileName := "No." + '_export.csv';
                    DownloadFromStream(FileInStream, '', '', '', AucosFileName);
                end;
            }
        }
        area(Navigation)
        {
            action("ACO Bath Sheet Resources")
            {
                Caption = 'Bath Sheet Resources';
                Image = Resource;
                RunObject = Page "ACO Bath Sheet Resources";
                RunPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }

            action("ACO Measure Mu List")
            {
                Caption = 'Measure Mu List';
                Image = EditList;
                RunObject = Page "ACO Measure Mu List";
                RunPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }

            action("ACO Measured Colors")
            {
                Caption = 'Measured Colors';
                Image = Category;
                RunObject = Page "ACO Measured Colors";
                RunPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}