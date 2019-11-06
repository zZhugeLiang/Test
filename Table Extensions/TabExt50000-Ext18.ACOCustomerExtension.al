tableextension 50000 "ACO Customer Extension" extends Customer
{
    fields
    {
        field(50000; "ACO OVIS Mail"; Boolean)
        {
            Caption = 'OVIS Mail';
            DataClassification = CustomerContent;
        }

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

        field(50006; "ACO Price Scheme"; Code[10])
        {
            Caption = 'Price Scheme';
            DataClassification = CustomerContent;
            TableRelation = "ACO Price Scheme";
        }

        field(50007; "ACO Comment Bath Card"; Text[100])
        {
            Caption = 'Price Scheme';
            DataClassification = CustomerContent;
            TableRelation = "ACO Price Scheme";
        }

        field(50008; "ACO Comment Sales Order"; Text[100])
        {
            Caption = 'Comment Sales Order';
            DataClassification = CustomerContent;
            TableRelation = "ACO Price Scheme";
        }

        field(50009; "ACO Package Label Nos."; Code[20])
        {
            Caption = 'Package Label Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(50010; "ACO Package Label Report ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Package Label Report ID';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
        }

        field(50011; "ACO Package Label Layout Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Package Label Layout Code';
            TableRelation = "Custom Report Layout" where("Report ID" = field("ACO Package Label Report ID"));
        }
    }
}
