pageextension 50005 "ACO Machine Center Card Ext." extends "Machine Center Card"
{
    layout
    {
        addlast("Routing Setup")
        {
            field("ACO Operation Type"; "ACO Operation Type")
            {
                ApplicationArea = All;
            }
        }
    }
}