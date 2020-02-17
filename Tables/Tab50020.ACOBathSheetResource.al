table 50020 "ACO Bath Sheet Resource"
{
    Caption = 'Bath Sheet Resource';
    DrillDownPageId = "ACO Bath Sheet Resources";
    LookupPageId = "ACO Bath Sheet Resources";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            TableRelation = "ACO Bath Sheet Header";
            DataClassification = CustomerContent;
        }

        field(2; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
            DataClassification = CustomerContent;
        }
        field(3; "Resource Name"; Text[50])
        {
            Caption = 'Type';
            FieldClass = FlowField;
            CalcFormula = Lookup (Resource.Name where("No." = field("Resource No.")));
        }
    }

    keys
    {
        key(PK; "Bath Sheet No.", "Resource No.")
        {
            Clustered = true;
        }
    }
}