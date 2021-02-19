page 50043 "ACO Linked Distance Holders"
{
    Caption = 'Linked Distance Holders';
    PageType = List;
    SourceTable = "ACO Linked Distance Holder";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(SupportHolders)
            {
                field("Distance Holder Code"; "Distance Holder Code")
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

                field(Status; Status)
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
}