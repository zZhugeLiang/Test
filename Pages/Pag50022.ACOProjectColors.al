page 50022 "ACO Project Colors"
{
    Caption = 'Project Colors';
    PageType = List;
    SourceTable = "ACO Project Color Header";
    UsageCategory = Lists;
    CardPageId = "ACO Project Color";
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(ProjectColors)
            {
                field("No."; "No.")
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
                field("Note"; "Note")
                {
                    ApplicationArea = All;
                }
                field("Note Operator"; "Note Operator")
                {
                    ApplicationArea = All;
                }
                field("Conductivity Factor"; "Conductivity Factor")
                {
                    ApplicationArea = All;
                }
                field("Inactive"; "Inactive")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}