pageextension 50019 "ACO Reason Codes Ext." extends "Reason Codes"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Billable"; "ACO Billable")
            {
                ApplicationArea = All;
            }
        }
    }
}
