pageextension 50024 "ACO Comment Sheet" extends "Comment Sheet"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Source Document Type"; Rec."ACO Source Document Type")
            {
                ApplicationArea = All;
            }
        }
    }
}