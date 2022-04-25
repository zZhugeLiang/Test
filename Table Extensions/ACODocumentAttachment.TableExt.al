tableextension 50016 "ACO Document Attachment" extends "Document Attachment"
{
    fields
    {
        field(50000; "ACO Source Type"; Enum "ACO Doc. Attach. Source Type")
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if ("ACO Source Type" <> xRec."ACO Source Type") and (xRec."ACO Source Type" <> xRec."ACO Source Type"::" ") then
                    "ACO Source No." := '';
            end;
        }
        field(50001; "ACO Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = CustomerContent;
            TableRelation = if ("ACO Source Type" = const(Customer)) Customer."No."
            else
            if ("ACO Source Type" = const(Vendor)) Vendor."No.";
        }

        field(50002; "ACO Destination Type"; Enum "ACO Doc. Attach. Dest. Type")
        {
            Caption = 'Destination Type';
            DataClassification = CustomerContent;
        }
    }
}
