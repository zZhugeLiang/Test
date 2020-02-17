table 50015 "ACO Operating Type"
{
    Caption = 'Operating Type';
    DrillDownPageId = "ACO Operating Types";
    LookupPageId = "ACO Operating Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Anodize,"Add color","Thick stain","Thin stain";
            OptionCaption = 'Anodize,Add color,Thick stain,Thin stain';
            DataClassification = CustomerContent;
        }
        field(4; "Color Project"; Code[20])
        {
            Caption = 'Color Project';
            TableRelation = "ACO Project Color Header";
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}