table 50036 "ACO Imported Sales Order Line"
{
    Caption = 'Imported Sales Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11; "Order No."; Text[100])
        {
            Caption = 'Quote No.';
            DataClassification = CustomerContent;
        }
        field(12; "Sell-to Customer No."; Text[100])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(13; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
        }
        field(14; "Bill-to Customer No."; Text[100])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(15; "Bill-to Customer Name"; Text[100])
        {
            Caption = 'Bill-to Customer Name';
            DataClassification = CustomerContent;
        }
        field(16; "Requested Delivery Date"; Text[100])
        {
            Caption = 'Requested Delivery Date';
            DataClassification = CustomerContent;
        }
        field(17; "External Document No."; Text[100])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(18; "Item No."; Text[100])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
        }
        field(19; "Profile Code"; Text[100])
        {
            Caption = 'Profile Code';
            DataClassification = CustomerContent;
        }
        field(20; "Variant Code"; Text[100])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(21; "Number of Units"; Text[100])
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;
        }
        field(30; "Quote No."; Text[100])
        {
            Caption = 'Quote No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = New,Checked,Error,Processed;
            OptionCaption = 'New,Checked,Error,Processed';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(51; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
