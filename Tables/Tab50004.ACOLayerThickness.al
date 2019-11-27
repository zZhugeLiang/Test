table 50004 "ACO Layer Thickness"
{
    Caption = 'Layer Thickness';
    DrillDownPageId = "ACO Layer Thicknesses";
    LookupPageId = "ACO Layer Thicknesses";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
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
            trigger OnLookup()
            var
                GLSetup: Record "General Ledger Setup";
                DimensionValue: Record "Dimension Value";
                DimensionValueList: Page "Dimension Value List";
            begin
                GLSetup.Get();
                GLSetup.TestField("Shortcut Dimension 3 Code");
                DimensionValue.SetRange("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                DimensionValueList.LookupMode(true);
                DimensionValueList.SetTableView(DimensionValue);
                if DimensionValueList.RunModal() = Action::LookupOK then
                    "Dimension Code" := CopyStr(DimensionValueList.GetSelectionFilter(), 1, MaxStrLen("Dimension Code"));
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