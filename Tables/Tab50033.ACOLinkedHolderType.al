table 50033 "ACO Linked Holder Type"
{
    Caption = 'Linked Holder Type';
    DrillDownPageId = "ACO Linked Holder Types";
    LookupPageId = "ACO Linked Holder Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Holder Code"; Code[30])
        {
            Caption = 'Holder Code';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }

        field(3; "Profile Code"; Code[10])
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

        field(5; "Holder Type Code"; Code[30])
        {
            Caption = 'Holder Type Code';
            TableRelation = "ACO Holder Type".Code;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOHolderType: Record "ACO Holder Type";
            begin
                if ACOHolderType.Get("Holder Type Code") then begin
                    Description := ACOHolderType.Description;
                    Quantity := ACOHolderType.Quantity;
                    Position := ACOHolderType.Position;
                end;
            end;
        }

        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }

        field(8; Position; Integer)
        {
            Caption = 'Position';
            DataClassification = CustomerContent;
        }

        field(9; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Holder Code", "Customer No.", "Profile Code", Length, "Holder Type Code")
        {
            Clustered = true;
        }
    }
}