tableextension 50002 "ACO Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50002; "ACO Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50003; "ACO Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50004; "ACO Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50005; "ACO Week Capacity"; Decimal)
        {
            Caption = 'Week Capacity [m2] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50006; "ACO Quantity Charges"; Decimal)
        {
            Caption = 'Quantity Charges';
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."ACO Quantity Charges" where("Document Type" = field("Document Type"), "Document No." = field("No.")));
        }
        field(50007; "ACO Supplier"; Text[100])
        {
            Caption = 'Supplier';
            DataClassification = CustomerContent;
        }
        field(50010; "ACO Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = CustomerContent;
        }
        field(50011; "ACO Delivery Week"; Integer)
        {
            Caption = 'Delivery Week';
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }
        field(50012; "ACO Delivery Year"; Integer)
        {
            Caption = 'Delivery Year';
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }
        field(50013; "ACO Logged In DateTime"; DateTime)
        {
            Caption = 'Logged In DateTime';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50014; "ACO Logged In Week"; Integer)
        {
            Caption = 'Logged In Week';
            MinValue = 0;
            MaxValue = 53;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50015; "ACO Logged In Year"; Integer)
        {
            Caption = 'Logged In Year';
            MinValue = 0;
            MaxValue = 9999;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50016; "ACO Document Date Week"; Integer)
        {
            Caption = 'Document Date Week';
            MinValue = 0;
            MaxValue = 53;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50017; "ACO Document Date Year"; Integer)
        {
            Caption = 'Document Date Year';
            MinValue = 0;
            MaxValue = 9999;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50018; "ACO Customer Comment"; Text[100])
        {
            Caption = 'Customer Comment';
            DataClassification = CustomerContent;
        }
        field(50019; "ACO Large Line"; Boolean)
        {
            Caption = 'Large Line';
            DataClassification = CustomerContent;
        }
        field(50020; "ACO Logged In"; Boolean)
        {
            Caption = 'Logged In';
            DataClassification = CustomerContent;
        }
        field(50021; "ACO Logged In Day"; Integer)
        {
            Caption = 'Logged In Day';
            DataClassification = CustomerContent;
        }
        field(50022; "ACO Delivery Day"; Integer)
        {
            Caption = 'Delivery Day';
            DataClassification = CustomerContent;
        }
        field(50023; "ACO Document Date Day"; Integer)
        {
            Caption = 'Document Date Day';
            DataClassification = CustomerContent;
        }
        field(50024; "ACO Own Shipping Agent"; Boolean)
        {
            Caption = 'Own Shipping Agent';
            DataClassification = CustomerContent;
        }
        field(50025; "ACO Order Complete"; Boolean)
        {
            Caption = 'Order Complete';
            DataClassification = CustomerContent;
        }
        field(50026; "ACO Customer Pick-up Date"; Date)
        {
            Caption = 'Customer Pick-up Date';
            DataClassification = CustomerContent;
        }
    }
}
