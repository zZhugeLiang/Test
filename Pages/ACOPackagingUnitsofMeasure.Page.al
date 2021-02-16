page 50038 "ACO Packaging Units of Measure"
{

    PageType = List;
    SourceTable = "ACO Packaging Unit of Measure";
    Caption = 'Packaging Units of Measure';
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
