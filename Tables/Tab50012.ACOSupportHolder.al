table 50012 "ACO Support Holder"
{
    Caption = 'Support Holder';
    DrillDownPageId = "ACO Support Holders";
    LookupPageId = "ACO Support Holders";
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
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}