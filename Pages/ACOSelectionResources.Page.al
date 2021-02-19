Page 50027 "ACO Selection Resources"
{
    Caption = 'Selection Resources';
    PageType = List;
    SourceTable = "Resource";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {

            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }

                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

