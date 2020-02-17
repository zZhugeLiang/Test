tableextension 50006 "ACO User Setup Extension" extends "User Setup"
{
    fields
    {
        field(50000; "ACO Production Line"; Option)
        {
            Caption = 'Production Line';
            OptionMembers = " ","Short Line","Long Line";
            OptionCaption = ' ,Short Line,Long Line';
            DataClassification = CustomerContent;
        }
    }
}