page 50017 "ACO Attach Methods"
{
    Caption = 'Attach Methods';
    PageType = List;
    SourceTable = "ACO Attach Method";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(AttachMethods)
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