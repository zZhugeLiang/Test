table 50032 "ACO Build-up Layer"
{
    Caption = 'Build-up Layer';
    DrillDownPageId = "ACO Build-up Layers";
    LookupPageId = "ACO Build-up Layers";
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
