page 50018 "ACO Operating Types"
{
    Caption = 'Operating Types';
    PageType = List;
    SourceTable = "ACO Operating Type";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(OperatingTypes)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("Color Project"; "Color Project")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}