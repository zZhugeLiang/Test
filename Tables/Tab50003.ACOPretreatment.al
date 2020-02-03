table 50003 "ACO Pretreatment"
{
    Caption = 'Pretreatment';
    DrillDownPageId = "ACO Pretreatments";
    LookupPageId = "ACO Pretreatments";

    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(4; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(5; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = CustomerContent;
        }

        field(6; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = CustomerContent;
        }

        field(7; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }

        field(8; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(9; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(10; "Do Not Calculate Short Length"; Boolean)
        {
            Caption = 'Do Not Calculate Short Length';
            DataClassification = CustomerContent;
        }

        field(11; "Aucos"; Boolean)
        {
            Caption = 'Aucos';
            DataClassification = CustomerContent;
        }

        field(12; "Aucos Sealing Time"; Boolean)
        {
            Caption = 'Aucos Sealing Time';
            DataClassification = CustomerContent;
        }

        field(13; "Aucos Flushing Time"; Boolean)
        {
            Caption = 'Aucos Flushing Time';
            DataClassification = CustomerContent;
        }

        field(14; "British Standard"; Boolean)
        {
            Caption = 'British Standard';
            DataClassification = CustomerContent;
        }

        field(15; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            DataClassification = CustomerContent;
            trigger OnLookup()
            var
                GLSetup: Record "General Ledger Setup";
                DimensionValue: Record "Dimension Value";
                SelectionFilterManagement: Codeunit SelectionFilterManagement;
                DimensionValueList: Page "Dimension Value List";
                RecRef: RecordRef;
            begin
                GLSetup.Get();
                GLSetup.TestField("Global Dimension 1 Code");
                DimensionValue.SetRange("Dimension Code", GLSetup."Global Dimension 1 Code");
                DimensionValueList.LookupMode(true);
                DimensionValueList.SetTableView(DimensionValue);

                if DimensionValueList.RunModal() = Action::LookupOK then begin
                    DimensionValueList.SetSelectionFilter(DimensionValue);
                    RecRef.GetTable(DimensionValue);
                    "Dimension Value Code" := CopyStr(SelectionFilterManagement.GetSelectionFilter(RecRef, DimensionValue.FieldNo("Code")), 1, MaxStrLen("Dimension Value Code"));
                end;
            end;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}