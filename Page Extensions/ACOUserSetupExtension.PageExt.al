pageextension 50004 "ACO User Setup Extension" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("ACO Production Line"; "ACO Production Line")
            {
                ApplicationArea = All;
            }

            field("ACO Adjust ablauf for Aucos"; "ACO Adjust ablauf for Aucos")
            {
                ApplicationArea = All;
            }
        }
    }
}