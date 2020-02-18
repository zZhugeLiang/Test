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

        field(4; "Area Surface Rack"; Decimal)
        {
            Caption = 'Area Surface Rack';
            NotBlank = true;
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
            begin
                Rec."Creation Week" := Date2DWY(DT2Date("Creation Date"), 2);
                Rec."Creation Year" := Date2DWY(DT2Date("Creation Date"), 3);
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

        field(10; "Report Day Part"; Code[2])
        {
            Caption = 'Report Day Part';
            DataClassification = CustomerContent;
        }

        field(11; "Report Week"; Integer)
        {
            Caption = 'Report Week';
            BlankZero = true;
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }

        field(12; "Report Year"; Integer)
        {
            Caption = 'Report Year';
            BlankZero = true;
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }

        field(13; "Production Date"; DateTime)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec."Production Week" := Date2DWY(DT2Date("Production Date"), 2);
                Rec."Production Year" := Date2DWY(DT2Date("Production Date"), 3);
            end;
        }

        field(14; "Production Week"; Integer)
        {
            Caption = 'Production Week';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 53;
            DataClassification = CustomerContent;
        }

        field(15; "Production Year"; Integer)
        {
            Caption = 'Production Year';
            Editable = false;
            BlankZero = true;
            MinValue = 0;
            MaxValue = 9999;
            DataClassification = CustomerContent;
        }

        field(16; "Complete"; Boolean)
        {
            Caption = 'Complete';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Testfield("Surface Attachrack");
                TestField("Attach Method");
                Testfield("Measure Mu-01");
            end;
        }

        field(17; "Bath Sheet Comment"; Text[250])
        {
            Caption = 'Bath Sheet Comment';
            DataClassification = CustomerContent;
        }

        field(18; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            FieldClass = FlowField;
            CalcFormula = Sum ("ACO Bath Sheet Line".Quantity where("Bath Sheet No." = field("No.")));
        }

        field(19; "Measure Y-value"; Decimal)
        {
            Caption = 'Measure Y-value';
            DataClassification = CustomerContent;
        }

        field(20; "Measure Mu-01"; Decimal)
        {
            Caption = 'Measure Mu-01';
            DataClassification = CustomerContent;
        }

        field(21; "Measure Mu-02"; Decimal)
        {
            Caption = 'Measure Mu-02';
            DataClassification = CustomerContent;
        }

        field(22; "Measure Mu-03"; Decimal)
        {
            Caption = 'Measure Mu-03';
            DataClassification = CustomerContent;
        }

        field(23; "Measure Mu-04"; Decimal)
        {
            Caption = 'Measure Mu-04';
            DataClassification = CustomerContent;
        }

        field(24; "Measure Mu-05"; Decimal)
        {
            Caption = 'Measure Mu-05';
            DataClassification = CustomerContent;
        }

        field(25; "Measure Mu-06"; Decimal)
        {
            Caption = 'Measure Mu-06';
            DataClassification = CustomerContent;
        }

        field(26; "Measure"; Boolean)
        {
            Caption = 'Measure';
            DataClassification = CustomerContent;
        }

        field(27; "More Than One Thick"; Boolean)
        {
            Caption = 'More Than One Thick';
            DataClassification = CustomerContent;
        }

        field(28; "Thick"; Decimal) // Integer of Decimal?
        {
            Caption = 'Thick';
            DataClassification = CustomerContent;
        }

        field(29; "More Than One Thin"; Boolean)
        {
            Caption = 'More Than One Thin';
            DataClassification = CustomerContent;
        }

        field(30; "Thin"; Decimal) // Integer of Decimal?
        {
            Caption = 'Thin';
            DataClassification = CustomerContent;
        }

        field(31; "Euras"; Boolean)
        {
            Caption = 'Euras';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(32; "Total Surface Profiles"; Decimal)
        {
            Caption = 'Total Surface Profiles';
            DataClassification = CustomerContent;
        }

        field(33; "Surface Attachrack"; Decimal)
        {
            Caption = 'Surface Attachrack';
            DataClassification = CustomerContent;
        }

        field(34; "Surface Addition"; Decimal)
        {
            Caption = 'Surface Addition';
            DataClassification = CustomerContent;
        }

        field(35; "Total Surface"; Decimal)
        {
            Caption = 'Total Surface';
            DataClassification = CustomerContent;
        }

        field(36; "Layer Thickness"; Decimal)
        {
            Caption = 'Layer Thickness';
            DataClassification = CustomerContent;
        }

        field(37; "Extra to Enumerate"; Decimal)
        {
            Caption = 'Extra to Enumerate';
            DataClassification = CustomerContent;
        }

        field(38; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density';
            FieldClass = FlowField;
            CalcFormula = max ("ACO Bath Sheet Line"."Minimum Current Density" where("Bath Sheet No." = field("No.")));
        }

        field(39; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density';
            FieldClass = FlowField;
            CalcFormula = min ("ACO Bath Sheet Line"."Maximum Current Density" where("Bath Sheet No." = field("No.")));
        }

        field(40; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

        field(41; "GSX 1 Str."; Decimal)
        {
            Caption = 'GSX 1 Str.';
            DataClassification = CustomerContent;
        }

        field(42; "GSX 2 Str."; Decimal)
        {
            Caption = 'GSX 2 Str.';
            DataClassification = CustomerContent;
        }

        field(43; "GSX 3 Str."; Decimal)
        {
            Caption = 'GSX 3 Str.';
            DataClassification = CustomerContent;
        }

        field(44; "GSX 4 Str."; Decimal)
        {
            Caption = 'GSX 4 Str.';
            DataClassification = CustomerContent;
        }

        field(45; "GSX 1 Dhd."; Decimal)
        {
            Caption = 'GSX 1 Dhd.';
            DataClassification = CustomerContent;
        }

        field(46; "GSX 2 Dhd."; Decimal)
        {
            Caption = 'GSX 2 Dhd.';
            DataClassification = CustomerContent;
        }

        field(47; "GSX 3 Dhd."; Decimal)
        {
            Caption = 'GSX 3 Dhd.';
            DataClassification = CustomerContent;
        }

        field(48; "GSX 4 Dhd."; Decimal)
        {
            Caption = 'GSX 4 Dhd.';
            DataClassification = CustomerContent;
        }

        field(49; "GSX 1 Time"; Time)
        {
            Caption = 'GSX 1 Time';
            DataClassification = CustomerContent;
        }

        field(50; "GSX 2 Time"; Time)
        {
            Caption = 'GSX 2 Time';
            DataClassification = CustomerContent;
        }

        field(51; "GSX 3 Time"; Time)
        {
            Caption = 'GSX 3 Time';
            DataClassification = CustomerContent;
        }

        field(52; "GSX 4 Time"; Time)
        {
            Caption = 'GSX 4 Time';
            DataClassification = CustomerContent;
        }

        field(53; "GSX 1 Time New"; Decimal)
        {
            Caption = 'GSX 1 Time New'; // DEPRECATED, Remove after new environment
            DataClassification = CustomerContent;
        }
        field(54; "GSX 2 Time New"; Decimal)
        {
            Caption = 'GSX 2 Time New'; // DEPRECATED, Remove after new environment
            DataClassification = CustomerContent;
        }
        field(55; "GSX 3 Time New"; Decimal)
        {
            Caption = 'GSX 3 Time New'; // DEPRECATED, Remove after new environment
            DataClassification = CustomerContent;
        }
        field(56; "GSX 4 Time New"; Decimal)
        {
            Caption = 'GSX 4 Time New'; // DEPRECATED, Remove after new environment
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
}