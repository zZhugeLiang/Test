table 50007 "ACO Category"
{
    Caption = 'Category';
    DrillDownPageId = "ACO Categories";
    LookupPageId = "ACO Categories";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "Calculate Minimum Circumf."; Boolean)
        {
            Caption = 'Calculate Minimum Circumference';
            DataClassification = CustomerContent;
        }

        field(4; "Add Short Length Charge"; Boolean)
        {
            Caption = 'Add Short Length Charge';
            DataClassification = CustomerContent;
        }

        field(5; "Add Inner Cathode Charge"; Boolean)
        {
            Caption = 'Add Inner Cathode Charge';
            DataClassification = CustomerContent;
        }

        field(6; "Add High Weight Charge"; Boolean)
        {
            Caption = 'Add High Weight Charge';
            DataClassification = CustomerContent;
        }

        field(7; "Add Height Level Charge"; Boolean)
        {
            Caption = 'Add Height Level Charge';
            DataClassification = CustomerContent;
        }

        field(8; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
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