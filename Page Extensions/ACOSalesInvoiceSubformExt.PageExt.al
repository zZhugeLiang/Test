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
            field("ACO Variant Code"; Rec."Variant Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Number of Units"; Rec."ACO Number of Units")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO British Standard"; Rec."ACO British Standard")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Layer Thickness"; Rec."ACO Layer Thickness")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Color"; Rec."ACO Color")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Pretreatment"; Rec."ACO Pretreatment")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("ACO Posttreatment"; Rec."ACO Posttreatment")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Particularity"; Rec."ACO Particularity")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("ACO Customer Item Reference"; Rec."ACO Customer Item Reference")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("ACO Profile Length"; Rec."ACO Profile Length")
            {
                ApplicationArea = ALl;
                ToolTip = ' ';
            }
            // field("ACO Profile Code"; Rec."ACO Profile Code")
            // {
            //     ApplicationArea = All;
            //     Tooltip = ' ';
            // }
            // field("ACO Profile Description"; Rec."ACO Profile Description")
            // {
            //     ApplicationArea = All;
            //     Tooltip = ' ';
            // }
            field("ACO Profile Circumference"; Rec."ACO Profile Circumference")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Customer Item No."; Rec."ACO Customer Item No.")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            // field("ACO Profile Cust. Description"; Rec."ACO Profile Cust. Description")
            // {
            //     ApplicationArea = All;
            //     Tooltip = ' ';
            // }
            field("ACO Attach Method Code Profile"; Rec."ACO Attach Method Code Profile")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Type of Clamp Code"; Rec."ACO Type of Clamp Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Area"; Rec."ACO Area")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Linked Holder"; Rec."ACO Linked Holder")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Receipt Bag"; Rec."ACO Receipt Bag")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Shipping Bag"; Rec."ACO Shipping Bag")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Kundentour HUECK"; Rec."ACO Kundentour HUECK")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Project Color Code"; Rec."ACO Project Color Code")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Number of Units to Invoice"; Rec."ACO Number of Units to Invoice")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Reject Billable Shipped"; Rec."ACO Reject Billable Shipped")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
            field("ACO Rej. Not Billable Shipped"; Rec."ACO Rej. Not Billable Shipped")
            {
                ApplicationArea = All;
                Tooltip = ' ';
            }
        }
    }
}