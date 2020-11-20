pageextension 50007 "ACO Rel. Prod. Order Lines Ext" extends "Released Prod. Order Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("ACO Quantity Charges"; "ACO Quantity Charges")
            {
                ApplicationArea = All;
            }
            field("ACO Charges per Bath Profile"; "ACO Charges per Bath Profile")
            {
                ApplicationArea = All;
            }
        }

        addlast(Control1)
        {
            field("ACO Source Type Enum"; "ACO Source Type Enum")
            {
                ApplicationArea = All;
            }

            field("ACO Source No."; "ACO Source No.")
            {
                ApplicationArea = All;
            }

            field("ACO Source Line No."; "ACO Source Line No.")
            {
                ApplicationArea = All;
            }

            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
            }

            field("ACO Profile m2 per Qty."; "ACO Profile m2 per Qty.")
            {
                ApplicationArea = All;
            }

            field("ACO Total m2"; "ACO Total m2")
            {
                ApplicationArea = All;
            }

            field("ACO Bath Sheet Qty."; "ACO Bath Sheet Qty.")
            {
                ApplicationArea = All;
            }

            field("ACO Charge No."; "ACO Charge No.")
            {
                ApplicationArea = All;
            }

            field("ACO Quantity to Bath Sheet"; "ACO Quantity to Bath Sheet")
            {
                ApplicationArea = All;
            }

            field("ACO Complete"; "ACO Complete")
            {
                ApplicationArea = All;
            }

            field("ACO Rerun"; "ACO Rerun")
            {
                ApplicationArea = All;
            }

            field("ACO Rerun Reason"; "ACO Rerun Reason")
            {
                ApplicationArea = All;
            }
        }
    }
}