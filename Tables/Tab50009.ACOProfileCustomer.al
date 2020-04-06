table 50009 "ACO Profile Customer"
{
    Caption = 'Profile Customer';
    DrillDownPageId = "ACO Profile Customers";
    LookupPageId = "ACO Profile Customers";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile";
            DataClassification = CustomerContent;
        }

        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Customer No.") then begin
                    "Customer Name" := Customer.Name;
                    Address := Customer.Address;
                    "Post Code" := Customer."Post Code";
                    City := Customer.City;
                    "Euras" := Customer."ACO Euras";
                    "Extra to Enumerate" := Customer."ACO Extra to Enumerate";
                    "Thick Staining Time" := Customer."ACO Thick Staining Time";
                    "Thin Staining Time" := Customer."ACO Thin Staining Time";
                end else begin
                    "Customer Name" := '';
                    Address := '';
                    "Post Code" := '';
                    City := '';
                    "Euras" := false;
                    "Extra to Enumerate" := 0;
                    "Thick Staining Time" := 0;
                    "Thin Staining Time" := 0;
                end;
            end;
        }

        field(3; "Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
            DataClassification = CustomerContent;
        }

        field(4; "Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }

        field(6; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }

        field(7; "Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme';
            TableRelation = "ACO Price Scheme";
            DataClassification = CustomerContent;
        }

        field(8; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = Field("Customer No."));
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ShipToAddr: Record "Ship-to Address";
            begin
                if ShipToAddr.Get("Customer No.", "Ship-to Code") then begin
                    Address := ShipToAddr.Address;
                    "Post Code" := ShipToAddr."Post Code";
                    City := ShipToAddr.City;
                end else begin
                    Address := '';
                    "Post Code" := '';
                    City := '';
                end;
            end;
        }
        field(9; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(10; "Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(11; "City"; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(12; "Packaging Instructions"; Option)
        {
            Caption = 'Packaging Instructions';
            OptionMembers = jpg,pdf,xlsx;
            OptionCaption = 'jpg,pdf,xlsx';
            DataClassification = CustomerContent;
        }

        field(13; "Euras"; Boolean)
        {
            Caption = 'Euras';
            DataClassification = CustomerContent;
        }

        field(14; "Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            DataClassification = CustomerContent;
        }

        field(15; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(16; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(17; "Sawing Discount"; Decimal)
        {
            Caption = 'Sawing Discount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Profile Code", "Customer No.", "Customer Item No.")
        {
            Clustered = true;
        }
    }
}