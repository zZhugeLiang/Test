tableextension 50008 "ACO Item Variant" extends "Item Variant"
{
    fields
    {
        field(50000; "ACO Number of Meters"; Decimal)
        {
            Caption = 'Number of Meters';
            DecimalPlaces = 4;
            DataClassification = CustomerContent;
        }
    }
}
