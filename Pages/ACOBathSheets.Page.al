page 50019 "ACO Bath Sheets"
{
    PageType = List;
    SourceTable = "ACO Bath Sheet Header";
    Caption = 'Bath Sheets';
    InsertAllowed = false;
    UsageCategory = Lists;
    CardPageId = "ACO Bath Sheet";
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                    Editable = false;
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
                    ApplicationArea = All;
                }
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
                field("Total Surface Profiles"; "Total Surface Profiles")
                {
                    ApplicationArea = All;
                }
                field("Surface Attachrack"; "Surface Attachrack")
                {
                    ShowMandatory = true;
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
                field("GSX 1 Str."; "GSX 1 Str.")
                {
                    ApplicationArea = All;
                }
                field("GSX 2 Str."; "GSX 2 Str.")
                {
                    ApplicationArea = All;
                }
                field("GSX 3 Str."; "GSX 3 Str.")
                {
                    ApplicationArea = All;
                }
                field("GSX LL Str."; "GSX LL Str.")
                {
                    ApplicationArea = All;
                }
                field("GSX 1 Dhd."; "GSX 1 Dhd.")
                {
                    ApplicationArea = All;
                }
                field("GSX 2 Dhd."; "GSX 2 Dhd.")
                {
                    ApplicationArea = All;
                }
                field("GSX 3 Dhd."; "GSX 3 Dhd.")
                {
                    ApplicationArea = All;
                }
                field("GSX LL Dhd."; "GSX LL Dhd.")
                {
                    ApplicationArea = All;
                }
                field("GSX 1 Time"; "GSX 1 Time")
                {
                    ApplicationArea = All;
                }
                field("GSX 2 Time"; "GSX 2 Time")
                {
                    ApplicationArea = All;
                }
                field("GSX 3 Time"; "GSX 3 Time")
                {
                    ApplicationArea = All;
                }
                field("GSX LL Time"; "GSX LL Time")
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

            action("ACO Measure Mu List")
            {
                Caption = 'Measure Mu List';
                Image = Category;
                RunObject = Page "ACO Measure Mu List";
                RunPageLink = "Bath Sheet No." = field("No.");
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", true);
    end;
}