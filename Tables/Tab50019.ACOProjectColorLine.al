table 50019 "ACO Project Color Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project Color No."; Code[20])
        {
            Caption = 'Project Color No.';
            TableRelation = "ACO Project Color Header";
            DataClassification = CustomerContent;
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }

        field(3; "Name"; Text[100])
        {
            Caption = 'Name';
            FieldClass = FlowField;
            CalcFormula = Lookup ("ACO Project Color Header".Name where("No." = field("Project Color No.")));
        }

        field(4; "Number of Measurements"; Integer)
        {
            Caption = 'Number of Measurements';
            FieldClass = FlowField;
            CalcFormula = Lookup ("ACO Project Color Header"."Number of Measurements" where("No." = field("Project Color No.")));
        }

        field(5; "Target Time"; Decimal)
        {
            Caption = 'Target Time';
            DataClassification = CustomerContent;
        }

        field(6; "Location"; Option)
        {
            Caption = 'Location';
            OptionMembers = " ",Color,Seal;
            OptionCaption = ' ,Color,Seal';
            DataClassification = CustomerContent;
        }

        field(7; "Target Type"; Option)
        {
            Caption = 'Target Type';
            OptionMembers = L,A,B;
            OptionCaption = 'L,A,B';
            DataClassification = CustomerContent;
        }

        field(8; "Target Value"; Decimal)
        {
            Caption = 'Target Value';
            DataClassification = CustomerContent;
        }

        field(9; "Target Minimum"; Decimal)
        {
            Caption = 'Target Minimum';
            DataClassification = CustomerContent;
        }

        field(10; "Target Maximum"; Decimal)
        {
            Caption = 'Target Maximum';
            DataClassification = CustomerContent;
        }

        field(11; "Operator Visible"; Boolean)
        {
            Caption = 'Operator Visible';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Project Color No.", "Line No.")
        {
            Clustered = true;
        }
    }

}