tableextension 50012 "ACO Sales Cr.Memo Line Ext." extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50016; "ACO Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            DataClassification = CustomerContent;
        }
        field(50017; "ACO Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }
        field(50034; "ACO Number of Units"; Decimal)
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;
        }
        field(50040; "ACO Sawing"; Boolean)
        {
            Caption = 'Sawing';
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