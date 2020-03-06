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

        field(50006; "ACO Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme Code';
            DataClassification = CustomerContent;
            TableRelation = "ACO Price Scheme";
        }

        field(50007; "ACO Comment Bath Card"; Text[100])
        {
            Caption = 'Comment Bath Card';
            DataClassification = CustomerContent;
        }

        field(50008; "ACO Comment Sales Order"; Text[100])
        {
            Caption = 'Comment Sales Order';
            DataClassification = CustomerContent;
        }

        field(50009; "ACO Package Label Nos."; Code[20])
        {
            Caption = 'Package Label Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(50010; "ACO Package Label Report ID"; Integer)
        {
            Caption = 'Package Label Report ID';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Package Label Layout Code"; Code[20])
        {
            Caption = 'Package Label Layout Code';
            TableRelation = "Custom Report Layout" where("Report ID" = field("ACO Package Label Report ID"));
            DataClassification = CustomerContent;
        }

        field(50012; "ACO Shelf No. Mand. on Package"; Boolean)
        {
            Caption = 'Shelf No. Mandatory on Package';
            DataClassification = CustomerContent;
        }

        field(50013; "ACO No. Series Packages"; Code[20])
        {
            Caption = 'No. Series Packages';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(50014; "ACO Rack No. Mand. on Package"; Boolean)
        {
            Caption = 'Rack No. Mandatory on Package';
            DataClassification = CustomerContent;
        }
    }
}
