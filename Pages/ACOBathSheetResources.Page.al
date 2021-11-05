page 50026 "ACO Bath Sheet Resources"
{

    PageType = List;
    SourceTable = "ACO Bath Sheet Resource";
    Caption = 'Bath Sheet Resources';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Resource Name"; "Resource Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
