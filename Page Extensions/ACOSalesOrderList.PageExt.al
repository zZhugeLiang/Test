pageextension 50017 "ACO Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("Document Date")
        {
            field("Promised Delivery Date"; "Promised Delivery Date")
            {
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", true);
    end;
}