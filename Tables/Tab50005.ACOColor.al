table 50005 "ACO Color"
{
    Caption = 'Color';
    DrillDownPageId = "ACO Colors";
    LookupPageId = "ACO Colors";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(4; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(5; "Dimension Code"; Code[20]) // Ask EWI if default dimension code
        {
            Caption = 'Dimension';
            TableRelation = "VAT Product Posting Group";
            DataClassification = CustomerContent;
        }

        field(6; "Color Group Code"; Code[20])
        {
            Caption = 'Dimension';
            TableRelation = "VAT Product Posting Group";
            DataClassification = CustomerContent;
        }

        field(7; "Coloring Time"; Decimal)
        {
            Caption = 'Coloring Time [min]';
            DataClassification = CustomerContent;
        }

        field(8; "Minimum Gold Time"; Decimal)
        {
            Caption = 'Minimum Gold Time [min]';
            DataClassification = CustomerContent;
        }

        field(9; "Maximum Gold Time"; Decimal)
        {
            Caption = 'Maximum Gold Time [min]';
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