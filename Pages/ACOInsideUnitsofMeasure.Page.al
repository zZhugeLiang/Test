page 50039 "ACO Inside Units of Measure"
{

    PageType = List;
    SourceTable = "ACO Inside Unit of Measure";
    Caption = 'Inside Units of Measure';
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
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
