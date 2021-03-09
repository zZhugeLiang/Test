Page 50057 "ACO Selection Package Lines"
{
    Caption = 'Selection Package Lines';
    PageType = List;
    SourceTable = "ACO Package Line";
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
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = All;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field("Profile no."; Rec."Profile no.")
                {
                    ApplicationArea = All;
                }

                field(Length; Rec.Length)
                {
                    ApplicationArea = All;
                }

                field("Customer Item No."; Rec."Customer Item No.")
                {
                    ApplicationArea = All;
                }

                field("Sales Line No"; Rec."Sales Line No")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

