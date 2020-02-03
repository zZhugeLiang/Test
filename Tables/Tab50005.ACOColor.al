table 50005 "ACO Color"
{
    Caption = 'Color';
    DrillDownPageId = "ACO Colors";
    LookupPageId = "ACO Colors";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[50])
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

        field(5; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }

        field(6; "Color Group"; Code[20])
        {
            Caption = 'Color Group';
            TableRelation = "ACO Color Group";
            DataClassification = CustomerContent;
        }

        field(7; "Coloring Time"; Decimal)
        {
            Caption = 'Coloring Time [min]';
            DataClassification = CustomerContent;
        }

        field(8; "Minimum Gold Time"; Decimal)
        {
            Caption = 'Minimum Gold Time [min]';
            DataClassification = CustomerContent;
        }

        field(9; "Maximum Gold Time"; Decimal)
        {
            Caption = 'Maximum Gold Time [min]';
            DataClassification = CustomerContent;
        }

        field(10; "Dimension Value Code"; Code[20])
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