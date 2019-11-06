table 50000 "ACO App Setup"
{
    Caption = 'App Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Default Package Label Nos."; Code[20])
        {
            Caption = 'Default Package Label Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(3; "Default Bath Card Nos."; Code[20])
        {
            Caption = 'Default Bath Card Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(4; "Minimum Remaining Sawing"; Decimal)
        {
            Caption = 'Minimum Remaining Sawing';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}