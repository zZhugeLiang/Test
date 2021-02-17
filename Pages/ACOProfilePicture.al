page 50049 "ACO Profile Picture"
{

    Caption = 'Profile Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "ACO Profile";

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                field("Picture File"; Rec."Picture File")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = ' ';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."Picture File");
    end;
}