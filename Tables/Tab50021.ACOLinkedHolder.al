table 50021 "ACO Linked Holder"
{
    Caption = 'Linked Holder';
    DrillDownPageId = "ACO Holders";
    LookupPageId = "ACO Holders";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
            TableRelation = "ACO Holder";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOHolder: Record "ACO Holder";
            begin
                if ACOHolder.Get("Code") then begin
                    "Length" := ACOHolder."Length";
                    "Description" := ACOHolder."Description";
                    "Color Group Code" := ACOHolder."Color Group Code";
                    "Attach Method Code" := ACOHolder."Attach Method Code";
                    "Type of Clamp Code" := ACOHolder."Type of Clamp Code";
                    Comment := ACOHolder.Comment;
                    Method := ACOHolder.Method;
                    Space := ACOHolder.Space;
                    Helix := ACOHolder.Helix;
                    "Helix Start" := ACOHolder."Helix Start";
                    "Helix End" := ACOHolder."Helix End";
                end
            end;
        }

        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }

        field(3; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile";
            DataClassification = CustomerContent;
        }

        field(4; "Length"; Decimal)
        {
            Caption = 'Length';
            DataClassification = CustomerContent;
        }

        field(5; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(6; "Color Group Code"; Code[20])
        {
            Caption = 'Color Group Code';
            TableRelation = "ACO Color Group";
            DataClassification = CustomerContent;
        }


        field(10; "Attach Method Code"; Code[10])
        {
            Caption = 'Attach Method Code';
            TableRelation = "ACO Attach Method";
            DataClassification = CustomerContent;
        }

        field(11; "Type of Clamp"; Text[100])
        {
            Caption = 'Type of Clamp'; // DEPRECATED
            ObsoleteState = Removed;
            ObsoleteReason = 'Replaced by field Type of Clamp Code';
            DataClassification = CustomerContent;
        }

        field(12; Comment; Text[50])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }

        field(13; Method; Text[50])
        {
            Caption = 'Method';
            DataClassification = CustomerContent;
        }

        field(14; Space; Decimal)
        {
            Caption = 'Space';
            DataClassification = CustomerContent;
        }

        field(15; Helix; Text[20])
        {
            Caption = 'Helix';
            DataClassification = CustomerContent;
        }

        field(16; "Helix Start"; Decimal)
        {
            Caption = 'Helix Start [in cm]';
            DataClassification = CustomerContent;
        }

        field(17; "Helix End"; Decimal)
        {
            Caption = 'Helix End [in cm]';
            DataClassification = CustomerContent;
        }

        field(18; "Type of Clamp Code"; Code[10])
        {
            Caption = 'Type of Clamp Code';
            TableRelation = "ACO Type of Clamp";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code", "Customer No.", "Profile Code", Length)
        {
            Clustered = true;
        }
    }
}