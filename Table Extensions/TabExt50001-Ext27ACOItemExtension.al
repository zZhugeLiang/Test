tableextension 50001 "VZK Item Extension" extends Item
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

        field(50002; "ACO Color"; Code[10])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
            TableRelation = "ACO Color";
        }

        field(50003; "ACO Category"; Code[50])
        {
            Caption = 'Category';
            DataClassification = CustomerContent;
            TableRelation = "ACO Category";
        }
    }
}