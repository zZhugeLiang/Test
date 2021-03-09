table 50022 "ACO Measure Mu"
{
    Caption = 'Measure Mu';
    DrillDownPageId = "ACO Measure Mu List";
    LookupPageId = "ACO Measure Mu List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            DataClassification = CustomerContent;
        }

        field(2; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(3; "Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Bath Sheet No.", "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    var
        ACOAppSetup: Record "ACO App Setup";
        ACOMeasureMu: Record "ACO Measure Mu";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        ACOMeasureMu.SetRange("Bath Sheet No.", Rec."Bath Sheet No.");
        if ACOMeasureMu.FindLast() then begin
            Rec."No." := IncStr(ACOMeasureMu."No.");
        end else begin
            ACOAppSetup.Get();
            ACOAppSetup.Testfield("Bath Sheet Measure Mu No.");
            Rec."No." := ACOAppSetup."Bath Sheet Measure Mu No.";
        end;
        // NoSeriesManagement.InitSeries(ACOAppSetup."Default Measured Color Nos.", xRec."No. Series", Today(), "No.", Rec."No. Series");
    end;
}