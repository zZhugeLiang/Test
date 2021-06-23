table 50039 "ACO Add EDI Info Customer"
{
    Caption = 'Add EDI Information Customer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(11; "Sales Order No"; Code[50])
        {
            Caption = 'Sales Order No';
            DataClassification = CustomerContent;
        }
        field(12; "Sales Order Line No."; Code[50])
        {
            Caption = 'Sales Order Line No.';
            DataClassification = CustomerContent;
        }
        field(13; "Endcustomer Name"; Text[150])
        {
            Caption = 'Endcustomer Name';
            DataClassification = CustomerContent;
        }
        field(14; "Endcustomer Adress 1"; Text[50])
        {
            Caption = 'Endcustomer Adress 1';
            DataClassification = CustomerContent;
        }
        field(15; "Endcustomer Adress 2"; Text[50])
        {
            Caption = 'Endcustomer Adress 2';
            DataClassification = CustomerContent;
        }
        field(16; "Endcustomer Adress 3"; Text[50])
        {
            Caption = 'Endcustomer Adress 3';
            DataClassification = CustomerContent;
        }
        field(17; "Endcustomer Adress 4"; Text[50])
        {
            Caption = 'Endcustomer Adress 4';
            DataClassification = CustomerContent;
        }
        field(18; "Customer Item No"; Code[50])
        {
            Caption = 'Customer Item No';
            DataClassification = CustomerContent;
        }
        field(19; "Customer Item Description"; Text[50])
        {
            Caption = 'Customer Item Description';
            DataClassification = CustomerContent;
        }
        field(20; "Alloy"; Text[50])
        {
            Caption = 'Alloy';
            DataClassification = CustomerContent;
        }
        field(21; "Loc Name"; Text[50])
        {
            Caption = 'Loc Name';
            DataClassification = CustomerContent;
        }
        field(22; "Loc ZipCode"; Text[50])
        {
            Caption = 'Loc ZipCode';
            DataClassification = CustomerContent;
        }
        field(23; "Loc City"; Text[50])
        {
            Caption = 'Loc City';
            DataClassification = CustomerContent;
        }
        field(24; "Loc Country"; Text[50])
        {
            Caption = 'Loc Country';
            DataClassification = CustomerContent;
        }
        field(25; "ZIN"; Text[150])
        {
            Caption = 'ZIN';
            DataClassification = CustomerContent;
        }
        field(26; "Customer Order No"; Text[50])
        {
            Caption = 'Customer Order No';
            DataClassification = CustomerContent;
        }
        field(27; "Language"; Code[50])
        {
            Caption = 'Language';
            DataClassification = CustomerContent;
        }
        field(28; "Sawing Length"; Text[50])
        {
            Caption = 'Sawing Length';
            DataClassification = CustomerContent;
        }
        field(29; "External Line No."; Code[50])
        {
            Caption = 'External Line No.';
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
