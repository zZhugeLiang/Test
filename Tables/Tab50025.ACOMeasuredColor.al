table 50025 "ACO Measured Color"
{
    Caption = 'Measured Color';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Location"; Option)
        {
            Caption = 'Location';
            OptionMembers = " ",Color,Seal,"Tin Bath",Anodize,"Gold Bath";
            OptionCaption = ' ,Color,Seal,Tin Bath,Anodize,Gold Bath';
            DataClassification = CustomerContent;
        }
        field(3; "Batch No."; Text[50])
        {
            Caption = 'Batch No.';
            DataClassification = CustomerContent;
        }
        field(4; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            DataClassification = CustomerContent;
        }
        field(5; SCIL; Decimal)
        {
            Caption = 'SCIL';
            DataClassification = CustomerContent;
        }
        field(6; SCIA; Decimal)
        {
            Caption = 'SCIA';
            DataClassification = CustomerContent;
        }
        field(7; SCIB; Decimal)
        {
            Caption = 'SCIB';
            DataClassification = CustomerContent;
        }
        field(8; SCEL; Decimal)
        {
            Caption = 'SCEL';
            DataClassification = CustomerContent;
        }
        field(9; SCEA; Decimal)
        {
            Caption = 'SCEA';
            DataClassification = CustomerContent;
        }
        field(10; SCEB; Decimal)
        {
            Caption = 'SCEB';
            DataClassification = CustomerContent;
        }
        field(11; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = CustomerContent;
        }
        field(12; Accord; Boolean)
        {
            Caption = 'Accord';
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
