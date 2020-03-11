page 50051 "ACO WS Bath Sheet"
{
    PageType = Document;
    SourceTable = "ACO Bath Sheet Header";
    Caption = 'Bath Sheet';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
}