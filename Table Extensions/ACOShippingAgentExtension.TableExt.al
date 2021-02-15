tableextension 50009 "ACO Shipping Agent Extension" extends "Shipping Agent"
{
    fields
    {
        field(50000; "ACO Own"; Boolean)
        {
            Caption = 'Own';
            DataClassification = CustomerContent;
        }
    }
}
