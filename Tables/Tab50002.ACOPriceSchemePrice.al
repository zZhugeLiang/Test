table 50002 "ACO Price Scheme Price"
{
    Caption = 'Price Scheme Price';
    DrillDownPageId = "ACO Price Scheme Prices";
    LookupPageId = "ACO Price Scheme Prices";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme Code';
            DataClassification = CustomerContent;
        }

        field(2; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Length,Weight,Circumference;
            OptionCaption = 'Length,Weight,Circumference';
            DataClassification = CustomerContent;
        }
        field(3; "Minimum Quantity"; Decimal)
        {
            Caption = 'Minimum Quantity';
            DataClassification = CustomerContent;
        }

        field(4; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Price Scheme Code", Type, "Minimum Quantity")
        {
            Clustered = true;
        }
    }
}