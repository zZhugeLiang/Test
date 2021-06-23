table 50009 "ACO Profile Customer"
{
    Caption = 'Profile Customer';
    DrillDownPageId = "ACO Profile Customers";
    LookupPageId = "ACO Profile Customers";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile";
            DataClassification = CustomerContent;
        }

        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Customer No.") then begin
                    "Customer Name" := Customer.Name;
                    Address := Customer.Address;
                    "Post Code" := Customer."Post Code";
                    City := Customer.City;
                    "Euras" := Customer."ACO Euras";
                    "Extra to Enumerate" := Customer."ACO Extra to Enumerate";
                    "Thick Staining Time" := Customer."ACO Thick Staining Time";
                    "Thin Staining Time" := Customer."ACO Thin Staining Time";
                    "Price Scheme Code" := Customer."ACO Price Scheme Code";
                end else begin
                    "Customer Name" := '';
                    Address := '';
                    "Post Code" := '';
                    City := '';
                    "Euras" := false;
                    "Extra to Enumerate" := 0;
                    "Thick Staining Time" := 0;
                    "Thin Staining Time" := 0;
                    "Price Scheme Code" := '';
                end;
            end;
        }

        field(3; "Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
            DataClassification = CustomerContent;
        }

        field(4; "Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }

        field(6; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }

        field(7; "Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme';
            TableRelation = "ACO Price Scheme";
            DataClassification = CustomerContent;
        }

        field(8; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = Field("Customer No."));
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ShipToAddr: Record "Ship-to Address";
            begin
                if ShipToAddr.Get("Customer No.", "Ship-to Code") then begin
                    Address := ShipToAddr.Address;
                    "Post Code" := ShipToAddr."Post Code";
                    City := ShipToAddr.City;
                end else begin
                    Address := '';
                    "Post Code" := '';
                    City := '';
                end;
            end;
        }
        field(9; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(10; "Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(11; "City"; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(13; "Euras"; Boolean)
        {
            Caption = 'Euras';
            DataClassification = CustomerContent;
        }

        field(14; "Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            DataClassification = CustomerContent;
        }

        field(15; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(16; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(17; "Sawing Discount"; Decimal)
        {
            Caption = 'Sawing Discount';
            DataClassification = CustomerContent;
        }

        field(18; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(19; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(20; "High End"; Boolean)
        {
            Caption = 'High End';
            DataClassification = CustomerContent;
        }

        field(21; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
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
        field(26; "Customer of Customer"; Text[50])
        {
            Caption = 'Customer of Customer';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Profile Code", "Customer No.", "Customer Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Profile Code", "Profile Description") { }
    }

    trigger OnInsert();
    begin
        TestPK();
        Rec."Last DateTime Modified" := CurrentDateTime();
    end;

    trigger OnRename();
    var
        SalesLine: Record "Sales Line";
    begin
        TestPK();
        Rec."Last DateTime Modified" := CurrentDateTime();
        if Rec."Customer Item No." <> xRec."Customer Item No." then begin
            SalesLine.SetRange("ACO Profile Code", xRec."Profile Code");
            SalesLine.SetRange("Sell-to Customer No.", xRec."Customer No.");
            SalesLine.SetRange("ACO Customer Item No.", xRec."Customer Item No.");
            SalesLine.ModifyAll("ACO Customer Item No.", Rec."Customer Item No.");
        end;
    end;

    trigger OnModify();
    begin
        Rec."Last DateTime Modified" := CurrentDateTime();
    end;

    procedure DownloadPackagingInstructions(): Boolean
    var
        InStr: InStream;
        PackagingInstructionBuffer: Text;
    begin
        Rec.CalcFields("Packaging Instructions File");
        if Rec."Packaging Instr. Filename" = '' then
            exit;
        Rec."Packaging Instructions File".CreateInStream(InStr);
        DownloadBLOBFromStream(Instr, Rec."Packaging Instr. Filename");
        exit(true);
    end;

    procedure TestPK()
    begin
        Rec.TestField("Profile Code");
        Rec.TestField("Customer No.");
        Rec.TestField("Customer Item No.");
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