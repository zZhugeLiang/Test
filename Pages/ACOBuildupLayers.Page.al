page 50040 "ACO Build-up Layers"
{

    PageType = List;
    SourceTable = "ACO Build-up Layer";
    Caption = 'Build-up Layers';
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
