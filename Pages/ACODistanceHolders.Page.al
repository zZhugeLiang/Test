page 50014 "ACO Distance Holders"
{
    Caption = 'Distance Holders';
    PageType = List;
    SourceTable = "ACO Distance Holder";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(SupportHolders)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Distance; Distance)
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