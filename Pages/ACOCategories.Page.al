page 50007 "ACO Categories"
{
    Caption = 'Categories';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Category";

    layout
    {
        area(Content)
        {
            repeater(Categories)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field("Calculate Minimum Circumf."; "Calculate Minimum Circumf.")
                {
                    ApplicationArea = All;
                }
                field("Add Short Length Charge"; "Add Short Length Charge")
                {
                    ApplicationArea = All;
                }
                field("Add Inner Cathode Charge"; "Add Inner Cathode Charge")
                {
                    ApplicationArea = All;
                }
                field("Add High Weight Charge"; "Add High Weight Charge")
                {
                    ApplicationArea = All;
                }
                field("Add Height Level Charge"; "Add Height Level Charge")
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
}