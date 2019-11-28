table 50009 "ACO Profile Customer"
{
    Caption = 'Profile Customer';
    DrillDownPageId = "ACO Profiles";
    LookupPageId = "ACO Profiles";
    DataClassification = CustomerContent;

    fields
    {
        //     {	Klantnummer
        // 	Klantnaam
        // 	Artikelnummer klant
        // 	Artikelomschrijving klant
        // 	Status (actief (standaard) of inactief)
        // 	Prijsschema toeslagen Code10 (Zie Functioneel Ontwerp klantenkaart
        // o	Tabblad Adresgegevens:
        // 	Verzendcode
        // 	Adres
        // 	Postcode
        // 	Woonplaats
        // o	Tabblad Productieparameters:
        // 	Verpakkingsvoorschrift = jpg/pdf/xlsx
        // 	Euras Boolean. Dit veld is benodigd voor het productieproces
        // 	Extra uittellen Decimal. Dit veld is benodigd voor het productieproces
        // 	Beitstijd dikke beits Decimal. Dit veld is benodigd voor het productieproces
        // 	Beitstijd dunne beits Decimal. Dit veld is benodigd voor het productieproces

        field(1; "Customer No."; Code[20])
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

        field(2; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile";
            DataClassification = CustomerContent;
        }

        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }

        field(4; "Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(5; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }

        field(6; "Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme';
            TableRelation = "ACO Price Scheme";
            DataClassification = CustomerContent;
        }

        field(7; "Ship-to Code"; Code[10])
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
        field(8; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(9; "Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(10; "City"; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(11; "Packaging Instructions"; Option)
        {
            Caption = 'Packaging Instructions';
            OptionMembers = jpg,pdf,xlsx;
            OptionCaption = 'jpg,pdf,xlsx';
            DataClassification = CustomerContent;
        }

        field(12; "Euras"; Boolean)
        {
            Caption = 'Euras';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(13; "Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(14; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(15; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Customer No.", "Profile Code")
        {
            Clustered = true;
        }
    }
}