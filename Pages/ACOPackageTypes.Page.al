page 50036 "ACO Package Types"
{

    PageType = List;
    SourceTable = "ACO Package Type";
    Caption = 'Package Types';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
