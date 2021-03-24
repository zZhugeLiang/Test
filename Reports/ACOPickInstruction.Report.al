report 50013 "ACO Pick Instruction"
{
    DefaultLayout = RDLC;
    // RDLCLayout = 'RDL Layouts\ACOPickInstruction.rdl';
    Caption = 'Pick Instruction';

    dataset
    {
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
                dataitem("ACO Package Line"; "ACO Package Line")
                {
                    DataItemLink = "Sales Order No." = field("No.");
                    // DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE(Type = CONST(Item));
                    column(Package_No_; "Package No.") { }

                    // column(LineNo_SalesLine; "Line No.")
                    // {
                    // }
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
                        // IncludeCaption = true;
                    }
                    column(Length; Length)
                    {
                        // IncludeCaption = true;
                    }
                    column(PictureFile_ACOProfile; ACOProfile."Picture File")
                    {
                        // IncludeCaption = true;
                    }

                    column(Your_Reference; YourReference)
                    {
                    }
                    column(PackageTypeText; PackageTypeText)
                    {
                    }
                    trigger OnAfterGetRecord()
                    // var
                    //     ACOPackageHeader: Record "ACO Package Header";
                    begin
                        Clear(SalesLine);
                        Clear(ItemVariant);

                        // ACOPackageHeader.Get("ACO Package Line"."Package No.");
                        // if ACOPackageHeader."Sales Shipment No." <> '' then
                        //     CurrReport.Skip();

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

                    // trigger OnPreDataItem()
                    // begin
                    //     "ACO Package Line".SetRange(Sales );
                    // end;
                }

                trigger OnAfterGetRecord()
                begin
                    if not ShipToCountryRegion.Get("Ship-to Country/Region Code") then
                        Clear(ShipToCountryRegion);

                    GetPackageInfo("Sales Header");
                    GetWeights("Sales Header");
                end;
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, NoOfCopies + 1);
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
        PickingNoteForCustomerCaption = 'Picking note for customer';// NLD Picklijst van klant
        ColliNoCustomerNoCaption = 'Colli No. + Customer No.';// NLD = Collinr. Alucol + klant
        SalesOrderPlusLineCaption = 'Sales Order + Line';// NLD = Verkooporder + regel
        YourReferencePlusSalesCommentCaption = 'Your Reference + Sales Comment';// NLD = Referentie + WB notitie
        PackRackCaption = 'Pack/Rack';//NLD = Pak/Rek
        SalesOrderCaption = 'Sales Order';//NLD=Verkooporder
        ItemPlusDescriptionCaption = 'Item + Description'; // NLD=Artikel + omschrijving
        QuantityCaption = 'Quantity';
        LengthCaption = 'Length';
        PictureCaption = 'Picture';//NLD = Afbeelding
        OverviewPackageCaption = 'Overview Package';//NLD= Overzicht verpakking
        PalletCaption = 'Pallet';
        PackCaption = 'Pack';//NLD=Pak;
        BundleCaption = 'Bundle';// NLD= Bundel

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
        // AsmHeader: Record "Assembly Header";
        ShipToCountryRegion: Record "Country/Region";
        User: Record User;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        ACOPackageLine: Record "ACO Package Line";
        SalesLine: Record "Sales Line";
        NoOfCopies: Integer;
        //Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack
        // NumberOfBoxes: Integer;
        NumberOfBundles: Integer;
        // NumberOfCartons: Integer;
        // NumberOfCarts: Integer;
        // NumberOfChests: Integer;
        // NumberOfTubes: Integer;
        // NumberOfEmptyRacks: Integer;
        NumberOfPacks: Integer;
        NumberOfPallets: Integer;
        // NumberOfRacks: Integer;

        DateTxt: Text;
        CompNameText: Text;
        PackageTypeText: Text;
        SalesOrderNo: Text;
        YourReference: Text;
        // QtyToAsm: Decimal;
        TotalNetWeight: Decimal;
        TotalGrossWeight: Decimal;
        NetWeight: Decimal;
        GrossWeight: Decimal;
    // AsmExists: Boolean;

    // local procedure GetUOM(UOMCode: Code[10]): Text
    // var
    //     UnitOfMeasure: Record "Unit of Measure";
    // begin
    //     if UnitOfMeasure.Get(UOMCode) then
    //         exit(UnitOfMeasure.Description);
    //     exit(UOMCode);
    // end;

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

        ACOPackageLine.SetCurrentKey("Sales Order No.");
        ACOPackageLine.SetRange("Sales Order No.", SalesHeader."No.");
        if ACOPackageLine.FindSet() then begin
            ACOPackageHeader.Get(ACOPackageLine."Package No.");
            PackageTypeText := Format(ACOPackageHeader."Packing Type");
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
        end else
            Clear(ACOPackageLine);
    end;

    local procedure GetWeights(SalesHeader: Record "Sales Header")
    var
        CurrentNetWeight: Decimal;
        // SalesLine: Record "Sales Line";
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

