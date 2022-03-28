table 50040 "ACO Posttreatment"
{
    Caption = 'Posttreatment';
    DrillDownPageId = "ACO Posttreatments";
    LookupPageId = "ACO Posttreatments";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; Description; Text[50])
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