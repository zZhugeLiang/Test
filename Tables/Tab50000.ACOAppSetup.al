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

        field(16; "Min. Residue Saw"; Decimal)
        {
            Caption = 'Min. Residue Saw [mm]';
            DataClassification = CustomerContent;
        }

        field(17; "No. Series Packages"; Code[20])     // DEPRICATED
        {
            Caption = 'No. Series Packages'; // DEPRECATED
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
            ObsoleteReason = 'Multiple fields for the same goal.';
            ObsoleteState = Pending;
        }
        field(18; "Aucos Max. No. of Lines"; Integer)
        {
            Caption = 'Aucos Max. No. of Lines';
            DataClassification = CustomerContent;
        }
        field(19; "File Directory Aucos File"; Text[250])
        {
            Caption = 'File Directory Aucos File'; // DEPRECATED, not possible in cloud BC
            DataClassification = CustomerContent;
        }
        field(20; "Archive File Dir. Aucos File"; Text[250])
        {
            Caption = 'Archive File Dir. Aucos File'; // DEPRECATED, not possible in cloud BC
            DataClassification = CustomerContent;
        }
        field(21; "Aucos Staining Time"; Integer)
        {
            Caption = 'Aucos Staining Time';
            DataClassification = CustomerContent;
        }
        field(22; "Aucos Seal Time"; Integer)
        {
            Caption = 'Aucos Seal Time';
            DataClassification = CustomerContent;
        }
        field(23; "Aucos Sealconstant"; Integer)
        {
            Caption = 'Aucos Sealconstant';
            DataClassification = CustomerContent;
        }
        field(24; "Multiple Staining Times Text"; Text[100])
        {
            Caption = 'Multiple Staining Times Text';
            DataClassification = CustomerContent;
        }
        field(25; "Layer Thickness Tolerance"; Decimal)
        {
            Caption = 'Layer Thickness Tolerance';
            DataClassification = CustomerContent;
        }

        field(26; "Bath Sheet Measure Mu No."; Code[10])
        {
            Caption = 'Bath Sheet Measure Mu No. to Check';
            DataClassification = CustomerContent;
        }

        field(27; "Default Measured Color Nos."; Code[20])
        {
            Caption = 'Default Project Color Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(28; "Rack Packaging Code"; Code[20])
        {
            Caption = 'Rack Packaging Code';
            TableRelation = "ACO Packaging".Code;
            DataClassification = CustomerContent;
        }

        field(29; "Package Packaging Code"; Code[20])
        {
            Caption = 'Package Packaging Code';
            TableRelation = "ACO Packaging".Code;
            DataClassification = CustomerContent;
        }
        // field(25; "Maximum Bath Length"; Decimal)
        // {
        //     Caption = 'Maximum Bath Length';
        //     DataClassification = CustomerContent;
        // }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}