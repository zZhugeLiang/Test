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
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(3; "Default Bath Card Nos."; Code[20])
        {
            Caption = 'Default Bath Sheet Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
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
            Caption = 'Circumference Unit of Measure Code';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }

        field(10; "Default Project Color Nos."; Code[20])
        {
            Caption = 'Default Project Color Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(11; "Max. Current Density Bath 1"; Decimal)
        {
            Caption = 'Max. Current Density Bath 1';
            DecimalPlaces = 0;
            DataClassification = CustomerContent;
        }

        field(12; "Max. Current Density Bath 2"; Decimal)
        {
            Caption = 'Max. Current Density Bath 2';
            DecimalPlaces = 0;
            DataClassification = CustomerContent;
        }

        field(13; "Max. Current Density Bath 3"; Decimal)
        {
            Caption = 'Max. Current Density Bath 3';
            DecimalPlaces = 0;
            DataClassification = CustomerContent;
        }

        field(14; "Max. Current Density Bath L"; Decimal)
        {
            Caption = 'Max. Current Density Bath L';
            DecimalPlaces = 0;
            DataClassification = CustomerContent;
        }

        field(15; "Min. Anodise Time"; Decimal)
        {
            Caption = 'Min. Anodise Time';
            DecimalPlaces = 0;
            InitValue = 16;
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