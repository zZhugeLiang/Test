table 50034 "ACO Linked Distance Holder"
{
    Caption = 'Linked Distance Holder';
    DrillDownPageId = "ACO Linked Distance Holders";
    LookupPageId = "ACO Linked Distance Holders";
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

        field(3; "Item No."; Code[30])
        {
            Caption = 'Item No.';
            TableRelation = "Item";
            DataClassification = CustomerContent;
        }

        field(4; "Length"; Decimal)
        {
            Caption = 'Length';
            DataClassification = CustomerContent;
        }

        field(5; "Distance Holder Code"; Code[30])
        {
            Caption = 'Distance Holder Code';
            TableRelation = "ACO Distance Holder".Code;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACODistanceHolder: Record "ACO Distance Holder";
            begin
                if ACODistanceHolder.Get("Distance Holder Code") then begin
                    Description := ACODistanceHolder.Description;
                    Distance := ACODistanceHolder.Distance;
                end;
            end;
        }

        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(7; Distance; Decimal)
        {
            Caption = 'Distance';
            DataClassification = CustomerContent;
        }

        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }
        field(9; Position; Decimal)
        {
            Caption = 'Position';
            DataClassification = CustomerContent;
        }
        field(10; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Holder Code", "Customer No.", "Item No.", Length, "Distance Holder Code", "Line No.")
        {
            Clustered = true;
        }
    }
}