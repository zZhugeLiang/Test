pageextension 50008 "ACO Item Variants Extension" extends "Item Variants"
{
    layout
    {
        addafter("Description 2")
        {
            field("ACO Number of Meters"; "ACO Number of Meters")
            {
                ApplicationArea = All;
            }
        }
    }
}