tableextension 50003 "VZK Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "ACO Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;
        }
        field(50001; "ACO Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Category"; Code[50])
        {
            Caption = 'Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }
    }
}