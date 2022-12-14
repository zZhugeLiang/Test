pageextension 50010 "ACO Sales Quote Subform Ext." extends "Sales Quote Subform"
{
    layout
    {
        addlast(Control1)
        {
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
            field("ACO Pretreatment"; Rec."ACO Pretreatment")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the  Pretreatment field.';
            }
            field("ACO Posttreatment"; Rec."ACO Posttreatment")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posttreatment field.';
            }
            field("ACO Particularity"; Rec."ACO Particularity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Particularity field.';
            }
            field("ACO Customer Item Reference"; Rec."ACO Customer Item Reference")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Item Reference field.';
            }
            field("ACO Profile Length"; Rec."ACO Profile Length")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Length [mm] Profile field.';
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
            field("ACO Not Measurable"; "ACO Not Measurable")
            {
                ApplicationArea = All;
            }
            field("ACO Extra Flushing"; "ACO Extra Flushing")
            {
                ApplicationArea = All;
            }
            field("ACO Area Profile"; "ACO Area Profile")
            {
                ApplicationArea = All;
            }
            field("ACO Measure Report"; "ACO Measure Report")
            {
                ApplicationArea = All;
            }
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
            field("ACO Sawing"; "ACO Sawing")
            {
                ApplicationArea = All;
            }
            field("ACO Start Length"; "ACO Start Length")
            {
                Editable = "ACO Sawing";
                ApplicationArea = All;
            }
            field("ACO Qty. After Production"; "ACO Qty. After Production")
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
            field("ACO Receipt Shelf"; "ACO Receipt Shelf")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Bag"; "ACO Shipping Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Shelf"; "ACO Shipping Shelf")
            {
                ApplicationArea = All;
            }
            field("ACO Kundentour HUECK"; "ACO Kundentour HUECK")
            {
                ApplicationArea = All;
            }
            field("ACO Packaging"; "ACO Packaging")
            {
                ApplicationArea = All;
            }
            field("ACO Project Color Code"; "ACO Project Color Code")
            {
                ApplicationArea = All;
            }
            field("ACO Head Cut"; "ACO Head Cut")
            {
                ApplicationArea = All;
            }
            field("ACO Return Remaining"; "ACO Return Remaining")
            {
                ApplicationArea = All;
            }
            field("ACO Lower Accuracy"; "ACO Lower Accuracy")
            {
                ApplicationArea = All;
            }
            field("ACO Upper Accuracy"; "ACO Upper Accuracy")
            {
                ApplicationArea = All;
            }
        }
    }
}