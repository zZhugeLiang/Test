page 50042 "ACO Linked Support Holders"
{
    Caption = 'Linked Support Holders';
    PageType = List;
    SourceTable = "ACO Linked Support Holder";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(SupportHolders)
            {
                field("Support Holder Code"; "Support Holder Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field(Status; Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}