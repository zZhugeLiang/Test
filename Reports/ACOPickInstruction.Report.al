report 50013 "ACO Pick Instruction"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOPickInstruction.rdl';
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
                RequestFilterFields = "No.";
                column(No_SalesHeader; "No.")
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
                column(Your_Reference; "Your Reference")
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
                column(PackageNo; ACOPackageLine."Package No.")
                {
                }
                column(PackageTypeText; PackageTypeText)
                {
                }
                //
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE(Type = CONST(Item));
                    column(LineNo_SalesLine; "Line No.")
                    {
                    }
                    column(ItemNo_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(VariantCode_SalesLine; "Variant Code")
                    {
                        IncludeCaption = true;
                    }
                    column(LocationCode_SalesLine; "Location Code")
                    {
                        IncludeCaption = true;
                    }
                    column(BinCode_SalesLine; "Bin Code")
                    {
                        IncludeCaption = true;
                    }
                    column(ShipmentDate_SalesLine; Format("Shipment Date"))
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitOfMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityToShip_SalesLine; "Qty. to Ship")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityShipped_SalesLine; "Quantity Shipped")
                    {
                        IncludeCaption = true;
                    }
                    column(QtyToAsm; QtyToAsm)
                    {
                    }
                    //
                    column(Line_No_; "Line No.")
                    {
                        IncludeCaption = true;
                    }
                    // column(Net_Weight; "Net Weight")
                    // {
                    //     IncludeCaption = true;
                    // }
                    // column(Gross_Weight; "Gross Weight")
                    // {
                    //     IncludeCaption = true;
                    // }
                    column(NetWeight; NetWeight)
                    {

                    }
                    column(GrossWeight; GrossWeight)
                    {

                    }
                    column(ACO_Profile_Code; "ACO Profile Code")
                    {
                        IncludeCaption = true;
                    }
                    column(ACO_Profile_Description; "ACO Profile Description")
                    {
                        IncludeCaption = true;
                    }
                    column(ACO_Customer_Item_No_; "ACO Customer Item No.")
                    {
                        IncludeCaption = true;
                    }
                    column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters")
                    {
                        IncludeCaption = true;
                    }
                    column(LengthInMilliMeters; ItemVariant."ACO Number of Meters" * 1000)
                    {
                    }
                    column(PictureFile_ACOProfile; ACOProfile."Picture File")
                    {
                        IncludeCaption = true;
                    }
                    //
                    dataitem("Assembly Line"; "Assembly Line")
                    {
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                        column(No_AssemblyLine; "No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Description_AssemblyLine; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(VariantCode_AssemblyLine; "Variant Code")
                        {
                            IncludeCaption = true;
                        }
                        column(Quantity_AssemblyLine; Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityPer_AssemblyLine; "Quantity per")
                        {
                            IncludeCaption = true;
                        }
                        column(UnitOfMeasure_AssemblyLine; GetUOM("Unit of Measure Code"))
                        {
                        }
                        column(LocationCode_AssemblyLine; "Location Code")
                        {
                            IncludeCaption = true;
                        }
                        column(BinCode_AssemblyLine; "Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityToConsume_AssemblyLine; "Quantity to Consume")
                        {
                            IncludeCaption = true;
                        }

                        trigger OnPreDataItem()
                        begin
                            if not AsmExists then
                                CurrReport.Break();
                            SetRange("Document Type", AsmHeader."Document Type");
                            SetRange("Document No.", AsmHeader."No.");
                        end;
                    }

                    trigger OnAfterGetRecord()
                    var
                        AssembleToOrderLink: Record "Assemble-to-Order Link";
                    begin
                        AssembleToOrderLink.Reset();
                        AssembleToOrderLink.SetCurrentKey(Type, "Document Type", "Document No.", "Document Line No.");
                        AssembleToOrderLink.SetRange(Type, AssembleToOrderLink.Type::Sale);
                        AssembleToOrderLink.SetRange("Document Type", "Document Type");
                        AssembleToOrderLink.SetRange("Document No.", "Document No.");
                        AssembleToOrderLink.SetRange("Document Line No.", "Line No.");
                        AsmExists := AssembleToOrderLink.FindFirst;
                        QtyToAsm := 0;
                        if AsmExists then
                            if AsmHeader.Get(AssembleToOrderLink."Assembly Document Type", AssembleToOrderLink."Assembly Document No.") then
                                QtyToAsm := AsmHeader."Quantity to Assemble"
                            else
                                AsmExists := false;

                        if not ItemVariant.Get("No.", "Variant Code") then
                            Clear(ItemVariant);

                        if ACOProfile.Get("ACO Profile Code") then begin
                            ACOProfile.CalcFields("Picture File");
                            NetWeight := ACOProfile."Weight per meter" * "ACO Number of Units";
                            GrossWeight := NetWeight * ACOAppSetup."Net/Gross Weight Factor";
                        end else
                            Clear(ACOProfile);
                    end;
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
        PageCaption = 'Page';
        ItemNoCaption = 'Item No.';
        OrderNoCaption = 'Order No.';
        CustomerNoCaption = 'Customer No.';
        CustomerNameCaption = 'Customer Name';
        QtyToAssembleCaption = 'Quantity to Assemble';
        QtyAssembledCaption = 'Quantity Assembled';
        ShipmentDateCaption = 'Shipment Date';
        QtyPickedCaption = 'Quantity Picked';
        UOMCaption = 'Unit of Measure';
        QtyConsumedCaption = 'Quantity Consumed';
        CopyCaption = 'Copy';
        PrintedByCaption = 'Printed by';
        OfCaption = 'of';
        PageOfCaption = 'Page %1 of %2';
        LengthCaption = 'Length';
        TotalWeightCaption = 'Total Weight';
        TotalNetWeightCaption = 'Total Net Weight';
        TotalGrossWeightCaption = 'Total Gross Weight';
    }

    trigger OnPreReport()
    begin
        DateTxt := Format(Today);
        CompNameText := CompanyName;
    end;

    var
        AsmHeader: Record "Assembly Header";
        ShipToCountryRegion: Record "Country/Region";
        User: Record User;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        ACOPackageLine: Record "ACO Package Line";
        NoOfCopies: Integer;
        //Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack
        NumberOfBoxes: Integer;
        NumberOfBundles: Integer;
        NumberOfCartons: Integer;
        NumberOfCarts: Integer;
        NumberOfChests: Integer;
        NumberOfTubes: Integer;
        NumberOfEmptyRacks: Integer;
        NumberOfPacks: Integer;
        NumberOfPallets: Integer;
        NumberOfRacks: Integer;

        DateTxt: Text;
        CompNameText: Text;
        PackageTypeText: Text;
        QtyToAsm: Decimal;
        TotalNetWeight: Decimal;
        TotalGrossWeight: Decimal;
        NetWeight: Decimal;
        GrossWeight: Decimal;
        AsmExists: Boolean;

    local procedure GetUOM(UOMCode: Code[10]): Text
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if UnitOfMeasure.Get(UOMCode) then
            exit(UnitOfMeasure.Description);
        exit(UOMCode);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer)
    begin
        NoOfCopies := NewNoOfCopies;
    end;

    local procedure GetPackageInfo(SalesHeader: Record "Sales Header")
    var
        ACOPackageHeader: Record "ACO Package Header";
        Packagetype: Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
    begin
        ACOPackageLine.SetCurrentKey("Sales Order No.");
        ACOPackageLine.SetRange("Sales Order No.", SalesHeader."No.");
        if ACOPackageLine.FindFirst() then begin
            ACOPackageHeader.Get(ACOPackageLine."Package No.");
            PackageTypeText := Format(ACOPackageHeader."Packing Type");
            case ACOPackageHeader."Packing Type" of
                Packagetype::Box:
                    NumberOfBoxes += 1;
                Packagetype::Bundle:
                    NumberOfBundles += 1;
                Packagetype::Carton:
                    NumberOfCartons += 1;
                Packagetype::Cart:
                    NumberOfCarts += 1;
                Packagetype::Chest:
                    NumberOfChests += 1;
                Packagetype::Tube:
                    NumberOfTubes += 1;
                Packagetype::"Empty Racks":
                    NumberOfEmptyRacks += 1;
                Packagetype::Pack:
                    NumberOfPacks += 1;
                Packagetype::Pallet:
                    NumberOfPallets += 1;
                Packagetype::Rack:
                    NumberOfRacks += 1;
            end
        end else
            Clear(ACOPackageLine);
    end;

    local procedure GetWeights(SalesHeader: Record "Sales Header")
    var
        CurrentNetWeight: Decimal;
        SalesLine: Record "Sales Line";
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

