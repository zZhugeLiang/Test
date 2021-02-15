pageextension 50006 "ACO Released Prod. Order Ext." extends "Released Production Order"
{
    layout
    {
        addafter(Quantity)
        {
            field("ACO Quantity Charges New"; "ACO Quantity Charges New")
            {
                ApplicationArea = All;
            }
        }
    }
}