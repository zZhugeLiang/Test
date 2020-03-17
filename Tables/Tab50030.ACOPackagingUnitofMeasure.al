table 50030 "ACO Packaging Unit of Measure"
{
    Caption = 'Packaging Unit of Measure';
    DrillDownPageId = "ACO Packaging Units of Measure";
    LookupPageId = "ACO Packaging Units of Measure";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
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
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
