tableextension 50007 "ACO Machine Center Extension" extends "Machine Center"
{
    fields
    {
        field(50000; "ACO Operation Type"; Code[10])
        {
            Caption = 'Operating Type';
            TableRelation = "ACO Operating Type";
            DataClassification = CustomerContent;
        }
    }
}