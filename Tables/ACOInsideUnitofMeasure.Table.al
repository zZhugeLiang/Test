table 50031 "ACO Inside Unit of Measure"
{
    Caption = 'Inside Unit of Measure';
    DrillDownPageId = "ACO Inside Units of Measure";
    LookupPageId = "ACO Inside Units of Measure";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
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
