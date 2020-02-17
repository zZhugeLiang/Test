page 50026 "ACO Bath Sheet Resources"
{

    PageType = List;
    SourceTable = "ACO Bath Sheet Resource";
    Caption = 'ACO Bath Sheet Resources';
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
