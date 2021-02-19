page 50041 "ACO Linked Holder Types"
{
    Caption = 'Linked Holder Types';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "ACO Linked Holder Type";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Holders)
            {
                field("Holder Type Code"; "Holder Type Code")
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
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}