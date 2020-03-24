table 50026 "ACO Packaging"
{
    Caption = 'Packaging';
    DrillDownPageId = "ACO Packaging List";
    LookupPageId = "ACO Packaging List";
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
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(4; Length; Integer)
        {
            Caption = 'Length Old'; // DEPRECATED, should be Decimal, created Length 2 to replace this.
            DataClassification = CustomerContent;
        }
        field(5; "Packaging Type Code"; Code[20])
        {
            Caption = 'Packaging Type Code';
            TableRelation = "ACO Packaging Type";
            DataClassification = CustomerContent;
        }
        field(6; Width; Integer)
        {
            Caption = 'Width';
            DataClassification = CustomerContent;
        }
        field(7; "Package Type Code"; Code[20])
        {
            Caption = 'Package Type Code';
            TableRelation = "ACO Package Type";
            DataClassification = CustomerContent;
        }
        field(8; "Inside Code"; Code[20])
        {
            Caption = 'Inside';
            // TableRelation = "ACO Inside";
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                ACOAppSetup: Record "ACO App Setup";
                ACOInside: Record "ACO Inside";
                ACOInsides: Page "ACO Insides";
            begin
                ACOAppSetup.Get();

                case "Code" of
                    ACOAppSetup."Rack Packaging Code":
                        ACOInside.SetRange(Rack, true);
                    ACOAppSetup."Package Packaging Code":
                        ACOInside.SetRange(Package, true);
                end;

                ACOInsides.LookupMode(true);
                ACOInsides.SetTableView(ACOInside);

                if ACOInsides.RunModal() = Action::LookupOK then begin
                    ACOInsides.SetSelectionFilter(ACOInside);
                    ACOInsides.GetRecord(ACOInside);
                    Validate("Inside Code", ACOInside."Code");
                end;
            end;

            trigger OnValidate()
            var
                ACOAppSetup: Record "ACO App Setup";
                ACOInside: Record "ACO Inside";
            begin
                ACOAppSetup.Get();

                if not ACOInside.Get("Inside Code") then
                    exit;

                case "Code" of
                    ACOAppSetup."Rack Packaging Code":
                        ACOInside.TestField(Rack, true);
                    ACOAppSetup."Package Packaging Code":
                        ACOInside.TestField(Package, true);
                end;
            end;
        }
        field(9; "Packaging Unit of Measure Code"; Code[20])
        {
            Caption = 'Packaging Unit of Measure Code';
            TableRelation = "ACO Packaging Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(10; "Inside Unit of Measure Code"; Code[20])
        {
            Caption = 'Inside Unit of Measure Code';
            TableRelation = "ACO Inside Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(11; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(12; "Build-up Layer Code"; Code[20])
        {
            Caption = 'Build-up Layer';
            TableRelation = "ACO Build-up Layer";
            DataClassification = CustomerContent;
        }
        field(13; "Quantity per Layer"; Integer)
        {
            Caption = 'Quantity per Layer';
            DataClassification = CustomerContent;
        }
        field(14; "Build-up Quantity per Layer"; Integer)
        {
            Caption = 'Build-up Quantity per Layer';
            DataClassification = CustomerContent;
        }
        field(15; "Build-up Number of Layers"; Integer)
        {
            Caption = 'Build-up Number of Layers';
            DataClassification = CustomerContent;
        }
        field(16; "Build-up Maximum Width"; Integer)
        {
            Caption = 'Build-up Maximum Width';
            DataClassification = CustomerContent;
        }
        field(17; "Build-up Maximum Height"; Integer)
        {
            Caption = 'Build-up Maximum Height';
            DataClassification = CustomerContent;
        }
        field(18; Remark; Text[100])
        {
            Caption = 'Remark';
            DataClassification = CustomerContent;
        }
        field(19; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }
        field(20; "Length 2"; Decimal)
        {
            Caption = 'Length';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Profile Code", "Customer No.", "Code", Length)
        {
            Clustered = true;
        }
    }
}
