tableextension 50014 "ACO Reason Code Ext." extends "Reason Code"
{
    fields
    {
        field(50000; "ACO Billable"; Boolean)
        {
            Caption = 'Billable';
            DataClassification = CustomerContent;
        }
    }
}
