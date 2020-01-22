tableextension 50004 "ACO Production Order Ext." extends "Production Order"
{
    fields
    {
        field(50000; "ACO Quantity Charges"; Decimal)
        {
            Caption = 'Quantity Charges';
            DataClassification = CustomerContent;
        }
    }
}
