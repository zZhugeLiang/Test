table 50016 "ACO Bath Sheet Header"
{
    Caption = 'Bath Sheet Header';
    DrillDownPageId = "ACO Bath Sheets";
    LookupPageId = "ACO Bath Sheets";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Production Line"; Option)
        {
            Caption = 'Production Line';
            OptionMembers = " ",Short,Long;
            OptionCaption = ' ,Short,Long';
            DataClassification = CustomerContent;
        }

        field(3; "Note Bath Sheet"; Text[100])
        {
            Caption = 'Note Bath Sheet';
            DataClassification = CustomerContent;
        }


        field(5; "Attach Method"; Code[10])
        {
            Caption = 'Attach Method';
            TableRelation = "ACO Attach Method";
            DataClassification = CustomerContent;
        }

        field(6; "Circumference"; Decimal)
        {
            Caption = 'Circumference';
            DataClassification = CustomerContent;
        }

        field(7; "Creation Date"; DateTime)
        {
            Caption = 'Creation Date';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ReportTime: Time;
            begin
                Rec."Creation Week" := Date2DWY(DT2Date("Creation Date"), 2);
                Rec."Creation Year" := Date2DWY(DT2Date("Creation Date"), 3);

                "Report Date" := "Creation Date" - (3600000 * 6);
                ReportTime := DT2Time("Report Date");
                if (ReportTime >= 000000T) and (ReportTime < 080000T) then
                    Rec."Report Day Part" := '01';
                if (ReportTime >= 080000T) and (ReportTime < 160000T) then
                    Rec."Report Day Part" := '02';
                if (ReportTime >= 160000T) and (ReportTime <= 235959T) then
                    Rec."Report Day Part" := '03';

                Rec."Report Day" := Date2DWY(DT2Date("Report Date"), 1);
                Rec."Report Week" := Date2DWY(DT2Date("Report Date"), 2);
                Rec."Report Year" := Date2DWY(DT2Date("Report Date"), 3);
            end;
        }

        field(8; "Creation Week"; Integer)
        {
            Caption = 'Creation Week';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }

        field(9; "Creation Year"; Integer)
        {
            Caption = 'Creation Year';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }
        field(10; "Report Date"; DateTime)
        {
            Caption = 'Report Date';
            DataClassification = CustomerContent;
        }

        field(11; "Report Day"; Integer)
        {
            Caption = 'Report Day';
            DataClassification = CustomerContent;
        }

        field(12; "Report Day Part"; Code[2])
        {
            Caption = 'Report Day Part';
            DataClassification = CustomerContent;
        }

        field(13; "Report Week"; Integer)
        {
            Caption = 'Report Week';
            BlankZero = true;
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }

        field(14; "Report Year"; Integer)
        {
            Caption = 'Report Year';
            BlankZero = true;
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }

        field(15; "Production Date"; DateTime)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec."Production Week" := Date2DWY(DT2Date("Production Date"), 2);
                Rec."Production Year" := Date2DWY(DT2Date("Production Date"), 3);
            end;
        }

        field(16; "Production Week"; Integer)
        {
            Caption = 'Production Week';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }

        field(17; "Production Year"; Integer)
        {
            Caption = 'Production Year';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }

        field(18; "Complete"; Boolean)
        {
            Caption = 'Complete';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOAppSetup: Record "ACO App Setup";
                ACOMeasureMu: Record "ACO Measure Mu";
            begin
                Testfield("Surface Attachrack");
                TestField("Attach Method");

                ACOAppSetup.Get();

                if Measure then begin
                    if ACOAppSetup."Bath Sheet Measure Mu No." <> '' then begin
                        ACOMeasureMu.Get("No.", ACOAppSetup."Bath Sheet Measure Mu No.");
                        ACOMeasureMu.TestField(Value);
                    end;
                    Testfield("Measure Y-value");
                end;
            end;
        }

        field(19; "Bath Sheet Comment"; Text[250])
        {
            Caption = 'Bath Sheet Comment';
            DataClassification = CustomerContent;
        }

        field(20; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("ACO Bath Sheet Line".Quantity where("Bath Sheet No." = field("No.")));
        }

        field(21; "Measure Y-value"; Decimal)
        {
            Caption = 'Measure Y-value';
            DataClassification = CustomerContent;
        }

        field(28; "Measure"; Boolean)
        {
            Caption = 'Measure';
            DataClassification = CustomerContent;
        }

        field(29; "More Than One Thick"; Boolean)
        {
            Caption = 'More Than One Thick';
            DataClassification = CustomerContent;
        }

        field(30; "Thick"; Decimal) // Integer of Decimal?
        {
            Caption = 'Thick';
            DataClassification = CustomerContent;
        }

        field(31; "More Than One Thin"; Boolean)
        {
            Caption = 'More Than One Thin';
            DataClassification = CustomerContent;
        }

        field(32; "Thin"; Decimal) // Integer of Decimal?
        {
            Caption = 'Thin';
            DataClassification = CustomerContent;
        }

        field(33; "Euras"; Boolean)
        {
            Caption = 'Euras';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(34; "Total Surface Profiles"; Decimal)
        {
            Caption = 'Total Surface Profiles';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CalculateTotalSurface();
            end;
        }

        field(35; "Surface Attachrack"; Decimal)
        {
            Caption = 'Surface Attachrack';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOAppSetup: Record "ACO App Setup";
                SurfaceAttachrackMaximumErr: Label 'Surface Attachrack can not be larger than Maximum Surface Attachrack.';
            begin
                ACOAppSetup.Get();
                if ACOAppSetup."Maximum Surface Attachrack" <> 0 then
                    if "Surface Attachrack" > ACOAppSetup."Maximum Surface Attachrack" then
                        Error(SurfaceAttachrackMaximumErr);

                CalculateTotalSurface();
            end;
        }

        field(36; "Surface Addition"; Decimal)
        {
            Caption = 'Surface Addition';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(37; "Total Surface"; Decimal)
        {
            Caption = 'Total Surface';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(38; "Layer Thickness"; Decimal)
        {
            Caption = 'Layer Thickness';
            DataClassification = CustomerContent;
        }

        field(39; "Extra to Enumerate"; Decimal)
        {
            Caption = 'Extra to Enumerate';
            DataClassification = CustomerContent;
        }

        field(40; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("ACO Bath Sheet Line"."Minimum Current Density" where("Bath Sheet No." = field("No.")));
        }

        field(41; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = min("ACO Bath Sheet Line"."Maximum Current Density" where("Bath Sheet No." = field("No.")));
        }

        field(42; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

        field(43; "GSX 1 Str."; Decimal)
        {
            Caption = 'GSX 1 Str.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(44; "GSX 2 Str."; Decimal)
        {
            Caption = 'GSX 2 Str.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(45; "GSX 3 Str."; Decimal)
        {
            Caption = 'GSX 3 Str.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(46; "GSX LL Str."; Decimal)
        {
            Caption = 'GSX LL Str.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(47; "GSX 1 Dhd."; Decimal)
        {
            Caption = 'GSX 1 Dhd.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(48; "GSX 2 Dhd."; Decimal)
        {
            Caption = 'GSX 2 Dhd.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(49; "GSX 3 Dhd."; Decimal)
        {
            Caption = 'GSX 3 Dhd.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50; "GSX LL Dhd."; Decimal)
        {
            Caption = 'GSX LL Dhd.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(51; "GSX 1 Time"; Decimal)
        {
            Caption = 'GSX 1 Time';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(52; "GSX 2 Time"; Decimal)
        {
            Caption = 'GSX 2 Time';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(53; "GSX 3 Time"; Decimal)
        {
            Caption = 'GSX 3 Time';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(54; "GSX LL Time"; Decimal)
        {
            Caption = 'GSX LL Time';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(55; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = New,"In Production",Finished;
            OptionCaption = 'New,"In Production",Finished';
            DataClassification = CustomerContent;
        }

        field(56; "Color Measurement"; Boolean)
        {
            Caption = 'Color Measurement';
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
        UserSetup: Record "User Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        Validate("Creation Date", CurrentDateTime());
        Validate("Production Date", "Creation Date");

        ACOAppSetup.Get();
        ACOAppSetup.TestField("Default Bath Card Nos.");

        UserSetup.Get(UserId());

        "Production Line" := UserSetup."ACO Production Line";

        NoSeriesManagement.InitSeries(ACOAppSetup."Default Bath Card Nos.", xRec."No. Series", DT2Date(Rec."Production Date"), "No.", Rec."No. Series");
    end;

    trigger OnDelete();
    var
        BathSheetLine: Record "ACO Bath Sheet Line";
    begin
        BathSheetLine.SetRange("Bath Sheet No.", Rec."No.");
        BathSheetLine.DeleteAll();
    end;

    local procedure CalculateTotalSurface()
    begin
        "Total Surface" := Round("Total Surface Profiles" + "Surface Attachrack" + "Surface Addition", 1);
    end;

    procedure UpdateBathSheetHeader()
    var
        Item: Record Item;
        ACOAppSetup: Record "ACO App Setup";
        ACOLayerThickness: Record "ACO Layer Thickness";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        BathSheetComment: Text;
        TotalSurfaceProfiles: Decimal;
        SurfaceAddition: Decimal;
        CombinationLT: Decimal;
        LargestCombinationLT: Decimal;
        SmallestCombinationLT: Decimal;
        ExtraToEnumerate: Decimal;
        First: Boolean;
        LayerThicknessToleranceExceededErr: Label 'Layer Thickness difference is larger than the tolerated difference.';
    begin
        "Total Surface Profiles" := 0;
        First := true;
        ACOAppSetup.Get();
        ACOAppSetup.TestField("Layer Thickness Tolerance");

        ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
        if ACOBathSheetLine.FindSet() then
            repeat
                ExtraToEnumerate := 0;
                TotalSurfaceProfiles += ACOBathSheetLine.Surface;

                if ACOProfile.Get(ACOBathSheetLine."Profile Code") and (StrLen(BathSheetComment) < MaxStrLen("Bath Sheet Comment")) then begin
                    BathSheetComment += ACOProfile."Comment Bath Card";
                    SurfaceAddition += (ACOProfile."Correction Factor" - 1) * ACOBathSheetLine.Surface;

                    ACOProfileCustomer.SetRange("Profile Code", ACOProfile.Code);
                    ACOProfileCustomer.SetRange("Customer No.", ACOBathSheetLine."Customer No.");
                    if ACOProfileCustomer.FindFirst() then
                        ExtraToEnumerate := ACOProfileCustomer."Extra to Enumerate";
                end;

                if Item.Get(ACOBathSheetLine.Treatment) then
                    if ACOLayerThickness.Get(Item."ACO Layer Thickness Code") then begin
                        CombinationLT := ACOLayerThickness."mu Value" + ExtraToEnumerate;

                        if First then begin
                            LargestCombinationLT := CombinationLT;
                            SmallestCombinationLT := CombinationLT;
                            First := false;
                        end;

                        if CombinationLT > LargestCombinationLT then
                            LargestCombinationLT := CombinationLT;

                        if CombinationLT < SmallestCombinationLT then
                            SmallestCombinationLT := CombinationLT;
                    end;
            until ACOBathSheetLine.Next() = 0;

        if (LargestCombinationLT - SmallestCombinationLT > ACOAppSetup."Layer Thickness Tolerance") then
            Error(LayerThicknessToleranceExceededErr);

        "Layer Thickness" := LargestCombinationLT;
        "Total Surface Profiles" := Round(TotalSurfaceProfiles, 1);
        "Bath Sheet Comment" := CopyStr(BathSheetComment, 1, MaxStrLen("Bath Sheet Comment"));
        "Surface Addition" := SurfaceAddition;

        CalculateTotalSurface();
        Modify();
    end;

    procedure CalculateProcessTimes()
    var
        ACOAppSetup: Record "ACO App Setup";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        MaxCurrDens: Decimal;
        MinCurrDens: Decimal;
        Str: Decimal;
        Dhd: Decimal;
        BathTime: Decimal;
        TotalSurface: Decimal;
        LayerThickness: Decimal;
        MinAnodiseTime: Decimal;
        First: Boolean;
        MinCannotBeLargerThanMaxDensityErr: Label 'Minimum Current Density cannot be larger than Maximum Current Density.';
        NoBathsCalculatedErr: Label 'None of the baths could be calculated.';
    begin
        ACOAppSetup.Get();
        ACOAppSetup.TestField("Max. Current Density Bath 1");
        ACOAppSetup.TestField("Max. Current Density Bath 2");
        ACOAppSetup.TestField("Max. Current Density Bath 3");
        ACOAppSetup.TestField("Max. Current Density Bath L");
        ACOAppSetup.TestField("Min. Anodise Time");

        First := true;
        ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
        if ACOBathSheetLine.FindSet() then
            repeat
                if First then begin
                    MaxCurrDens := ACOBathSheetLine."Maximum Current Density";
                    MinCurrDens := ACOBathSheetLine."Minimum Current Density";
                    First := false;
                end;

                if MaxCurrDens <= ACOBathSheetLine."Maximum Current Density" then
                    MaxCurrDens := ACOBathSheetLine."Maximum Current Density";
                if MinCurrDens >= ACOBathSheetLine."Minimum Current Density" then
                    MinCurrDens := ACOBathSheetLine."Minimum Current Density";
            until ACOBathSheetLine.Next() = 0;

        if MinCurrDens > MaxCurrDens then
            Error(MinCannotBeLargerThanMaxDensityErr);

        Str := ACOAppSetup."Max. Current Density Bath 1";

        TestField("Total Surface");

        TotalSurface := "Total Surface";
        LayerThickness := "Layer Thickness";
        MinAnodiseTime := ACOAppSetup."Min. Anodise Time";

        Str := ACOAppSetup."Max. Current Density Bath L";
        CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime,
                                    MinCurrDens, MaxCurrDens, ACOAppSetup."Max. Current Density Bath L");

        "GSX LL Dhd." := Dhd;
        "GSX LL Str." := Str;
        "GSX LL Time" := BathTime;

        if "Production Line" = "Production Line"::Long then begin
            if ("GSX LL Dhd." + "GSX LL Str." + "GSX LL Time") = 0 then
                Error(NoBathsCalculatedErr);
        end else begin
            Str := ACOAppSetup."Max. Current Density Bath 1";
            CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime,
                                        MinCurrDens, MaxCurrDens, ACOAppSetup."Max. Current Density Bath 1");

            // if ACOAppSetup."Max. Current Density Bath 1" >= Str then begin
            "GSX 1 Dhd." := Dhd;
            "GSX 1 Str." := Str;
            "GSX 1 Time" := BathTime;
            // end;

            Str := ACOAppSetup."Max. Current Density Bath 2";
            CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime,
                                        MinCurrDens, MaxCurrDens, ACOAppSetup."Max. Current Density Bath 2");

            "GSX 2 Dhd." := Dhd;
            "GSX 2 Str." := Str;
            "GSX 2 Time" := BathTime;

            Str := ACOAppSetup."Max. Current Density Bath 3";
            CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime,
                                        MinCurrDens, MaxCurrDens, ACOAppSetup."Max. Current Density Bath 3");

            "GSX 3 Dhd." := Dhd;
            "GSX 3 Str." := Str;
            "GSX 3 Time" := BathTime;

            if ("GSX LL Dhd." + "GSX LL Str." + "GSX LL Time" + "GSX 1 Dhd." + "GSX 1 Str." + "GSX 1 Time"
                + "GSX 2 Dhd." + "GSX 2 Str." + "GSX 2 Time" + "GSX 3 Dhd." + "GSX 3 Str." + "GSX 3 Time") = 0 then
                Error(NoBathsCalculatedErr);
        end;

        Modify();
    end;

    local procedure CalculateProcessTimeBath(var CurrDens: Decimal; var Str: Decimal; var BathTime: Decimal; TotalSurface: Decimal; LayerThickness: Decimal;
                                                MinAnodiseTime: Decimal; MinCurrDens: Decimal; MaxCurrDens: Decimal; MaxCurrentDensityBath: Decimal)
    begin
        // Calculate Density
        if TotalSurface = 0 then
            exit;

        // CurrDens := Str / (TotalSurface * 100);
        CurrDens := Str / TotalSurface;

        if CurrDens < MinCurrDens then
            CurrDens := MinCurrDens;

        if CurrDens > MaxCurrDens then
            CurrDens := MaxCurrDens;

        if CurrDens = 0 then
            exit;

        BathTime := (3 * LayerThickness / CurrDens);

        if BathTime < MinAnodiseTime then begin
            CurrDens := 3 * LayerThickness / MinAnodiseTime;
            if CurrDens < MinCurrDens then
                CurrDens := MinCurrDens;

            if CurrDens > MaxCurrDens then
                CurrDens := MaxCurrDens;

            BathTime := (3 * LayerThickness / CurrDens);
        end;

        // Str := CurrDens * TotalSurface * 100;
        Str := CurrDens * TotalSurface;

        Str := Round(Str, 1);
        CurrDens := Round(CurrDens, 0.01);
        BathTime := Round(BathTime, 1);

        // if Str > MaxCurrentDensityBath then begin
        //     CurrDens := 0;
        //     BathTime := 0;
        //     Str := 0;
        // end;
    end;
}