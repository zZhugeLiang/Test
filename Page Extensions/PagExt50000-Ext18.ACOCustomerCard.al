pageextension 50000 "ACO Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(Content)
        {
            group(Production)
            {
                field("ACO OVIS Mail"; "ACO OVIS Mail")
                {
                    ApplicationArea = All;
                }

                field("ACO Euras"; "ACO Euras")
                {
                    ApplicationArea = All;
                }

                field("ACO Extra to Enumerate"; "ACO Extra to Enumerate")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}