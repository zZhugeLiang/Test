table 50043 "ACO Pricing"
{
    Caption = 'Pricing';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
            DataClassification = CustomerContent;
        }
        field(2; "Pretreatment Code"; Code[10])
        {
            Caption = 'Pretreatment Code';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;
        }
        field(3; "Layer Thickness Code"; Code[10])
        {
            Caption = 'Layer Thickness Code';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }
        field(4; "Color Code"; Code[20])
        {
            Caption = 'Color Code';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }
        field(5; "Posttreatment Code"; Code[20])
        {
            Caption = 'Posttreatment Code';
            TableRelation = "ACO Posttreatment";
            DataClassification = CustomerContent;
        }
        field(6; "Particularity Code"; Code[20])
        {
            Caption = 'Particularity Code';
            TableRelation = "ACO Particularity";
            DataClassification = CustomerContent;
        }
        field(7; "Category Code"; Code[50])
        {
            Caption = 'Category Code';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }
        field(8; "Unit of Measure"; Code[20])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(9; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(11; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(12; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Customer Price Group", "Pretreatment Code", "Layer Thickness Code", "Color Code", "Posttreatment Code", "Particularity Code", "Category Code", "Unit of Measure", "Starting Date")
        {
            Clustered = true;
        }
    }
}
