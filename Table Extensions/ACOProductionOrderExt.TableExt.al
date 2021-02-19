tableextension 50004 "ACO Production Order Ext." extends "Production Order"
{
    fields
    {
        field(50001; "ACO Quantity Charges New"; Decimal)
        {
            Caption = 'Quantity Charges';
            FieldClass = FlowField;
            CalcFormula = Sum("Prod. Order Line"."ACO Quantity Charges" where("Status" = field("Status"), "Prod. Order No." = field("No.")));
        }
    }
}
