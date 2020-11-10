pageextension 50015 "ACO Pstd Sales CrMemo Subf Ext" extends "Posted Sales Cr. Memo Subform"
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