tableextension 50005 "ACO Production Order Line Ext." extends "Prod. Order Line"
{
    fields
    {
        field(50000; "ACO Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Quantity Charges"; Decimal)
        {
            Caption = 'Quantity Charges';
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Profile m2 per Qty."; Decimal)
        {
            Caption = 'Profile m2 per Qty.';
            Editable = false;
            DataClassification = CustomerContent;
            /// ToDo FlowField: Niet wijzigbaar. Flowfield Lookup (Profiel productie orderregel)
        }

        field(50004; "ACO Total m2"; Decimal)
        {
            Caption = 'Total m2';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionMembers = Item,Family,"Sales Header";
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50006; "ACO Source No."; Code[20])
        {
            Caption = 'Source No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50007; "ACO Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50008; "ACO Bath Sheet Qty."; Decimal)
        {
            Caption = 'Bath Sheet Qty.';
            FieldClass = FlowField;
            CalcFormula = Lookup ("ACO Bath Sheet Line".Quantity where("Production Order No." = field("Prod. Order No."), "Production Order Line No." = field("Line No.")));
        }

        field(50009; "ACO Include Bath Sheet"; Boolean)
        {
            Caption = 'Include Bath Sheet';
            DataClassification = CustomerContent;
        }

        field(50010; "ACO Charge No."; Code[10])
        {
            Caption = 'Charge No.';
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Quantity to Bath Sheet"; Decimal)
        {
            Caption = 'Quantity to Bath Sheet';
            DataClassification = CustomerContent;
        }

        field(50012; "ACO Complete"; Boolean)
        {
            Caption = 'Complete';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50013; "ACO Included"; Boolean)
        {
            Caption = 'Included';
            DataClassification = CustomerContent;
        }
    }
}