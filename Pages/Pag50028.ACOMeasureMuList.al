page 50028 "ACO Measure Mu List"
{
    PageType = List;
    SourceTable = "ACO Measure Mu";
    Caption = 'Measure Mu List';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bath Sheet No."; "Bath Sheet No.")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Value; Value)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
