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
            field("ACO Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Variant Code"; "Variant Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Number of Units"; "ACO Number of Units")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO British Standard"; "ACO British Standard")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Layer Thickness"; "ACO Layer Thickness")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Color"; "ACO Color")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Profile Circumference"; "ACO Profile Circumference")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Customer Item No."; "ACO Customer Item No.")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Profile Cust. Description"; "ACO Profile Cust. Description")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Attach Method Code Profile"; "ACO Attach Method Code Profile")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Type of Clamp Code"; "ACO Type of Clamp Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Area"; "ACO Area")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Linked Holder"; "ACO Linked Holder")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Receipt Bag"; "ACO Receipt Bag")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Shipping Bag"; "ACO Shipping Bag")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Kundentour HUECK"; "ACO Kundentour HUECK")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Project Color Code"; "ACO Project Color Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Number of Units to Invoice"; "ACO Number of Units to Invoice")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Reject Billable Shipped"; "ACO Reject Billable Shipped")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Rej. Not Billable Shipped"; "ACO Rej. Not Billable Shipped")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
        }
    }
}