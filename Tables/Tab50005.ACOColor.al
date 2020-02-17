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
            Caption = 'DEPRECATED';
            DataClassification = CustomerContent;
        }

        field(9; "Maximum Gold Time"; Decimal)
        {
            Caption = 'DEPRECATED';
            DataClassification = CustomerContent;
        }

        field(10; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            DataClassification = CustomerContent;
            trigger OnLookup()
            var
                ACOAppSetup: Record "ACO App Setup";
                DimensionValue: Record "Dimension Value";
                SelectionFilterManagement: Codeunit SelectionFilterManagement;
                DimensionValueList: Page "Dimension Value List";
                RecRef: RecordRef;
            begin
                ACOAppSetup.Get();
                ACOAppSetup.TestField("Color Dimension Code");
                DimensionValue.SetRange("Dimension Code", ACOAppSetup."Color Dimension Code");
                DimensionValue.SetRange(Blocked, false);
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

    trigger OnInsert()
    var
        ACOAppSetup: Record "ACO App Setup";
    begin
        ACOAppSetup.Get();
        ACOAppSetup.TestField("Color Dimension Code");
        "Dimension Code" := ACOAppSetup."Color Dimension Code";
    end;
}