pageextension 50007 "ACO Rel. Prod. Order Lines Ext" extends "Released Prod. Order Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("ACO Quantity Charges"; "ACO Quantity Charges")
            {
                ApplicationArea = All;
            }
            field("ACO Charges per Bath Profile"; "ACO Charges per Bath Profile")
            {
                ApplicationArea = All;
            }
        }
    }
}