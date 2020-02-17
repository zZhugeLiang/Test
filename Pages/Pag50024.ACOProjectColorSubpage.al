page 50024 "ACO Project Color Subpage"
{
    Caption = 'Project Color Subpage';
    PageType = ListPart;
    SourceTable = "ACO Project Color Line";

    layout
    {
        area(Content)
        {
            repeater(ProjectColors)
            {
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field("Number of Measurements"; "Number of Measurements")
                {
                    ApplicationArea = All;
                }
                field("Target Time"; "Target Time")
                {
                    ApplicationArea = All;
                }
                field("Location"; "Location")
                {
                    ApplicationArea = All;
                }
                field("Target Type"; "Target Type")
                {
                    ApplicationArea = All;
                }
                field("Target Value"; "Target Value")
                {
                    ApplicationArea = All;
                }
                field("Target Minimum"; "Target Minimum")
                {
                    ApplicationArea = All;
                }
                field("Target Maximum"; "Target Maximum")
                {
                    ApplicationArea = All;
                }
                field("Operator Visible"; "Operator Visible")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}