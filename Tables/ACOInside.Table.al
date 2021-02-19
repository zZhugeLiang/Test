table 50029 "ACO Inside"
{
    Caption = 'Inside';
    DrillDownPageId = "ACO Insides";
    LookupPageId = "ACO Insides";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Rack; Boolean)
        {
            Caption = 'Rack';
            DataClassification = CustomerContent;
        }
        field(4; Package; Boolean)
        {
            Caption = 'Package';
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
