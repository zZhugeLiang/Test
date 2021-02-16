table 50014 "ACO Attach Method"
{
    Caption = 'Attach Method';
    DrillDownPageId = "ACO Attach Methods";
    LookupPageId = "ACO Attach Methods";
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
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}