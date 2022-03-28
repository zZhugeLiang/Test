tableextension 50015 "ACO Item Unit of Measure" extends "Item Unit of Measure"
{
    fields
    {
        field(50000; "ACO Circumference"; Decimal)
        {
            Caption = 'Circumference [mm]';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Weight per meter"; Decimal)
        {
            Caption = 'Weight per meter [kg]';
            DecimalPlaces = 3;
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Correction Factor"; Decimal)
        {
            Caption = 'Correction Factor';
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Height Level"; Integer)
        {
            Caption = 'Height Level [mm]';
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Length"; Decimal)
        {
            Caption = 'Length [mm]';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }
    }
}
