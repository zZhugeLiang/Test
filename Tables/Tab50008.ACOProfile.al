table 50008 "ACO Profile"
{
    Caption = 'Profile';
    DrillDownPageId = "ACO Profiles";
    LookupPageId = "ACO Profiles";
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

        field(3; "Category"; Code[50])
        {
            Caption = 'Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(4; "Circumference"; Decimal)
        {
            Caption = 'Circumference [mm]';
            DataClassification = CustomerContent;
        }

        field(5; "Weight per meter"; Decimal)
        {
            Caption = 'Weight per meter [kg]';
            DataClassification = CustomerContent;
        }

        field(6; "Not Measurable"; Boolean)
        {
            Caption = 'Not Measurable';
            DataClassification = CustomerContent;
        }

        field(7; Hollow; Boolean)
        {
            Caption = 'Hollow';
            DataClassification = CustomerContent;
        }

        field(8; "Area"; Decimal)
        {
            Caption = 'Area';
            DataClassification = CustomerContent;
        }

        field(9; "Extra Flushing"; Boolean)
        {
            Caption = 'Extra Flushing';
            DataClassification = CustomerContent;
        }

        field(10; "Correction Factor"; Decimal)
        {
            Caption = 'Correction Factor';
            DataClassification = CustomerContent;
        }

        field(11; "Height Level"; Integer)
        {
            Caption = 'Height Level [mm]';
            DataClassification = CustomerContent;
        }

        field(12; "Comment Bath Card"; Text[100])
        {
            Caption = 'Comment Bath Card';
            DataClassification = CustomerContent;
        }

        field(13; "Comment Work Note"; Text[100])
        {
            Caption = 'Comment Work Note';
            DataClassification = CustomerContent;
        }

        field(15; Bent; Boolean)
        {
            Caption = 'Bent';
            DataClassification = CustomerContent;
        }

        field(16; "Minimum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(17; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        // field(18; Documents; Blob)
        // {
        //     Caption = 'Documents';
        //     DataClassification = CustomerContent;
        // }

    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}