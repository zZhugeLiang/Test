table 50013 "ACO Holder"
{
    Caption = 'Holder';
    DrillDownPageId = "ACO Holders";
    LookupPageId = "ACO Holders";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }


        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }

        field(4; "Profile Code"; Code[10])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile";
            DataClassification = CustomerContent;
        }

        field(5; "Length"; Decimal)
        {
            Caption = 'Length';
            DataClassification = CustomerContent;
        }

        field(6; "Color Group Code"; Code[20])
        {
            Caption = 'Color Group Code';
            TableRelation = "ACO Color Group";
            DataClassification = CustomerContent;
        }

        field(7; "Holder Code"; Code[20])
        {
            Caption = 'Holder Code';
            TableRelation = "ACO Holder Type";
            DataClassification = CustomerContent;
        }

        field(8; "Support Holder Code"; Code[20])
        {
            Caption = 'Support Holder Code';
            TableRelation = "ACO Support Holder";
            DataClassification = CustomerContent;
        }

        field(9; "Distance Holder Code"; Code[20])
        {
            Caption = 'Distance Holder Code';
            TableRelation = "ACO Distance Holder";
            DataClassification = CustomerContent;
        }

        field(10; "Attach Method Code"; Code[10])
        {
            Caption = 'Attach Method Code';
            TableRelation = "ACO Attach Method";
            DataClassification = CustomerContent;
        }

        field(11; "Type of Clamp"; Text[100])
        {
            Caption = 'Type of Clamp';
            DataClassification = CustomerContent;
        }

        field(12; Comment; Text[50])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }

        field(13; Method; Text[50])
        {
            Caption = 'Method';
            DataClassification = CustomerContent;
        }
        field(14; Space; Decimal)
        {
            Caption = 'Space';
            DataClassification = CustomerContent;
        }
        field(15; Helix; Decimal)
        {
            Caption = 'Helix';
            DataClassification = CustomerContent;
        }
        field(16; "Helix Start"; Decimal)
        {
            Caption = 'Helix Start [in cm]';
            DataClassification = CustomerContent;
        }
        field(17; "Helix End"; Decimal)
        {
            Caption = 'Helix End [in cm]';
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