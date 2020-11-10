pageextension 50013 "ACO Posted Sales Shpt Subf Ext" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
            }

            field("ACO Customer Item No."; "ACO Customer Item No.")
            {
                ApplicationArea = All;
            }

            field("ACO Profile Cust. Description"; "ACO Profile Cust. Description")
            {
                ApplicationArea = All;
            }
        }
    }
}