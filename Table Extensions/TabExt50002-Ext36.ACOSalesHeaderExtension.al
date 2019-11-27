tableextension 50002 "ACO Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50001; "ACO Euras"; Boolean)
        {
            Caption = 'Euras';
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Week Capacity"; Decimal)
        {
            Caption = 'Week Capacity [m2]';
            DataClassification = CustomerContent;
        }

    }
}
