tableextension 50005 "ACO Production Order Line Ext." extends "Prod. Order Line"
{
    fields
    {
        field(50000; "ACO Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Quantity Charges"; Decimal)
        {
            Caption = 'Quantity Charges';
            DataClassification = CustomerContent;
        }
    }
}
