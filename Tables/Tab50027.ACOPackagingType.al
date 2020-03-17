table 50027 "ACO Packaging Type"
{
    Caption = 'Packaging Type';
    DrillDownPageId = "ACO Packaging Types";
    LookupPageId = "ACO Packaging types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Rack,Pack;
            OptionCaption = ' ,Rack,Pack';
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
