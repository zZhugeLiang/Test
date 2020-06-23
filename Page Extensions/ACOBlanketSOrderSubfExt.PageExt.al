pageextension 50012 "ACO Blanket S. Order Subf. Ext" extends "Blanket Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Number of Units"; "ACO Number of Units")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
            }
            field("ACO Receipt Bag"; "ACO Receipt Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Bag"; "ACO Shipping Bag")
            {
                ApplicationArea = All;
            }
        }
    }
}