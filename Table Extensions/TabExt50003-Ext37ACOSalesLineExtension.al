tableextension 50003 "ACO Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "ACO Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Minimum Current Density PT"; Decimal)
        {
            Caption = 'Minimum Current Density Pretreatment [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Maximum Current Density PT"; Decimal)
        {
            Caption = 'Maximum Current Density Pretreatment [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Thin Staining Time PT"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Pretreatment';
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Thick Staining Time PT"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Pretreatment';
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Do Not Calc. Short Length"; Boolean)
        {
            Caption = 'Do Not Calculate Short Length';
            DataClassification = CustomerContent;
        }

        field(50006; "ACO Aucos"; Boolean)
        {
            Caption = 'Aucos';
            DataClassification = CustomerContent;
        }

        field(50007; "ACO Aucos Sealing Time"; Boolean)
        {
            Caption = 'Aucos Sealing Time';
            DataClassification = CustomerContent;
        }

        field(50008; "ACO Aucos Flushing Time"; Boolean)
        {
            Caption = 'Aucos Flushing Time';
            DataClassification = CustomerContent;
        }

        field(50009; "ACO British Standard"; Boolean)
        {
            Caption = 'British Standard';
            DataClassification = CustomerContent;
        }

        field(50010; "ACO Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Min. Current Density Color"; Decimal)
        {
            Caption = 'Minimum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50012; "ACO Max. Current Density Color"; Decimal)
        {
            Caption = 'Maximum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50013; "ACO Minimum Current Density LT"; Decimal)
        {
            Caption = 'Minimum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50014; "ACO Maximum Current Density LT"; Decimal)
        {
            Caption = 'Maximum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50015; "ACO Max. Cur. Density Category"; Decimal)
        {
            Caption = 'Maximum Current Density Category [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50016; "ACO Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOProfile: Record "ACO Profile";
                ACOProfileCustomer: Record "ACO Profile Customer";
                ACOManagement: Codeunit "ACO Management";
                ProfileInactiveErr: Label 'Profile Code %1 is inactive.';
            begin
                if "ACO Profile Code" <> '' then begin
                    ACOProfile.Get("ACO Profile Code");
                    if ACOProfile."Blocked State Inactive" then
                        Error(ProfileInactiveErr, "ACO Profile Code");

                    SalesHeader.Get(Rec."Document Type"::Order, Rec."Document No.");

                    ACOProfileCustomer.SetRange("Profile Code", "ACO Profile Code");
                    ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                    ACOProfileCustomer.FindFirst();
                end;

                ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
            end;

            trigger OnLookup()
            var
                SalesHeader: Record "Sales Header";
                ACOProfileCustomer: Record "ACO Profile Customer";
                ACOProfileCustomer2: Record "ACO Profile Customer";
                ACOProfileCustomers: Page "ACO Profile Customers";
                RecRef: RecordRef;
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOProfileCustomers.LookupMode(true);
                ACOProfileCustomers.SetTableView(ACOProfileCustomer);

                if ACOProfileCustomers.RunModal() = Action::LookupOK then begin
                    ACOProfileCustomers.SetSelectionFilter(ACOProfileCustomer);
                    RecRef.GetTable(ACOProfileCustomer);
                    ACOProfileCustomers.GetRecord(ACOProfileCustomer2);
                    Validate("ACO Profile Code", ACOProfileCustomer2."Profile Code");
                end;
            end;
        }

        field(50017; "ACO Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(50018; "ACO Profile Category"; Code[50])
        {
            Caption = 'Profile Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(50019; "ACO Profile Circumference"; Decimal)
        {
            Caption = 'Circumference [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50020; "ACO Not Measurable"; Boolean)
        {
            Caption = 'Not Measurable';
            DataClassification = CustomerContent;
        }

        field(50021; "ACO Area Profile"; Decimal)
        {
            Caption = 'Area Profile';
            DataClassification = CustomerContent;
        }

        field(50022; "ACO Extra Flushing"; Boolean)
        {
            Caption = 'Extra Flushing Profile';
            DataClassification = CustomerContent;
        }

        field(50023; "ACO Correction Factor Profile"; Decimal)
        {
            Caption = 'Correction Factor Profile';
            DataClassification = CustomerContent;
        }

        field(50024; "ACO Height Level Profile"; Integer)
        {
            Caption = 'Height Level [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50025; "ACO Comment Bath Card"; Text[100])
        {
            Caption = 'Comment Bath Card';
            DataClassification = CustomerContent;
        }

        field(50026; "ACO Comment Work Note"; Text[100])
        {
            Caption = 'Comment Work Note';
            DataClassification = CustomerContent;
        }

        field(50027; "ACO Bent Profile"; Boolean)
        {
            Caption = 'Bent Profile';
            DataClassification = CustomerContent;
        }

        field(50028; "ACO Max. Curr. Density Profile"; Decimal)
        {
            Caption = 'Maximum Current Density Profile [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50029; "ACO Min. Curr. Density Profile"; Decimal)
        {
            Caption = 'Minimum Current Density Profile [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50030; "ACO Thin Staining Time Profile"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Profile';
            DataClassification = CustomerContent;
        }

        field(50031; "ACO Thick St. Time Profile"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Profile';
            DataClassification = CustomerContent;
        }

        field(50032; "ACO Euras Profile"; Boolean)
        {
            Caption = 'Euras Profile';
            DataClassification = CustomerContent;
        }

        field(50033; "ACO Extra to Enumerate Profile"; Integer)
        {
            Caption = 'Extra to Enumerate [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50034; "ACO Number of Units"; Decimal)
        {
            Caption = 'Number of Units';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Item: Record Item;
                ItemVariant: Record "Item Variant";
                ACOAppSetup: Record "ACO App Setup";
                NewQuantity: Decimal;
            begin
                if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then begin
                    ACOAppSetup.Get();

                    NewQuantity := "ACO Number of Units";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then begin
                        if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                            NewQuantity := ItemVariant."ACO Number of Meters" * "ACO Number of Units";
                    end else
                        if Rec."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                            if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                                NewQuantity := Rec."ACO Profile Circumference" * ItemVariant."ACO Number of Meters" * "ACO Number of Units" / 1000;

                    Validate(Quantity, NewQuantity);

                    "ACO Quantity Charges" := "ACO Number of Units" * "ACO Charges per Bath Profile";
                end;
            end;
        }

        field(50035; "ACO Holders Profile"; Code[20])
        {
            Caption = 'Holders Profile';
            DataClassification = CustomerContent;
        }

        field(50036; "ACO Attach Method Code Profile"; Code[10])
        {
            Caption = 'Attach Method Profile';
            DataClassification = CustomerContent;
        }

        field(50037; "ACO Type of Clamp Profile"; Text[100])
        {
            Caption = 'Type of Clamp Profile';
            DataClassification = CustomerContent;
        }

        field(50038; "ACO Helix Profile"; Decimal)
        {
            Caption = 'Helix Profile';
            DataClassification = CustomerContent;
        }

        field(50039; "ACO Space Profile"; Decimal)
        {
            Caption = 'Space Profile';
            DataClassification = CustomerContent;
        }

        field(50040; "ACO Sawing"; Boolean)
        {
            Caption = 'Sawing';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                AppSetup: Record "ACO App Setup";
                FinalLengtGtMaxSawingLengthErr: Label 'Final Length can not be greater than the Maximum Sawing Length.';
            begin
                AppSetup.Get();
                AppSetup.TestField("Maximum Sawing Length");
                if "ACO Final Length" > AppSetup."Maximum Sawing Length" then
                    Error(FinalLengtGtMaxSawingLengthErr);
            end;
        }

        field(50041; "ACO Final Length"; Decimal)
        {
            Caption = 'Final Length';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Number of Units" := "ACO Number of Units" / "ACO Final Length";
            end;
        }

        field(50042; "ACO Qty. After Production"; Decimal)
        {
            Caption = 'Qty. After Production';
            DataClassification = CustomerContent;
        }

        field(50044; "ACO Receipt Bag"; Text[20])
        {
            Caption = 'Receipt Bag';
            DataClassification = CustomerContent;
        }

        field(50045; "ACO Shipping Bag"; Text[20])
        {
            Caption = 'Shipping Bag';
            DataClassification = CustomerContent;
        }

        // field(50046; "ACO Circumference"; Decimal)
        // {
        //     Caption = 'Circumference';
        //     DataClassification = CustomerContent;
        // }

        field(50047; "ACO Area"; Decimal)
        {
            Caption = 'Area';
            DataClassification = CustomerContent;
        }

        field(50048; "ACO Holder"; Code[30])
        {
            Caption = 'Holder';
            TableRelation = "ACO Holder 2";
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                SalesHeader: Record "Sales Header";
                ItemVariant: Record "Item Variant";
                // ACOProfileCustomer: Record "ACO Profile Customer";
                ACOHolder2: Record "ACO Holder 2";//DEPRECATED, Replace with ACO Holder
                ACOHolders: Page "ACO Holders";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOHolder2.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOHolder2.SetRange("Profile Code", Rec."ACO Profile Code");
                if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                    ACOHolder2.SetRange(Length, ItemVariant."ACO Number of Meters");

                ACOHolders.LookupMode(true);
                ACOHolders.SetTableView(ACOHolder2);

                if ACOHolders.RunModal() = Action::LookupOK then begin
                    ACOHolders.SetSelectionFilter(ACOHolder2);
                    ACOHolders.GetRecord(ACOHolder2);
                    Validate("ACO Holder", ACOHolder2.Code);
                    // Validate("ACO Profile Code", ACOProfileCustomer2."Profile Code");
                end;
            end;

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOManagement: Codeunit "ACO Management";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOManagement.CheckStatusLinkedHolders(Rec."ACO Holder", SalesHeader."Sell-to Customer No.", Rec."ACO Profile Code", true);
            end;
        }

        field(50049; "ACO Receipt Shelf"; Text[20])
        {
            Caption = 'Receipt Shelf';
            DataClassification = CustomerContent;
        }

        field(50050; "ACO Shipping Shelf"; Text[20])
        {
            Caption = 'Shipping Shelf';
            DataClassification = CustomerContent;
        }

        field(50051; "ACO Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Quantity Charges" := "ACO Number of Units" * "ACO Charges per Bath Profile";
            end;
        }

        field(50052; "ACO Quantity Charges"; Decimal)
        {
            Caption = 'Quantity Charges';
            DataClassification = CustomerContent;
        }

        field(50053; "ACO Kundentour HUECK"; Text[100])
        {
            Caption = 'Kundentour HUECK';
            DataClassification = CustomerContent;
        }

        field(50054; "ACO Packaging"; Code[20])
        {
            Caption = 'Packaging';
            TableRelation = "ACO Packaging".Code;
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                SalesHeader: Record "Sales Header";
                ItemVariant: Record "Item Variant";
                ACOPackaging: Record "ACO Packaging";
                ACOPackagingList: Page "ACO Packaging List";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOPackaging.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOPackaging.SetRange("Profile Code", Rec."ACO Profile Code");
                if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                    ACOPackaging.SetRange("Length 2", ItemVariant."ACO Number of Meters");

                ACOPackagingList.LookupMode(true);
                ACOPackagingList.SetTableView(ACOPackaging);

                if ACOPackagingList.RunModal() = Action::LookupOK then begin
                    ACOPackagingList.SetSelectionFilter(ACOPackaging);
                    ACOPackagingList.GetRecord(ACOPackaging);
                    "ACO Packaging" := ACOPackaging.Code;
                end;
            end;
        }

        field(50055; "ACO Project Color Code"; Code[20])
        {
            Caption = 'Project Color Code';
            TableRelation = "ACO Project Color Header";
            DataClassification = CustomerContent;
        }

    }

    procedure ACOCalculateUnitPrice()
    var
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
        ACOPriceScheme: Record "ACO Price Scheme";
        ACOPriceSchemePrice: Record "ACO Price Scheme Price";
        Item: Record Item;
        ACOCategory: Record "ACO Category";
        NewUnitPrice: Decimal;
        Factor: Decimal;
        RangedQty: Decimal;
    begin
        NewUnitPrice := "Unit Price";

        SalesHeader.Get("Document Type", "Document No.");
        Customer.Get(SalesHeader."Sell-to Customer No.");
        if not ACOPriceScheme.Get(Customer."ACO Price Scheme Code") then
            exit;

        if not Item.Get("No.") then
            exit;

        if not ACOCategory.Get(Item."ACO Category Code") then
            exit;

        if ACOCategory."Add Short Length Charge" then begin
            if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                RangedQty := "ACO Number of Units" * ItemVariant."ACO Number of Meters";

            ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
            ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Length);
            ACOPriceSchemePrice.SetFilter("Minimum Quantity", '<%1', RangedQty);
            if ACOPriceSchemePrice.FindLast() then begin
                Factor := ACOPriceSchemePrice."Unit Price";
                NewUnitPrice := NewUnitPrice * Factor;
            end;
        end;

        if ACOCategory."Add High Weight Charge" then begin
            RangedQty := "ACO Number of Units" * ACOProfile."Weight per meter";

            if ACOProfile.Get("ACO Profile Code") then begin
                ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
                ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Weight);
                ACOPriceSchemePrice.SetFilter("Minimum Quantity", '<%1', RangedQty);
                if ACOPriceSchemePrice.FindLast() then begin
                    Factor := ACOPriceSchemePrice."Unit Price";
                    NewUnitPrice := NewUnitPrice * Factor;
                end;
            end;
        end;

        if ACOCategory."Add Inner Cathode Charge" then begin
            ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
            ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::"Inner Cathode Charge");
            ACOPriceSchemePrice.SetFilter("Minimum Quantity", '<%1', RangedQty);
            if ACOPriceSchemePrice.FindLast() then begin
                Factor := ACOPriceSchemePrice."Unit Price";
                NewUnitPrice := NewUnitPrice * Factor;
            end;
        end;

        if ACOCategory."Calculate Minimum Circumf." then begin
            //RangedQty := "ACO Number of Units" * ItemVariant."ACO Number of Meters" * "ACO Profile Circumference";
            RangedQty := Rec."ACO Profile Circumference" * ItemVariant."ACO Number of Meters" * "ACO Number of Units" / 1000;
            if ACOProfile.Get("ACO Profile Code") then begin
                ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
                ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Circumference);
                ACOPriceSchemePrice.SetFilter("Minimum Quantity", '<%1', RangedQty);
                if ACOPriceSchemePrice.FindLast() then begin
                    Factor := ACOPriceSchemePrice."Unit Price";
                    NewUnitPrice := NewUnitPrice * Factor;
                end;
            end;
        end;

        Validate("Unit Price", NewUnitPrice);
    end;
}