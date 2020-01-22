page 50015 "ACO Holder Combinations"
{
    Caption = 'Holder Combinations';
    PageType = List;
    CardPageId = "ACO Holder Combination Card";
    RefreshOnActivate = true;
    SourceTable = "ACO Holder Combination";
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
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Profile Code"; "Profile Code")
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