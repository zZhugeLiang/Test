tableextension 50011 "ACO Sales Invoice Line Ext." extends "Sales Invoice Line"
{
    fields
    {
        field(50000; "ACO Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }

        field(50009; "ACO British Standard"; Boolean)
        {
            Caption = 'British Standard';
            DataClassification = CustomerContent;
        }

        field(50010; "ACO Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }

        field(50016; "ACO Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            DataClassification = CustomerContent;
        }

        field(50017; "ACO Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(50019; "ACO Profile Circumference"; Decimal)
        {
            Caption = 'Circumference [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50034; "ACO Number of Units"; Decimal)
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;
        }

        field(50036; "ACO Attach Method Code Profile"; Code[10])
        {
            Caption = 'Attach Method Profile';
            DataClassification = CustomerContent;
        }

        field(50040; "ACO Sawing"; Boolean)
        {
            Caption = 'Sawing';
            DataClassification = CustomerContent;
        }

        field(50044; "ACO Receipt Bag"; Text[250])
        {
            Caption = 'Receipt Bag';
            DataClassification = CustomerContent;
        }

        field(50045; "ACO Shipping Bag"; Text[250])
        {
            Caption = 'Shipping Bag';
            DataClassification = CustomerContent;
        }

        field(50047; "ACO Area"; Decimal)
        {
            Caption = 'Area';
            DataClassification = CustomerContent;
        }

        field(50048; "ACO Linked Holder"; Code[30])
        {
            Caption = 'Linked Holder';
            DataClassification = CustomerContent;
        }

        field(50049; "ACO Receipt Shelf"; Text[20])
        {
            Caption = 'Receipt Shelf';
            DataClassification = CustomerContent;
        }

        field(50050; "ACO Shipping Shelf"; Text[20])
        {
            Caption = 'Shipping Shelf';
            DataClassification = CustomerContent;
        }

        field(50053; "ACO Kundentour HUECK"; Text[100])
        {
            Caption = 'Kundentour HUECK';
            DataClassification = CustomerContent;
        }

        field(50055; "ACO Project Color Code"; Code[20])
        {
            Caption = 'Project Color Code';
            DataClassification = CustomerContent;
        }

        field(50058; "ACO Type of Clamp Code"; Code[10])
        {
            Caption = 'Type of Clamp Code Profile';
            DataClassification = CustomerContent;
        }

        field(50063; "ACO Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
            DataClassification = CustomerContent;
        }

        field(50065; "ACO Profile Cust. Description"; Text[100])
        {
            Caption = 'Profile Customer Description';
            DataClassification = CustomerContent;
        }

        field(50069; "ACO Reject Billable Shipped"; Integer)
        {
            Caption = 'Reject Billable Shipped';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50070; "ACO Rej. Not Billable Shipped"; Integer)
        {
            Caption = 'Reject Not Billable Shipped';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50072; "ACO Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;
        }
        field(50073; "ACO Posttreatment"; Code[20])
        {
            Caption = 'Posttreatment';
            TableRelation = "ACO Posttreatment";
            DataClassification = CustomerContent;
        }
        field(50074; "ACO Particularity"; Code[20])
        {
            Caption = 'Particularity';
            TableRelation = "ACO Particularity";
            DataClassification = CustomerContent;
        }
        field(50075; "ACO Profile Length"; Decimal)
        {
            Caption = 'Length [mm] Profile';
            DataClassification = CustomerContent;
        }
        field(50076; "ACO Customer Item Reference"; Text[50])
        {
            Caption = 'Customer Item Reference';
            DataClassification = CustomerContent;
        }
    }
}