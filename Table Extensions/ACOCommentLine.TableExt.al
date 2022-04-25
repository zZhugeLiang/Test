tableextension 50017 "ACO Comment Line" extends "Comment Line"
{
    fields
    {
        field(50000; "ACO Source Document Type"; Enum "ACO Com. Line Source Doc. Type")
        {
            Caption = 'Source Document Type';
            DataClassification = CustomerContent;
        }
    }
}
