pageextension 50011 "ACO Shipping Agents Extension" extends "Shipping Agents"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Own"; "ACO Own")
            {
                ApplicationArea = All;
                ToolTip = 'Own';
            }
        }
    }
}