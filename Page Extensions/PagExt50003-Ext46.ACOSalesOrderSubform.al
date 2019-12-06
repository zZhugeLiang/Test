pageextension 50003 "ACO Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("British Standard"; "ACO British Standard")
            {
                ApplicationArea = All;
            }
            field("ACO Pretreatment"; "ACO Pretreatment")// zelf toegevoegd, staat niet in FO
            {
                ApplicationArea = All;
            }
            field("ACO Layer Thickness"; "ACO Layer Thickness")
            {
                ApplicationArea = All;
            }
            field("ACO Color"; "ACO Color")
            {
                ApplicationArea = All;
            }
            field("ACO Category"; "ACO Category")// zelf toegevoegd, staat niet in FO
            {
                ApplicationArea = All;
            }
        }
    }
}