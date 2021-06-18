pageextension 50025 "ACO Sales Invoice Subform Ext." extends "Sales Invoice Subform"
{
    layout
    {
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                Rec."ACO Manual Unit Price" := true;
            end;
        }

        addlast(Control1)
        {
            field("ACO Variant Code"; "Variant Code")
            {
                ApplicationArea = All;
            }
            field("ACO Number of Units"; "ACO Number of Units")
            {
                ApplicationArea = All;
            }
            field("ACO British Standard"; "ACO British Standard")
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
            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Circumference"; "ACO Profile Circumference")
            {
                ApplicationArea = All;
            }
            field("ACO Customer Item No."; "ACO Customer Item No.")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Cust. Description"; "ACO Profile Cust. Description")
            {
                ApplicationArea = All;
            }
            // field("ACO Area Profile"; "ACO Area Profile")
            // {
            //     ApplicationArea = All;
            // }
            field("ACO Attach Method Code Profile"; "ACO Attach Method Code Profile")
            {
                ApplicationArea = All;
            }
            field("ACO Type of Clamp Code"; "ACO Type of Clamp Code")
            {
                ApplicationArea = All;
            }
            field("ACO Area"; "ACO Area")
            {
                ApplicationArea = All;
            }
            field("ACO Linked Holder"; "ACO Linked Holder")
            {
                ApplicationArea = All;
            }
            field("ACO Receipt Bag"; "ACO Receipt Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Bag"; "ACO Shipping Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Kundentour HUECK"; "ACO Kundentour HUECK")
            {
                ApplicationArea = All;
            }
            field("ACO Project Color Code"; "ACO Project Color Code")
            {
                ApplicationArea = All;
            }
            field("ACO Number of Units to Invoice"; "ACO Number of Units to Invoice")
            {
                ApplicationArea = All;
            }
        }
    }
}