page 50015 "ACO Holders"
{
    Caption = 'Holders';
    PageType = List;
    CardPageId = "ACO Holder Card";
    RefreshOnActivate = true;
    SourceTable = "ACO Holder";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(HolderCombinations)
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