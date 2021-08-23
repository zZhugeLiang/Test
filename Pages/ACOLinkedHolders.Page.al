page 50045 "ACO Linked Holders"
{
    Caption = 'Linked Holders';
    PageType = List;
    CardPageId = "ACO Linked Holder Card";
    RefreshOnActivate = true;
    SourceTable = "ACO Linked Holder";
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
                field(Length; Length)
                {
                    ApplicationArea = All;
                }
                field("Color Group Code"; "Color Group Code")
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