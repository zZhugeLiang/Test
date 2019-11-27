pageextension 50002 "ACO Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(Content)
        {
            group(Production)
            {
                field("ACO Week Capacity"; "ACO Week Capacity")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}