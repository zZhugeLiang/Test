pageextension 50013 "ACO Posted Sales Shpt Subf Ext" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

            field("ACO Customer Item No."; "ACO Customer Item No.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

            field("ACO Profile Cust. Description"; "ACO Profile Cust. Description")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("ACO Number of Units"; "ACO Number of Units")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
    }
}