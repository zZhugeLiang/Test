table 50025 "ACO Measured Color"
{
    Caption = 'ACO Measured Color';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Location"; Option)
        {
            Caption = 'Location';
            OptionMembers = " ",Color,Seal,"Tin Bath",Anodize,"Gold Bath";
            OptionCaption = ' ,Color,Seal,Tin Bath,Anodize,Gold Bath';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; "Batch No."; Text[50])
        {
            Caption = 'Batch No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(4; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; SCIL; Decimal)
        {
            Caption = 'SCIL';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(6; SCIA; Decimal)
        {
            Caption = 'SCIA';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; SCIB; Decimal)
        {
            Caption = 'SCIB';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; SCEL; Decimal)
        {
            Caption = 'SCEL';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; SCEA; Decimal)
        {
            Caption = 'SCEA';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(10; SCEB; Decimal)
        {
            Caption = 'SCEB';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(12; Accord; Boolean)
        {
            Caption = 'Accord';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(13; User; Code[50])
        {
            Caption = 'User';
            DataClassification = CustomerContent;
        }

        field(14; "No. Series"; Code[20])
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
        ACOAppSetup.TestField("Default Measured Color Nos.");

        NoSeriesManagement.InitSeries(ACOAppSetup."Default Measured Color Nos.", xRec."No. Series", Today(), "No.", Rec."No. Series");
    end;
}
