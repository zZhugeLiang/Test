page 50006 "ACO Color Groups"
{
    Caption = 'Color Groups';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Color";

    layout
    {
        area(Content)
        {
            repeater(ColorGroups)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {

        }
    }
}