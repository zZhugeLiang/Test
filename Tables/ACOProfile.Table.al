table 50008 "ACO Profile"
{
    Caption = 'Profile';
    DrillDownPageId = "ACO Profiles";
    LookupPageId = "ACO Profiles";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "Category"; Code[50])
        {
            Caption = 'Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(4; "Circumference"; Decimal)
        {
            Caption = 'Circumference [mm]';
            NotBlank = true;
            DataClassification = CustomerContent;
        }

        field(5; "Weight per meter"; Decimal)
        {
            Caption = 'Weight per meter [kg]';
            DecimalPlaces = 3;
            DataClassification = CustomerContent;
        }

        // field(6; "Not Measurable"; Boolean)
        // {
        //     Caption = 'Not Measurable';
        //     DataClassification = CustomerContent;
        // }

        // field(7; "Charges per Bath Profile"; Decimal)
        // {
        //     Caption = 'Charges per Bath Profile';
        //     DataClassification = CustomerContent;
        // }

        // field(9; "Extra Flushing"; Boolean)
        // {
        //     Caption = 'Extra Flushing';
        //     DataClassification = CustomerContent;
        // }

        field(10; "Correction Factor"; Decimal)
        {
            Caption = 'Correction Factor';
            DataClassification = CustomerContent;
        }

        field(11; "Height Level"; Integer)
        {
            Caption = 'Height Level [mm]';
            DataClassification = CustomerContent;
        }

        field(12; "Comment Bath Card"; Text[100])
        {
            Caption = 'Comment Bath Card';
            DataClassification = CustomerContent;
        }

        field(13; "Comment Work Note"; Text[100])
        {
            Caption = 'Comment Work Note';
            DataClassification = CustomerContent;
        }

        field(20; "Picture Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(21; "Picture File"; Blob)
        {
            Caption = 'Picture';
            Subtype = Bitmap;
            DataClassification = CustomerContent;
        }

        field(22; "Clamping Method Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(23; "Clamping Method File"; Blob)
        {
            Caption = 'Clamping Method File';
            DataClassification = CustomerContent;
        }

        field(24; "Packaging Instr. Filename"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(25; "Packaging Instructions File"; Blob)
        {
            Caption = 'Packaging Instructions';
            DataClassification = CustomerContent;
        }

        field(27; "Holders"; Code[20])
        {
            Caption = 'Holders';
            DataClassification = CustomerContent;
        }

        field(28; "Attach Method Code"; Code[10])
        {
            Caption = 'Attach Method Code';
            TableRelation = "ACO Attach Method";
            DataClassification = CustomerContent;
        }

        field(32; "Blocked State Inactive"; Boolean)
        {
            Caption = 'Blocked State Inactive';
            DataClassification = CustomerContent;
        }

        field(34; "Type of Clamp Code"; Code[10])
        {
            Caption = 'Type of Clamp Code';
            TableRelation = "ACO Type of Clamp";
            DataClassification = CustomerContent;
        }

        field(35; "Area"; Decimal)
        {
            Caption = 'Area';
            DataClassification = CustomerContent;
        }

        field(36; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(37; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    begin
        "Last DateTime Modified" := CurrentDateTime();
    end;

    trigger OnRename();
    var
        SalesLine: Record "Sales Line";
        ACOProfileCustomer: Record "ACO Profile Customer";
    begin
        "Last DateTime Modified" := CurrentDateTime();
        if (Rec."Code" <> xRec."Code") and (Rec."Code" <> '') and (xRec."Code" <> '') then begin
            SalesLine.SetRange("ACO Profile Code", xRec."Code");
            SalesLine.ModifyAll("ACO Profile Code", Rec."Code");

            ACOProfileCustomer.SetRange("Profile Code", xRec.Code);
            if ACOProfileCustomer.FindSet(true, true) then
                repeat
                    ACOProfileCustomer.Rename(Rec.Code, ACOProfileCustomer."Customer No.", ACOProfileCustomer."Customer Item No.");
                until ACOProfileCustomer.Next() = 0;
        end;
    end;

    trigger OnModify();
    var
        SalesLine: Record "Sales Line";
    begin
        "Last DateTime Modified" := CurrentDateTime();
        if (Rec."Description" <> xRec.Description) and (Rec.Description <> '') and (xRec.Description <> '') then begin
            SalesLine.SetRange("ACO Profile Description", xRec.Description);
            SalesLine.ModifyAll("ACO Profile Description", Rec.Description);
        end;
    end;

    procedure DownloadPicture()

    var
        InStr: InStream;
    begin
        Rec.CalcFields("Picture File");
        if Rec."Picture Filename" = '' then
            exit;
        Rec."Picture File".CreateInStream(InStr);
        DownloadBLOBFromStream(Instr, Rec."Picture Filename");
    end;

    procedure DownloadClampingMethod()
    var
        InStr: InStream;
    begin
        Rec.CalcFields("Clamping Method File");
        if Rec."Clamping Method Filename" = '' then
            exit;
        Rec."Clamping Method File".CreateInStream(InStr);
        DownloadBLOBFromStream(Instr, Rec."Clamping Method Filename");
    end;

    procedure DownloadPackagingInstructions()
    var
        InStr: InStream;
    begin
        Rec.CalcFields("Packaging Instructions File");
        if Rec."Packaging Instr. Filename" = '' then
            exit;
        Rec."Packaging Instructions File".CreateInStream(InStr);
        DownloadBLOBFromStream(Instr, Rec."Packaging Instr. Filename");
    end;

    local procedure DownloadBLOBFromStream(Instr: InStream; var FileName: Text[250])
    var
        TextBuffer: Text;
    begin
        TextBuffer := FileName;
        DownloadFromStream(InStr, '', '', '', FileName);
        FileName := TextBuffer.Substring(1);
    end;
}