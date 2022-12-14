table 50010 "ACO Holder Type"
{
    Caption = 'Holder Type';
    DrillDownPageId = "ACO Holder Types";
    LookupPageId = "ACO Holder Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }

        field(4; Position; Integer)
        {
            Caption = 'Position';
            DataClassification = CustomerContent;
        }
        field(5; Location; Option)
        {
            Caption = 'Location';
            OptionMembers = Inside,Outside;
            OptionCaption = 'Inside,Outside';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}