pageextension 50009 "ACO Sales Quote Extension" extends "Sales Quote"
{
    layout
    {
        addafter(General)
        {
            group(Production)
            {
                field("ACO Customer Comment"; "ACO Customer Comment")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}