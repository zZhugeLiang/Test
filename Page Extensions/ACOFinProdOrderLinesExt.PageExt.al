pageextension 50027 "ACO Fin. Prod. Order Lines Ext" extends "Finished Prod. Order Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("ACO Quantity Charges"; Rec."ACO Quantity Charges")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quantity Charges field.';
            }
            field("ACO Charges per Bath Profile"; Rec."ACO Charges per Bath Profile")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Charges per Bath Profile field.';
            }
        }

        addlast(Control1)
        {
            field("ACO Source Type Enum"; Rec."ACO Source Type Enum")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Source Type field.';
            }

            field("ACO Source No."; Rec."ACO Source No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Source No. field.';
            }

            field("ACO Source Line No."; Rec."ACO Source Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Source Line No. field.';
            }

            field("ACO Profile Code"; Rec."ACO Profile Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Profile Code field.';
            }

            field("ACO Profile m2 per Qty."; Rec."ACO Profile m2 per Qty.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Profile m2 per Qty. field.';
            }

            field("ACO Total m2"; Rec."ACO Total m2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total m2 field.';
            }

            field("ACO Bath Sheet Qty."; Rec."ACO Bath Sheet Qty.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bath Sheet Qty. field.';
            }

            field("ACO Charge No."; Rec."ACO Charge No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Charge No. field.';
            }

            field("ACO Quantity to Bath Sheet"; Rec."ACO Quantity to Bath Sheet")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quantity to Bath Sheet field.';
            }

            field("ACO Complete"; Rec."ACO Complete")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Complete field.';
            }

            field("ACO Rerun"; Rec."ACO Rerun")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Rerun field.';
            }

            field("ACO Rerun Reason"; Rec."ACO Rerun Reason")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Rerun Reason field.';
            }

            field("ACO Pretreatment"; Rec."ACO Pretreatment")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the  Pretreatment field.';
            }
            field("ACO Layer Thickness"; Rec."ACO Layer Thickness")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Layer Thickness field.';
            }
            field("ACO Color"; Rec."ACO Color")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Color field.';
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
            field("ACO Profile Circumference"; Rec."ACO Profile Circumference")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Circumference [mm] Profile field.';
            }
        }
    }
}