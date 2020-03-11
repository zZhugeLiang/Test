page 50023 "ACO Project Color"
{
    PageType = Document;
    SourceTable = "ACO Project Color Header";
    Caption = 'Project Color';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            Group(General)
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

            part("ACO Project Color Subpage"; "ACO Project Color Subpage")
            {
                SubPageLink = "Project Color No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}