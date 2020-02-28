table 50001 "ACO Price Scheme"
{
    Caption = 'Price Scheme';
    DrillDownPageId = "ACO Price Schemes";
    LookupPageId = "ACO Price Schemes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "British Standard"; Boolean)
        {
            Caption = 'DEPRECATED'; // Moved field to Price Scheme Price
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