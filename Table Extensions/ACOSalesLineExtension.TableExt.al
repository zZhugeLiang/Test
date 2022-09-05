tableextension 50003 "ACO Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "ACO Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOLayerThickness: Record "ACO Layer Thickness";

            begin
                Rec.GetPricingPrice();

                if ACOLayerThickness.Get(Rec."ACO Layer Thickness") then begin
                    Rec."ACO Maximum Current Density LT" := ACOLayerThickness."Maximum Current Density";
                    Rec."ACO Minimum Current Density LT" := ACOLayerThickness."Minimum Current Density";
                end;
            end;
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

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOColor: Record "ACO Color";
                ACOManagement: Codeunit "ACO Management";
            begin
                Rec.GetPricingPrice();

                if ACOColor.Get(Rec."ACO Color") then begin
                    Rec."ACO Max. Current Density Color" := ACOColor."Maximum Current Density";
                    Rec."ACO Min. Current Density Color" := ACOColor."Minimum Current Density";
                end;

                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
            end;
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
            TableRelation = "ACO Profile Customer"."Profile Code";
            //TableRelation = "Custom Report Layout" where("Report ID" = field("ACO Package Label Report ID"));
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOProfile: Record "ACO Profile";
                ACOProfileCustomer: Record "ACO Profile Customer";
                ACOManagement: Codeunit "ACO Management";
                ProfileInactiveErr: Label 'Profile Code %1 is inactive.', Comment = '%1 = Profile Code';
            begin
                if "ACO Profile Code" <> '' then begin
                    ACOProfile.Get("ACO Profile Code");
                    if ACOProfile."Blocked State Inactive" then
                        Error(ProfileInactiveErr, "ACO Profile Code");

                    SalesHeader.Get(Rec."Document Type", Rec."Document No.");

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
                    Rec."ACO Customer Item No." := ACOProfileCustomer2."Customer Item No.";
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

            trigger OnValidate()
            begin
                Rec.GetPricingPrice();
            end;
        }

        field(50019; "ACO Profile Circumference"; Decimal)
        {
            Caption = 'Circumference [mm] Profile';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                ACOProfile: Record "ACO Profile";
                ItemVariant: Record "Item Variant";
            begin
                if not ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                    Clear(ItemVariant);

                if ACOProfile.Get(Rec."ACO Profile Code") then
                    Rec.Validate("ACO Area Profile", Rec."ACO Profile Circumference" * Rec."ACO Profile Length" / 1000000)
                else
                    Rec.Validate("ACO Area Profile", 0);

                Rec.Validate("ACO Number of Units");
            end;
        }

        field(50020; "ACO Not Measurable"; Boolean)
        {
            Caption = 'Not Measurable';
            DataClassification = CustomerContent;
        }

        field(50021; "ACO Area Profile"; Decimal)
        {
            Caption = 'Area Profile';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Area" := "ACO Area Profile" * "ACO Number of Units";
            end;
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

                    if not ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                        Clear(ItemVariant);

                    if Rec."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then
                        NewQuantity := (Rec."ACO Profile Length" / 1000) * Rec."ACO Number of Units";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                        NewQuantity := Rec."ACO Profile Circumference" * Rec."ACO Profile Length" * Rec."ACO Number of Units" / 1000000;

                    Validate(Quantity, NewQuantity);
                    Validate("ACO Area Profile");
                    if "ACO Charges per Bath Profile" <> 0 then
                        "ACO Quantity Charges" := "ACO Number of Units" / "ACO Charges per Bath Profile";
                    "ACO Qty. After Production" := NewQuantity;
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

        field(50037; "ACO Number of Units to Ship"; Decimal)
        {
            Caption = 'Number of Units to Ship';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Item: Record Item;
                ACOAppSetup: Record "ACO App Setup";
                NewQuantity: Decimal;
            begin
                if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then begin
                    ACOAppSetup.Get();

                    NewQuantity := "ACO Number of Units to Ship";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then
                        NewQuantity := Rec."ACO Profile Length" / 1000 * "ACO Number of Units to Ship";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                        NewQuantity := Rec."ACO Profile Circumference" * Rec."ACO Profile Length" * "ACO Number of Units to Ship" / 1000000;

                    NewQuantity := Round(NewQuantity, 0.001);
                    if Rec."Outstanding Quantity" + 0.001 = NewQuantity then
                        NewQuantity := Round(Rec."Outstanding Quantity", 0.001);

                    Rec.Validate("Qty. to Ship", NewQuantity);
                    Rec.Validate("ACO Number of Units to Invoice", Rec."ACO Number of Units to Ship");
                end;
            end;
        }

        field(50038; "ACO Number of Units to Invoice"; Decimal)
        {
            Caption = 'Number of Units to Invoice';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Item: Record Item;
                ACOAppSetup: Record "ACO App Setup";
                NewQuantity: Decimal;
            begin
                if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then begin
                    ACOAppSetup.Get();

                    NewQuantity := "ACO Number of Units to Invoice";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Length Unit of Measure Code" then
                        NewQuantity := Rec."ACO Profile Length" / 1000 * "ACO Number of Units to Invoice";

                    if Rec."Unit of Measure Code" = ACOAppSetup."Area Unit of Measure Code" then
                        NewQuantity := Rec."ACO Profile Circumference" * Rec."ACO Profile Length" * "ACO Number of Units to Invoice" / 1000000;

                    NewQuantity := Round(NewQuantity, 0.001);
                    Validate("Qty. to Invoice", NewQuantity);
                end;
            end;
        }

        field(50040; "ACO Sawing"; Boolean)
        {
            Caption = 'Sawing';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "ACO Lower Accuracy" := 1;
                "ACO Upper Accuracy" := 1;
            end;
        }

        field(50042; "ACO Qty. After Production"; Decimal)
        {
            Caption = 'Qty. After Production';
            DataClassification = CustomerContent;
        }

        field(50044; "ACO Receipt Bag"; Text[250])
        {
            Caption = 'Receipt Bag';
            DataClassification = CustomerContent;
        }

        field(50045; "ACO Shipping Bag"; Text[250])
        {
            Caption = 'Shipping Bag';
            DataClassification = CustomerContent;
        }

        field(50047; "ACO Area"; Decimal)
        {
            Caption = 'Area';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50048; "ACO Linked Holder"; Code[30])
        {
            Caption = 'Linked Holder';
            TableRelation = "ACO Linked Holder";
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                SalesHeader: Record "Sales Header";
                ItemVariant: Record "Item Variant";
                ACOLinkedHolder: Record "ACO Linked Holder";
                Item: Record Item;
                ACOColor: Record "ACO Color";
                ACOLinkedHolders: Page "ACO Linked Holders";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOLinkedHolder.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOLinkedHolder.SetRange("Item No.", Rec."No.");

                if Item.Get(Rec."No.") then
                    if ACOColor.Get(Item."ACO Color") then
                        ACOLinkedHolder.SetRange("Color Group Code", ACOColor."Color Group");

                if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                    ACOLinkedHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

                ACOLinkedHolders.LookupMode(true);
                ACOLinkedHolders.SetTableView(ACOLinkedHolder);

                if ACOLinkedHolders.RunModal() = Action::LookupOK then begin
                    ACOLinkedHolders.SetSelectionFilter(ACOLinkedHolder);
                    ACOLinkedHolders.GetRecord(ACOLinkedHolder);
                    Validate("ACO Linked Holder", ACOLinkedHolder.Code);
                end;
            end;

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOManagement: Codeunit "ACO Management";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOManagement.CheckStatusLinkedHolders(Rec."ACO Linked Holder", SalesHeader."Sell-to Customer No.", Rec."ACO Profile Code", true);
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
                if Rec."ACO Charges per Bath Profile" <> 0 then
                    "ACO Quantity Charges" := "ACO Number of Units" / "ACO Charges per Bath Profile";
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
                ACOLinkedPackaging: Record "ACO Linked Packaging";
                ACOLinkedPackagingList: Page "ACO Linked Packaging List";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                ACOLinkedPackaging.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOLinkedPackaging.SetRange("Item No.", Rec."No.");
                if ItemVariant.Get(Rec."No.", Rec."Variant Code") then
                    ACOLinkedPackaging.SetRange("Length", ItemVariant."ACO Number of Meters" * 1000);

                ACOLinkedPackagingList.LookupMode(true);
                ACOLinkedPackagingList.SetTableView(ACOLinkedPackaging);

                if ACOLinkedPackagingList.RunModal() = Action::LookupOK then begin
                    ACOLinkedPackagingList.SetSelectionFilter(ACOLinkedPackaging);
                    ACOLinkedPackagingList.GetRecord(ACOLinkedPackaging);
                    "ACO Packaging" := ACOLinkedPackaging.Code;
                end;
            end;
        }

        field(50055; "ACO Project Color Code"; Code[20])
        {
            Caption = 'Project Color Code';
            TableRelation = "ACO Project Color Header";
            DataClassification = CustomerContent;
        }

        field(50057; "ACO Measure Report"; Boolean)
        {
            Caption = 'Measure Report';
            DataClassification = CustomerContent;
        }

        field(50058; "ACO Type of Clamp Code"; Code[10])
        {
            Caption = 'Type of Clamp Code Profile';
            TableRelation = "ACO Type of Clamp";
            DataClassification = CustomerContent;
        }

        field(50059; "ACO Head Cut"; Boolean)
        {
            Caption = 'Head Cut';
            DataClassification = CustomerContent;
        }

        field(50060; "ACO Return Remaining"; Boolean)
        {
            Caption = 'Return Remaining';
            DataClassification = CustomerContent;
        }

        field(50061; "ACO Lower Accuracy"; Decimal)
        {
            Caption = 'Lower Accuracy';
            DataClassification = CustomerContent;
        }

        field(50062; "ACO Upper Accuracy"; Decimal)
        {
            Caption = 'Upper Accuracy';
            DataClassification = CustomerContent;
        }

        field(50063; "ACO Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
            DataClassification = CustomerContent;
        }

        field(50064; "ACO Start Length"; Decimal)
        {
            Caption = 'Start Length';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                AppSetup: Record "ACO App Setup";
                ProdOrderLine: Record "Prod. Order Line";
                BathSheetLine: Record "ACO Bath Sheet Line";
                BathSheetLineExistsMsg: Label 'A Bath Sheet Line in Bath Sheet %1 is linked to this Sales Line, it has to be changed manually.', Comment = '%1 = The Number of the Bath Sheet';
                FinalLengtGtMaxSawingLengthErr: Label 'Start Length can not be greater than the Maximum Sawing Length.';
            begin
                AppSetup.Get();
                AppSetup.TestField("Min. Residue Saw");
                AppSetup.TestField("Maximum Sawing Length");

                if "ACO Start Length" > AppSetup."Maximum Sawing Length" then
                    Error(FinalLengtGtMaxSawingLengthErr);

                ProdOrderLine.SetRange("ACO Source No.", "Document No.");
                ProdOrderLine.SetRange("ACO Source Line No.", "Line No.");
                if ProdOrderLine.FindFirst() then begin
                    BathSheetLine.SetCurrentKey("Production Order No.", "Production Order Status", "Production Order Line No.");
                    BathSheetLine.SetRange("Production Order No.", ProdOrderLine."Prod. Order No.");
                    BathSheetLine.SetRange("Production Order Status", ProdOrderLine.Status);
                    BathSheetLine.SetRange("Production Order Line No.", ProdOrderLine."Line No.");
                    if BathSheetLine.FindFirst() then
                        Message(BathSheetLineExistsMsg, BathSheetLine."Bath Sheet No.");
                end;
            end;
        }

        field(50065; "ACO Profile Cust. Description"; Text[100])
        {
            Caption = 'Profile Customer Description';
            DataClassification = CustomerContent;
        }

        field(50066; "ACO Manual Unit Price"; Boolean)
        {
            Caption = 'Manual Unit Price';
            DataClassification = CustomerContent;
        }

        field(50067; "ACO Reject Billable"; Integer)
        {
            Caption = 'Reject Billable';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50068; "ACO Reject Not Billable"; Integer)
        {
            Caption = 'Reject Not Billable';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50069; "ACO Reject Billable Shipped"; Integer)
        {
            Caption = 'Reject Billable Shipped';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(50070; "ACO Rej. Not Billable Shipped"; Integer)
        {
            Caption = 'Reject Not Billable Shipped';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50071; "ACO Profile Customer PK"; Code[100])
        {
            Caption = 'Profile Code Dropdown';
            TableRelation = "ACO Profile Customer"."PK as a field";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                ACOProfileCustomer: Record "ACO Profile Customer";
                ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
                PositionCustNo: Integer;
                PositionCustomerItemNo: Integer;
                CustNoLength: Integer;
                CustomerNo: Code[20];
                NewProfileCode: Code[30];
                NewCustomerItemNo: Code[50];
            begin
                if Rec."ACO Profile Customer PK" <> '' then begin
                    if Rec."Sell-to Customer No." <> '' then
                        CustomerNo := Rec."Sell-to Customer No."
                    else
                        CustomerNo := ACOSingleInstanceMgt.GetCustomerNo();

                    CustNoLength := StrLen(CustomerNo);
                    PositionCustNo := StrPos(Rec."ACO Profile Customer PK", CustomerNo);
                    if PositionCustNo <> 0 then begin
                        PositionCustomerItemNo := PositionCustNo + CustNoLength;
                        NewProfileCode := CopyStr(Rec."ACO Profile Customer PK", 1, PositionCustNo - 1);
                        NewCustomerItemNo := CopyStr(Rec."ACO Profile Customer PK", PositionCustNo + CustNoLength);
                        ACOSingleInstanceMgt.GetACOProfileCustomerPK(NewProfileCode, CustomerNo, NewCustomerItemNo);
                        if ACOProfileCustomer.Get(NewProfileCode, CustomerNo, NewCustomerItemNo) then begin
                            Rec."ACO Customer Item No." := NewCustomerItemNo;
                            Rec.Validate("ACO Profile Code", NewProfileCode);
                        end;
                    end else begin
                        if StrLen(Rec."ACO Profile Customer PK") <= StrLen(Rec."ACO Profile Code") then
                            Rec.Validate("ACO Profile Code", CopyStr(Rec."ACO Profile Customer PK", 1, StrLen(Rec."ACO Profile Customer PK")))
                        else
                            Rec.Validate("ACO Profile Code", CopyStr(Rec."ACO Profile Customer PK", 1, MaxStrLen(Rec."ACO Profile Code")));
                    end;
                end;
            end;
        }

        field(50072; "ACO Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOPretreatment: Record "ACO Pretreatment";
            begin
                Rec.GetPricingPrice();

                if ACOPretreatment.Get(Rec."ACO Pretreatment") then begin
                    Rec."ACO Maximum Current Density PT" := ACOPretreatment."Maximum Current Density";
                    Rec."ACO Minimum Current Density PT" := ACOPretreatment."Minimum Current Density";
                end;
            end;
        }

        field(50073; "ACO Posttreatment"; Code[20])
        {
            Caption = 'Posttreatment';
            TableRelation = "ACO Posttreatment";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.GetPricingPrice();
            end;
        }

        field(50074; "ACO Particularity"; Code[20])
        {
            Caption = 'Particularity';
            TableRelation = "ACO Particularity";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.GetPricingPrice();
            end;
        }

        field(50075; "ACO Profile Length"; Decimal)
        {
            Caption = 'Length [mm] Profile';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
                ACOManagement: Codeunit "ACO Management";
            begin
                Rec.Validate("ACO Area Profile", Rec."ACO Profile Circumference" * Rec."ACO Profile Length" / 1000000);
                Rec.Validate("ACO Number of Units");

                SalesHeader.Get(Rec."Document Type", "Document No.");
                ACOManagement.CheckHolderAndPackaging(Rec, SalesHeader."Sell-to Customer No.");
            end;
        }

        field(50076; "ACO Customer Item Reference"; Text[50])
        {
            Caption = 'Customer Item Reference';
            DataClassification = CustomerContent;
        }

        field(50077; "ACO Customer Item Ref. Desc."; Text[100])
        {
            Caption = 'Customer Item Reference Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Item Reference".Description where("Reference No." = field("ACO Customer Item Reference")));
        }
    }

    var
        ACOUnitPrice: Decimal;

    procedure ACOCalculateUnitPrice()
    var
        SalesHeader: Record "Sales Header";
        ACOPriceScheme: Record "ACO Price Scheme";
        ACOPriceSchemePrice: Record "ACO Price Scheme Price";
        Item: Record Item;
        ItemUnitofMeasure: Record "Item Unit of Measure";
        ACOCategory: Record "ACO Category";
        ACOAppSetup: Record "ACO App Setup";
        NewUnitPrice: Decimal;
        BaseUnitPrice: Decimal;
        Factor: Decimal;
        RangedQty: Decimal;
    begin
        ACOAppSetup.Get();

        if Rec."Unit of Measure Code" <> ACOAppSetup."Area Unit of Measure Code" then
            exit;

        SalesHeader.Get("Document Type", "Document No.");

        if not Item.Get("No.") then
            exit;

        if not ACOPriceScheme.Get(Item."ACO Price Scheme Code") then
            exit;

        if not ACOCategory.Get(Item."ACO Category Code") then
            exit;

        BaseUnitPrice := "Unit Price";
        NewUnitPrice := BaseUnitPrice;

        if ACOCategory."Add Short Length Charge" then begin
            RangedQty := Rec."ACO Profile Length";

            ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
            ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Length);
            ACOPriceSchemePrice.SetFilter("Minimum Quantity", '>=%1', RangedQty);
            if ACOPriceSchemePrice.FindFirst() then begin
                Factor := ACOPriceSchemePrice."Unit Price";
                NewUnitPrice += ((BaseUnitPrice * Factor) - BaseUnitPrice);
            end;
        end;

        if ACOCategory."Add High Weight Charge" then
            if ItemUnitofMeasure.Get(Rec."No.", Rec."Unit of Measure Code") then begin
                RangedQty := ItemUnitofMeasure."ACO Weight per meter";
                ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
                ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Weight);
                ACOPriceSchemePrice.SetFilter("Minimum Quantity", '>=%1', RangedQty);
                if ACOPriceSchemePrice.FindFirst() then begin
                    Factor := ACOPriceSchemePrice."Unit Price";
                    NewUnitPrice += ((BaseUnitPrice * Factor) - BaseUnitPrice);
                end;
            end;

        if ACOCategory."Add Inner Cathode Charge" then begin
            ACOPriceSchemePrice.SetRange("Price Scheme Code", ACOPriceScheme.Code);
            ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::"Inner Cathode Charge");
            ACOPriceSchemePrice.SetFilter("Minimum Quantity", '>=%1', RangedQty);
            if ACOPriceSchemePrice.FindFirst() then begin
                Factor := ACOPriceSchemePrice."Unit Price";
                NewUnitPrice += ((BaseUnitPrice * Factor) - BaseUnitPrice);
            end;
        end;

        if ACOCategory."Calculate Minimum Circumf." or ACOCategory."Add Height Level Charge" then begin
            ACOPriceSchemePrice.SetRange(Type, ACOPriceSchemePrice.Type::Circumference);
            if ACOPriceSchemePrice.FindFirst() then
                if (Rec."ACO Profile Circumference" < ACOPriceSchemePrice."Minimum Quantity") and (Rec."ACO Profile Circumference" <> 0) then begin
                    if ACOCategory."Calculate Minimum Circumf." and ACOCategory."Add Height Level Charge" then
                        Factor := (ACOPriceSchemePrice."Minimum Quantity" + (2 * Rec."ACO Height Level Profile")) / Rec."ACO Profile Circumference"
                    else
                        if ACOCategory."Add Height Level Charge" then
                            Factor := (2 * Rec."ACO Height Level Profile" + Rec."ACO Profile Circumference") / Rec."ACO Profile Circumference"
                        else
                            if ACOCategory."Calculate Minimum Circumf." then
                                Factor := ACOPriceSchemePrice."Minimum Quantity" / Rec."ACO Profile Circumference";

                    Factor := ACOPriceSchemePrice."Minimum Quantity" / Rec."ACO Profile Circumference";

                    NewUnitPrice := NewUnitPrice * Factor;
                end;

            Validate("Unit Price", NewUnitPrice);
        end;
    end;

    procedure GetPricingPrice()
    var
        ACOPricing: Record "ACO Pricing";
        NewUnitPrice: Decimal;
    begin
        ACOPricing.SetRange("Customer Price Group", Rec."Customer Price Group");
        ACOPricing.SetRange("Pretreatment Code", Rec."ACO Pretreatment");
        ACOPricing.SetRange("Layer Thickness Code", Rec."ACO Layer Thickness");
        ACOPricing.SetRange("Color Code", Rec."ACO Color");
        ACOPricing.SetRange("Posttreatment Code", Rec."ACO Posttreatment");
        ACOPricing.SetRange("Particularity Code", Rec."ACO Particularity");
        ACOPricing.SetRange("Category Code", Rec."ACO Profile Category");
        ACOPricing.SetRange("Unit of Measure", Rec."Unit of Measure Code");
        ACOPricing.SetFilter("Starting Date", '<%1', Today());
        ACOPricing.SetFilter("Ending Date", '>%1', Today());
        if ACOPricing.FindFirst() then
            NewUnitPrice := ACOPricing."Unit Price"
        else begin
            ACOPricing.SetRange("Ending Date", 0D);
            if ACOPricing.FindFirst() then
                NewUnitPrice := ACOPricing."Unit Price";
        end;

        Rec.Validate("Unit Price", NewUnitPrice);
    end;

    procedure ACOCopyCustomFieldsFromSalesInvoiceLines(SalesInvoiceLine: Record "Sales Invoice Line");
    begin
        Rec."ACO Profile Code" := SalesInvoiceLine."ACO Profile Code";
        Rec."ACO Profile Description" := SalesInvoiceLine."ACO Profile Description";
        Rec."ACO Number of Units" := SalesInvoiceLine."ACO Number of Units";
        Rec."ACO Sawing" := SalesInvoiceLine."ACO Sawing";
        Rec."ACO Customer Item No." := SalesInvoiceLine."ACO Customer Item No.";
        Rec."ACO Profile Cust. Description" := SalesInvoiceLine."ACO Profile Cust. Description";
        Rec.Modify(true);
    end;

    procedure ACOSetACOUnitPrice(NewACOUnitPrice: Decimal);
    begin
        ACOUnitPrice := NewACOUnitPrice;
    end;

    procedure ACOGetACOUnitPrice(): Decimal;
    begin
        exit(ACOUnitPrice);
    end;
}