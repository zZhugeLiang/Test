table 50018 "ACO Project Color Header"
{
    Caption = 'Project Color';
    DrillDownPageId = "ACO Project Colors";
    LookupPageId = "ACO Project Colors";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }

        field(3; "Number of Measurements"; Integer)
        {
            Caption = 'Number of Measurements';
            DataClassification = CustomerContent;
        }

        field(4; "Target Time"; Decimal)// In het FO staat Integer, maar andere tijden zijn als Decimals.
        {
            Caption = 'Target Time';
            DecimalPlaces = 0;
            DataClassification = CustomerContent;
        }

        field(5; "Note"; Text[100])
        {
            Caption = 'Note';
            DataClassification = CustomerContent;
        }

        field(6; "Note Operator"; Text[100])
        {
            Caption = 'Note Operator';
            DataClassification = CustomerContent;
        }

        field(7; "Conductivity Factor"; Decimal)
        {
            Caption = 'Conductivity Factor';
            DataClassification = CustomerContent;
        }

        field(8; "Inactive"; Boolean)
        {
            Caption = 'Inactive';
            DataClassification = CustomerContent;
        }

        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    var
        ACOAppSetup: Record "ACO App Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin

        ACOAppSetup.Get();
        ACOAppSetup.TestField("Default Project Color Nos.");

        NoSeriesManagement.InitSeries(ACOAppSetup."Default Project Color Nos.", xRec."No. Series", Today(), "No.", Rec."No. Series");
    end;
}