table 50011 "ACO Distance Holder"
{
    Caption = 'Holder';
    DrillDownPageId = "ACO Distance Holders";
    LookupPageId = "ACO Distance Holders";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; Distance; Decimal)
        {
            Caption = 'Distance';
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