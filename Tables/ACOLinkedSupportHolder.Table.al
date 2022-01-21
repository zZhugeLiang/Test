table 50035 "ACO Linked Support Holder"
{
    Caption = 'Linked Support Holder';
    DrillDownPageId = "ACO Linked Support Holders";
    LookupPageId = "ACO Linked Support Holders";
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

        field(5; "Support Holder Code"; Code[30])
        {
            Caption = 'Support Holder Code';
            TableRelation = "ACO Support Holder".Code;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOSupportHolder: Record "ACO Support Holder";
            begin
                if ACOSupportHolder.Get("Support Holder Code") then
                    Description := ACOSupportHolder.Description;
            end;
        }

        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }
        field(8; Distance; Decimal)
        {
            Caption = 'Distance';
            DataClassification = CustomerContent;
        }
        // field(9; "Line No."; Integer)
        // {
        //     Caption = 'Line No.';
        //     AutoIncrement = true;
        //     DataClassification = CustomerContent;
        // }
    }

    keys
    {
        key(PK; "Holder Code", "Customer No.", "Profile Code", Length, "Support Holder Code")
        {
            Clustered = true;
        }
    }
}