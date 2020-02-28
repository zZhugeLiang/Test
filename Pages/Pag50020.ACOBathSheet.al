page 50020 "ACO Bath Sheet"
{

    PageType = Card;
    SourceTable = "ACO Bath Sheet Header";
    Caption = 'Bath Sheet';
    InsertAllowed = false;

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
                field("Report Day Part"; "Report Day Part")
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
            }

            group(MeasureGroup)
            {
                Caption = 'Measure';
                field("Measure Y-value"; "Measure Y-value")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-01"; "Measure Mu-01")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-02"; "Measure Mu-02")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-03"; "Measure Mu-03")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-04"; "Measure Mu-04")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-05"; "Measure Mu-05")
                {
                    ApplicationArea = All;
                }
                field("Measure Mu-06"; "Measure Mu-06")
                {
                    ApplicationArea = All;
                }
                field(Measure; Measure)
                {
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
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = All;
                }
                group(CalculatedValues)
                {
                    Caption = 'Calculated Values';
                    field("GSX 1 Str."; "GSX 1 Str.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 1 Dhd."; "GSX 1 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 1 Time"; "GSX 1 Time")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 2 Str."; "GSX 2 Str.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 2 Dhd."; "GSX 2 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 2 Time"; "GSX 2 Time")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 3 Str."; "GSX 3 Str.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 3 Dhd."; "GSX 3 Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX 3 Time"; "GSX 3 Time")
                    {
                        ApplicationArea = All;
                    }

                    field("GSX LL Str."; "GSX LL Str.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX LL Dhd."; "GSX LL Dhd.")
                    {
                        ApplicationArea = All;
                    }
                    field("GSX LL Time"; "GSX LL Time")
                    {
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
                    ReportTime: Time;
                begin
                    ACOBathSheetHeader := Rec;
                    ACOBathSheetHeader.SetRecFilter();
                    Report.Run(Report::"ACO Bath Sheet", true, false, ACOBathSheetHeader);

                    "Report Date" := CurrentDateTime();
                    ReportTime := DT2Time("Report Date");
                    if (ReportTime >= 060000T) and (ReportTime < 140000T) then
                        "Report Day Part" := '01';
                    if (ReportTime >= 140000T) and (ReportTime < 220000T) then
                        "Report Day Part" := '02';
                    if (ReportTime >= 220000T) or (ReportTime < 060000T) then
                        "Report Day Part" := '03';

                    "Report Day" := Date2DWY(DT2Date("Report Date"), 1);
                    "Report Week" := Date2DWY(DT2Date("Report Date"), 2);
                    "Report Year" := Date2DWY(DT2Date("Report Date"), 3);
                    Modify();

                    CurrPage.Update(true);
                end;
            }

            action("Export Aucos")
            {
                Caption = 'Export Aucos';
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
                    ACOAucosExport: XmlPort "ACO Aucos Export";
                    LastColorCode: Code[20];
                    LastPretreatmentCode: Code[20];
                    SealingTime: Decimal;
                    ExtraFlushing: Boolean;
                    XmlFile: File;
                    MaxNumberOfLinesErr: Label 'The number of lines in the Bath Sheet is larger than the maximum number of lines allowed.';
                    NotIntendedforLongLineErr: Label 'This Bath Sheet is not intended for the long line.';
                    NotAllLinesSameColorErr: Label 'Not all lines have the same color.';
                    NotAllLinesSamePretreatmentErr: Label 'Not all lines have the same pretreatment.';
                    ColorCannotBeExportedToAucosErr: Label 'This color cannot be exported to Aucos.';
                begin
                    ACOAucosExport.Run();
                    ACOAucosExport.Export();
                    exit;
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
                            ACOProfile.Get(ACOBathSheetLine);
                            if ACOProfile."Extra Flushing" then
                                ExtraFlushing := true;
                        // ACOBathSheetLine
                        until ACOBathSheetLine.Next() = 0;

                    // if ExtraFlushing then begin

                    // end else begin

                    // end;
                    // ACOAucosExport.Export()

                    //IF EXISTS(XmlFileName) THEN
                    //ERASE(XmlFileName);

                    // XmlFile.CREATE(XmlFileName);
                    // XmlFile.CREATEOUTSTREAM(OutStreamVar);
                    // XMLPORT.EXPORT(XMLPORT::"Your XmlPort",OutStreamVar); 
                    // XmlFile.CLOSE;
                end;
            }
        }
        area(Navigation)
        {
            action("ACO Bath Sheet Resources")
            {
                Caption = 'Bath Sheet Resources';
                Image = Category;
                RunObject = Page "ACO Bath Sheet Resources";
                RunPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}