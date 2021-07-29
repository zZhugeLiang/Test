report 50018 "ACO Pick Instruction 2"
{
    DefaultLayout = RDLC;
    Caption = 'Pick Instruction 2';

    dataset
    {

        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";

            column(No_SalesHeader; "Sales Header"."No.")
            {
                IncludeCaption = true;
            }
            column(CustomerNo_SalesHeader; "Sell-to Customer No.")
            {
                IncludeCaption = true;
            }
            column(CustomerName_SalesHeader; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(Sell_to_Address; "Sell-to Address")
            {
                IncludeCaption = true;
            }
            column(Sell_to_Post_Code; "Sell-to Post Code")
            {
                IncludeCaption = true;
            }
            column(Sell_to_City; "Sell-to City")
            {
                IncludeCaption = true;
            }
            //
            column(BilltoCustomerNo_SalesHeader; "Bill-to Customer No.")
            {
                IncludeCaption = true;
            }
            column(BilltoName_SalesHeader; "Bill-to Name")
            {
                IncludeCaption = true;
            }
            column(Ship_to_Name; "Ship-to Name")
            {
                IncludeCaption = true;
            }
            column(Ship_to_Address; "Ship-to Address")
            {
                IncludeCaption = true;
            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {
                IncludeCaption = true;
            }
            column(Ship_to_City; "Ship-to City")
            {
                IncludeCaption = true;
            }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code")
            {
                IncludeCaption = true;
            }
            column(NameShipToCountryRegion; ShipToCountryRegion.Name)
            {
            }
            column(External_Document_No_; "External Document No.")
            {
                IncludeCaption = true;
            }
            column(ACO_Customer_Comment; "ACO Customer Comment")
            {
                IncludeCaption = true;
            }
            column(WorkDescription_SalesHeaderCaption; "Sales Header".FieldCaption("Work Description")) { }
            column(WorkDescription_SalesHeader; "Sales Header".GetWorkDescription()) { }
            column(TotalNetWeight; TotalNetWeight)
            {
            }
            column(TotalGrossWeight; TotalGrossWeight)
            {
            }
            column(NumberOfPallets; NumberOfPallets) { }
            column(NumberOfPacks; NumberOfPacks) { }
            column(NumberOfBundles; NumberOfBundles) { }
            column(UserID; UserID()) { }

            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Number; Number)
                {
                }
                column(CompanyNameText; CompNameText)
                {
                }
                column(DateText; DateTxt)
                {
                }
                column(CurrentDateTime; CurrentDateTime())
                {
                }
                column(CreatedbyUser; User."User Name")
                {
                }
                dataitem(PackageHeader; Integer)
                {
                    column(No_TempACOPackageHeader; TempACOPackageHeader."No.") { }
                    column(OrderNo_TempACOPackageHeader; TempACOPackageHeader."Sales Shipment No.") { }
                    column(PackageTypeText; PackageTypeText) { }

                    dataitem("ACO Package Line"; "ACO Package Line")
                    {
                        // DataItemLinkReference = "Sales Header";
                        // DataItemLink = "Sales Order No." = field("No.");
                        column(Package_No_; "Package No.") { }
                        column(SalesOrderNo; SalesOrderNo) { }
                        column(Sales_Line_No; "Sales Line No") { }

                        column(ACO_Profile_Code; SalesLine."ACO Profile Code")
                        {
                            IncludeCaption = true;
                        }
                        column(ACO_Profile_Description; SalesLine."ACO Profile Description")
                        {
                            IncludeCaption = true;
                        }
                        column(Quantity; Quantity)
                        {
                        }
                        column(Length; Length)
                        {
                        }
                        column(PictureFile_ACOProfile; ACOProfile."Picture File")
                        {
                        }

                        column(Your_Reference; YourReference)
                        {
                        }
                        column(RackNoCustomer_ACOPackageHeader; ACOPackageHeader."Rack No. Customer")
                        {
                        }
                        column(Weightpermeter_ACOProfile; ACOProfile."Weight per meter")
                        {
                        }
                        column(NetGrossWeightFactor_ACOAppSetup; ACOAppSetup."Net/Gross Weight Factor")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            Clear(SalesLine);
                            Clear(ItemVariant);

                            if not ACOPackageHeader.Get("ACO Package Line"."Package No.") then
                                Clear(ACOPackageHeader);

                            if ACOPackageHeader."Sales Shipment No." <> '' then
                                CurrReport.Skip();

                            if SalesLine.Get(SalesLine."Document Type"::Order, "ACO Package Line"."Sales Order No.", "ACO Package Line"."Sales Line No") then begin
                                if not ItemVariant.Get(SalesLine."No.", "Variant Code") then
                                    Clear(ItemVariant);
                                if ACOProfile.Get(SalesLine."ACO Profile Code") then begin
                                    ACOProfile.CalcFields("Picture File");
                                    NetWeight := ACOProfile."Weight per meter" * SalesLine."ACO Number of Units";
                                    GrossWeight := NetWeight * ACOAppSetup."Net/Gross Weight Factor";
                                end else
                                    Clear(ACOProfile);
                            end;

                            SalesOrderNo := "ACO Package Line"."Sales Order No.";
                            YourReference := "Sales Header"."Your Reference";
                        end;

                        trigger OnPreDataItem()
                        begin
                            "ACO Package Line".SetRange("Package No.", TempACOPackageHeader."No.");
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if PackageHeader.Number = 1 then
                            TempACOPackageHeader.FindFirst()
                        else
                            TempACOPackageHeader.Next();

                        PackageTypeText := Format(TempACOPackageHeader."Packing Type");
                    end;

                    trigger OnPreDataItem()
                    begin
                        PackageHeader.SetRange(Number, 1, TempACOPackageHeader.Count());
                    end;
                }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoOfCopies + 1);
                    // User.Get(UserSecurityId());
                    // ACOAppSetup.Get();
                end;
            }

            trigger OnAfterGetRecord()
            var
                ACOPackageHeaderSearch: Record "ACO Package Header";
                ACOPackageLineSearch: Record "ACO Package Line";
            begin
                if not ShipToCountryRegion.Get("Ship-to Country/Region Code") then
                    Clear(ShipToCountryRegion);

                GetPackageInfo("Sales Header");
                GetWeights("Sales Header");

                TempACOPackageHeader.DeleteAll();
                ACOPackageLineSearch.SetRange("Sales Order No.", "Sales Header"."No.");
                if ACOPackageLineSearch.FindSet() then
                    repeat
                        if not TempACOPackageHeader.Get(ACOPackageLineSearch."Package No.") then
                            if ACOPackageHeaderSearch.Get(ACOPackageLineSearch."Package No.") then begin
                                TempACOPackageHeader := ACOPackageHeaderSearch;
                                TempACOPackageHeader."Sales Shipment No." := ACOPackageLineSearch."Sales Order No.";
                                TempACOPackageHeader.Insert();
                            end;
                    until ACOPackageLineSearch.Next() = 0;
            end;

            trigger OnPreDataItem()
            begin
                User.Get(UserSecurityId());
                ACOAppSetup.Get();
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("No of Copies"; NoOfCopies)
                    {
                        ApplicationArea = Planning;
                        Caption = 'No of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        OrderPickingListCaption = 'Pick Instruction';
        PickingNoteForCustomerCaption = 'Picking note for customer';
        ColliNoCustomerNoCaption = 'Colli No. + Customer No.';
        SalesOrderPlusLineCaption = 'Sales Order + Line';
        YourReferencePlusSalesCommentCaption = 'Your Reference + Sales Comment';
        PackRackCaption = 'Pack/Rack';
        SalesOrderCaption = 'Sales Order';
        ItemPlusDescriptionCaption = 'Item + Description';
        QuantityCaption = 'Quantity';
        LengthCaption = 'Length';
        PictureCaption = 'Picture';
        OverviewPackageCaption = 'Overview Package';
        PalletCaption = 'Pallet';
        PackCaption = 'Pack';
        BundleCaption = 'Bundle';

        PageCaption = 'Page';

        PrintedByCaption = 'Printed by';
        OfCaption = 'of';
        PageOfCaption = 'Page %1 of %2';
        TotalWeightCaption = 'Total Weight';
        TotalNetWeightCaption = 'Total Net Weight';
        TotalGrossWeightCaption = 'Total Gross Weight';
        DriverCaption = 'Driver';
        ForkliftDriverCaption = 'Forklift Driver';
    }

    trigger OnPreReport()
    begin
        DateTxt := Format(Today);
        CompNameText := CompanyName;
    end;

    var
        ShipToCountryRegion: Record "Country/Region";
        User: Record User;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        ACOPackageLine: Record "ACO Package Line";
        ACOPackageHeader: Record "ACO Package Header";
        SalesLine: Record "Sales Line";
        TempACOPackageHeader: Record "ACO Package Header" temporary;
        NoOfCopies: Integer;
        NumberOfBundles: Integer;
        NumberOfPacks: Integer;
        NumberOfPallets: Integer;
        DateTxt: Text;
        CompNameText: Text;
        PackageTypeText: Text;
        SalesOrderNo: Text;
        YourReference: Text;
        TotalNetWeight: Decimal;
        TotalGrossWeight: Decimal;
        NetWeight: Decimal;
        GrossWeight: Decimal;

    procedure InitializeRequest(NewNoOfCopies: Integer)
    begin
        NoOfCopies := NewNoOfCopies;
    end;

    local procedure GetPackageInfo(SalesHeader: Record "Sales Header")
    var
        ACOPackageHeader: Record "ACO Package Header";
        Packagetype: Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
    begin
        NumberOfBundles := 0;
        NumberOfPacks := 0;
        NumberOfPallets := 0;
        PackageTypeText := '';

        ACOPackageLine.SetCurrentKey("Sales Order No.");
        ACOPackageLine.SetRange("Sales Order No.", SalesHeader."No.");
        if ACOPackageLine.FindSet() then begin
            if ACOPackageHeader.Get(ACOPackageLine."Package No.") then begin
                repeat
                    case ACOPackageHeader."Packing Type" of
                        Packagetype::Bundle:
                            NumberOfBundles += 1;
                        Packagetype::Pack:
                            NumberOfPacks += 1;
                        Packagetype::Pallet:
                            NumberOfPallets += 1;
                    end;
                until ACOPackageLine.Next() = 0;
            end;
        end else
            Clear(ACOPackageLine);
    end;

    local procedure GetWeights(SalesHeader: Record "Sales Header")
    var
        CurrentNetWeight: Decimal;
        CurrentGrossWeight: Decimal;
    begin
        TotalNetWeight := 0;
        TotalGrossWeight := 0;
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                if ACOProfile.Get(SalesLine."ACO Profile Code") then begin
                    CurrentNetWeight := ACOProfile."Weight per meter" * SalesLine."ACO Number of Units";
                    CurrentGrossWeight := CurrentNetWeight * ACOAppSetup."Net/Gross Weight Factor";
                    TotalNetWeight += CurrentNetWeight;
                    TotalGrossWeight += CurrentGrossWeight;
                end;
            until SalesLine.Next() = 0;
    end;
}

