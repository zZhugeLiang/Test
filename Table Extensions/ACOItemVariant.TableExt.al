tableextension 50008 "ACO Item Variant" extends "Item Variant"
{
    fields
    {
        field(50000; "ACO Number of Meters"; Decimal)
        {
            Caption = 'Number of Meters';
            DecimalPlaces = 4;
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    trigger OnBeforeInsert();
    begin
        "ACO Last DateTime Modified" := CurrentDateTime();
    end;

    trigger OnBeforeRename();
    begin
        "ACO Last DateTime Modified" := CurrentDateTime();
    end;

    trigger OnBeforeModify();
    begin
        "ACO Last DateTime Modified" := CurrentDateTime();
    end;
}
