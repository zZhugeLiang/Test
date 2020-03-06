table 50024 "ACO Package Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Package No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ACO Package Header";

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Sales Order No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Sales Line No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Bathsheet No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Production Order No."; Code[20])
        {
            Caption = 'Production Order No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(7; "Production Order Status"; Option)
        {
            Caption = 'Production Order Status';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(8; "Production Order Line No."; Integer)
        {
            Caption = 'Production Order Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(9; "Bathsheet line No."; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(10; "Profile no."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Profile description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Length"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(13; "Treatment"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(14; "Treatment Description"; Text[100])
        {
            TableRelation = Item where("No." = field("Treatment"));
            FieldClass = FlowField;
        }
        field(15; "Your Reference"; Text[35])
        {
            DataClassification = CustomerContent;
        }
        field(16; "External Document No."; Text[35])
        {
            DataClassification = CustomerContent;
        }
        field(17; "Quantity"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Package No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}