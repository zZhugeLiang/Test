table 50022 "ACO Measure Mu"
{
    Caption = 'Measure Mu';
    DrillDownPageId = "ACO Measure Mu List";
    LookupPageId = "ACO Measure Mu List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            DataClassification = CustomerContent;
        }

        field(2; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(3; "Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Bath Sheet No.", "No.")
        {
            Clustered = true;
        }
    }
}