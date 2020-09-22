tableextension 50005 "ACO Production Order Line Ext." extends "Prod. Order Line"
{
    fields
    {
        field(50000; "ACO Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Quantity Charges" := "ACO Number of Units" / "ACO Charges per Bath Profile";
            end;
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
            ObsoleteState = Removed;
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
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum ("ACO Bath Sheet Line".Quantity where("Production Order No." = field("Prod. Order No."), "Production Order Line No." = field("Line No.")));
        }

        field(50009; "ACO Included"; Boolean)
        {
            Caption = 'Include Bath Sheet'; // DEPRECATED, field not used anymore
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

            trigger OnValidate()
            begin
                "ACO Total m2" := "ACO Quantity to Bath Sheet" * "ACO Profile m2 per Qty.";
            end;
        }

        field(50012; "ACO Complete"; Boolean)
        {
            Caption = 'Complete';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50013; "ACO Number of Units"; Decimal)
        {
            Caption = 'Number of Units';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Quantity Charges" := "ACO Number of Units" / "ACO Charges per Bath Profile";
            end;
        }

        field(50014; "ACO Production Line"; Option)
        {
            Caption = 'Production Line';
            OptionMembers = " ",Short,Long;
            OptionCaption = ' ,Short,Long';
            DataClassification = CustomerContent;
        }

        field(50015; "ACO Source Type Enum"; Enum "Prod. Order Source Type")
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;
        }

        field(50016; "ACO Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }
}
