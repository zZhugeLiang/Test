table 50024 "ACO Package Line"
{
    Caption = 'Package Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Package No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ACO Package Header";
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Sales Order No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Sales Line No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Bathsheet No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Production Order No."; Code[20])
        {
            Caption = 'Production Order No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Production Order Status"; Option)
        {
            Caption = 'Production Order Status';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Production Order Line No."; Integer)
        {
            Caption = 'Production Order Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; "Bathsheet line No."; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(10; "Profile no."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Profile description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Length"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(13; "Treatment"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(14; "Treatment Description"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item.Description where("No." = field(Treatment)));
        }
        field(15; "Your Reference"; Text[35])
        {
            DataClassification = CustomerContent;
        }
        field(16; "External Document No."; Text[35])
        {
            DataClassification = CustomerContent;
        }
        field(17; "Quantity"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(18; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(19; "Reject Reason Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
        }
        field(20; "Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(5402; "Variant Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50000; "Color"; Code[20])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
        }
        field(50009; "Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50019; "Profile Circumference"; Decimal)
        {
            Caption = 'Circumference [mm] Profile';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50034; "Number of Units"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50063; "Customer Item No."; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50065; "Profile Cust. Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50072; "Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50073; "Posttreatment"; Code[20])
        {
            Caption = 'Posttreatment';
            TableRelation = "ACO Posttreatment";
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50074; "Particularity"; Code[20])
        {
            Caption = 'Particularity';
            TableRelation = "ACO Particularity";
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50075; "Profile Length"; Decimal)
        {
            Caption = 'Length [mm] Profile';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50076; "Customer Item Reference"; Text[50])
        {
            Caption = 'Customer Item Reference';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50077; "Customer Item Ref. Description"; Text[100])
        {
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Item Reference".Description where("Reference No." = field("Customer Item Reference")));
        }
    }

    keys
    {
        key(PK; "Package No.", "Line No.")
        {
            Clustered = true;
        }
    }
}