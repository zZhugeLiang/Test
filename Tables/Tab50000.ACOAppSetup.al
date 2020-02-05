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

        field(5; "Pretreatment Dimension Code"; Code[20])
        {
            Caption = 'Pretreatment Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }

        field(6; "Color Dimension Code"; Code[20])
        {
            Caption = 'Color Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }

        field(7; "Layer Thickness Dimension Code"; Code[20])
        {
            Caption = 'Layer Thickness Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }

        field(8; "Length Unit of Measure Code"; Code[10])
        {
            Caption = 'Length Unit of Measure Code';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }

        field(9; "Area Unit of Measure Code"; Code[10])
        {
            Caption = 'Area Unit of Measure Code';
            TableRelation = "Unit of Measure";
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