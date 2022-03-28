table 50042 "ACO Routing Selection"
{
    Caption = 'Routing Selection';
    DrillDownPageId = "ACO Routing Selections";
    LookupPageId = "ACO Routing Selections";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;
        }
        field(2; "Layer Thickness Code"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }

        field(3; "Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }

        field(4; "Posttreatment"; Code[20])
        {
            Caption = 'Posttreatment';
            TableRelation = "ACO Posttreatment";
            DataClassification = CustomerContent;
        }
        field(5; "Particularity"; Code[20])
        {
            Caption = 'Particularity';
            TableRelation = "ACO Particularity";
            DataClassification = CustomerContent;
        }
        field(11; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Pretreatment, "Layer Thickness Code", Color, Posttreatment, Particularity)
        {
            Clustered = true;
        }
    }
}