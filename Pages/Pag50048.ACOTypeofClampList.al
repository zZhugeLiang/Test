page 50048 "ACO Type of Clamp List"
{

    PageType = List;
    SourceTable = "ACO Type of Clamp";
    Caption = 'Type of Clamp List';
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
                    ToolTip = 'Code';
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Desription';
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Status';
                }
            }
        }
    }

}
