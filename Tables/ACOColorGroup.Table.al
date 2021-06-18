table 50006 "ACO Color Group"
{
    Caption = 'Color Group';
    DrillDownPageId = "ACO Color Groups";
    LookupPageId = "ACO Color Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        // TODO issue 13
        field(11; "Exclude from Check"; Boolean)
        {
            Caption = 'Exclude from Check';
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