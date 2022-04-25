pageextension 50023 "ACO Doc. Attachment Details" extends "Document Attachment Details"
{
    layout
    {
        addlast(Group)
        {
            field("ACO Source Type"; Rec."ACO Source Type")
            {
                ApplicationArea = All;
            }
            field("ACO Source No."; Rec."ACO Source No.")
            {
                ApplicationArea = All;
            }
            field("ACO Destination Type"; Rec."ACO Destination Type")
            {
                ApplicationArea = All;
            }
        }
    }
}