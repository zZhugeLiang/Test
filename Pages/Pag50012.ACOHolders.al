page 50012 "ACO Holders"
{
    Caption = 'Holders';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "ACO Holder";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Holders)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Position; Position)
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