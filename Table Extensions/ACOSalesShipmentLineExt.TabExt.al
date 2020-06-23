tableextension 50010 "ACO Sales Shipment Line Ext." extends "Sales Shipment Line"
{
    fields
    {
        field(50042; "ACO Qty. After Production"; Decimal)
        {
            Caption = 'Qty. After Production';
            DataClassification = CustomerContent;
        }
    }
}