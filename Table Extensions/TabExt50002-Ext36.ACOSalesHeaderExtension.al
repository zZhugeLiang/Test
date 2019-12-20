tableextension 50002 "ACO Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50001; "ACO Euras"; Boolean)
        {
            Caption = 'Euras Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Week Capacity"; Decimal)
        {
            Caption = 'Week Capacity [m2] Customer';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50006; "ACO Number of Units"; Decimal)
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;
        }

        field(50007; "ACO Blockade Status Inactive"; Decimal)
        {
            Caption = 'Blockade Status Inactive';
            DataClassification = CustomerContent;
        }


        field(50008; "ACO Calculate Line Amount"; Decimal)
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;
        }


        // field(50009; "ACO Number of Units"; Decimal)
        // {
        //     Caption = 'Number of Units';
        //     DataClassification = CustomerContent;
        // }


        field(50010; "ACO Rerun"; Text[20])
        {
            Caption = 'Rerun';
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Rerun Reason"; Text[20])
        {
            Caption = 'Rerun Reason';
            DataClassification = CustomerContent;
        }


        field(50012; "ACO Logged In"; Text[20])
        {
            Caption = 'Shipping Shelf';
            DataClassification = CustomerContent;
        }

        field(50013; "ACO Logged In DateTime"; DateTime)
        {
            Caption = 'Logged In DateTime';
            DataClassification = CustomerContent;
        }

        // field(50014; "ACO Logged In Week"; Integer) // Welk type?
        // {
        //     Caption = 'Logged In Week';
        //     DataClassification = CustomerContent;
        // }

        // field(50015; "ACO Logged In Year"; Integer) // Welk type?
        // {
        //     Caption = 'Logged In Year';
        //     DataClassification = CustomerContent;
        // }

        field(50016; "ACO Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = CustomerContent;
        }

        // field(50017; "ACO Document Date Week"; Integer) // Welk type?
        // {
        //     Caption = 'Document Date Week';
        //     DataClassification = CustomerContent;
        // }

        // field(50018; "ACO Document Date Year"; Integer) // Welk type?
        // {
        //     Caption = 'Document Date Year';
        //     DataClassification = CustomerContent;
        // }

        field(50019; "ACO Customer Comment"; Text[100])
        {
            Caption = 'Customer Comment';
            DataClassification = CustomerContent;
        }

        field(50020; "ACO Large Line"; Boolean)
        {
            Caption = 'Large Line';
            DataClassification = CustomerContent;
        }

        field(50021; "ACO Blocked State Inactive"; Boolean)
        {
            Caption = 'Blocked State Inactive';
            DataClassification = CustomerContent;
        }


    }
}
