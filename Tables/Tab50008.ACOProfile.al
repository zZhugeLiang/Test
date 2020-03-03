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

        field(7; "Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;
        }

        // field(7; Hollow; Boolean)
        // {
        //     Caption = 'Hollow'; // DEPRECATED?
        //     DataClassification = CustomerContent;
        // }

        // field(8; "Area"; Decimal)
        // {
        //     Caption = 'Area'; // DEPRECATED?
        //     DataClassification = CustomerContent;
        // }

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

        field(14; "Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            DataClassification = CustomerContent;
        }

        // field(15; Bent; Boolean)
        // {
        //     Caption = 'Bent'; // DEPRECATED?
        //     DataClassification = CustomerContent;
        // }

        field(16; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(17; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(18; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(19; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(20; "Picture Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(21; "Picture File"; Blob)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }

        field(22; "Clamping Method Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(23; "Clamping Method File"; Blob)
        {
            Caption = 'Clamping Method File';
            DataClassification = CustomerContent;
        }

        field(24; "Packaging Instr. Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(25; "Packaging Instructions File"; Blob)
        {
            Caption = 'Packaging Instructions';
            DataClassification = CustomerContent;
        }

        field(26; "Euras"; Boolean)
        {
            Caption = 'Euras';
            DataClassification = CustomerContent;
        }

        field(27; "Holders"; Code[20])
        {
            Caption = 'Holders';
            DataClassification = CustomerContent;
        }
        field(28; "Attach Method Code"; Code[10])
        {
            Caption = 'Attach Method Code';
            TableRelation = "ACO Attach Method";
            DataClassification = CustomerContent;
        }
        field(29; "Type of Clamp"; Text[100])
        {
            Caption = 'Type of Clamp';
            DataClassification = CustomerContent;
        }

        field(30; Helix; Decimal)
        {
            Caption = 'Helix';
            DataClassification = CustomerContent;
        }

        field(31; Space; Decimal)
        {
            Caption = 'Space';
            DataClassification = CustomerContent;
        }

        field(32; "Blocked State Inactive"; Boolean)
        {
            Caption = 'Blocked State Inactive';
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