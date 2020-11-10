tableextension 50012 "ACO Sales Cr.Memo Line Ext." extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50017; "ACO Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }
        field(50063; "ACO Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
            DataClassification = CustomerContent;
        }

        field(50065; "ACO Profile Cust. Description"; Text[100])
        {
            Caption = 'Profile Customer Description';
            DataClassification = CustomerContent;
        }
    }
}