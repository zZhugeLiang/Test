report 50012 "ACO Sales - Shipment"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './SalesShipment.rdlc';
    Caption = 'Sales - Shipment';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Shipment';
            column(No_SalesShptHeader; "No.")
            {
            }
            column(PageCaption; PageCaptionCap)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(SalesShptCopyText; StrSubstNo(Text002, CopyText))
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfoVATRegtnNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(SelltoCustNo_SalesShptHeader; "Sales Shipment Header"."Sell-to Customer No.")
                    {
                    }
                    column(DocDate_SalesShptHeader; Format("Sales Shipment Header"."Document Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesShptHeader; "Sales Shipment Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(ShptDate_SalesShptHeader; Format("Sales Shipment Header"."Shipment Date"))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ItemTrackingAppendixCaption; ItemTrackingAppendixCaptionLbl)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(ShipmentNoCaption; ShipmentNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(SelltoCustNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Customer No."))
                    {
                    }
                    column(OrderNoCaption_SalesShptHeader; OurDocumentNoLbl)
                    {
                    }
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(ExternalDocumentNoCaption_SalesShptHeader; PurchaseOrderNoLbl)
                    {
                    }
                    column(ExternalDocumentNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    ///// Added Fields from Page <<
                    ///// Captions <<
                    column(No_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("No.")) { }
                    column(SelltoCustomerName_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Customer Name")) { }
                    column(SelltoAddress_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Address")) { }
                    column(SelltoAddress2_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Address 2")) { }
                    column(SelltoCity_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to City")) { }
                    column(SelltoCounty_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to County")) { }
                    column(SelltoPostCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Post Code")) { }
                    column(SelltoCountryRegionCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Country/Region Code")) { }
                    column(SelltoContactNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Contact No.")) { }
                    column(SelltoContact_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Contact")) { }
                    column(NoPrinted_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("No. Printed")) { }
                    column(PostingDate_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Posting Date")) { }
                    column(DocumentDate_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Document Date")) { }
                    column(RequestedDeliveryDate_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Requested Delivery Date")) { }
                    column(PromisedDeliveryDate_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Promised Delivery Date")) { }
                    column(QuoteNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Quote No.")) { }
                    column(OrderNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Order No.")) { }
                    column(ExternalDocumentNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("External Document No.")) { }
                    column(SalespersonCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Salesperson Code")) { }
                    column(ResponsibilityCenter_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Responsibility Center")) { }
                    column(WorkDescription_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Work Description")) { }
                    column(ShiptoCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Code")) { }
                    column(ShiptoName_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Name")) { }
                    column(ShiptoAddress_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Address")) { }
                    column(ShiptoAddress2_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Address 2")) { }
                    column(ShiptoCity_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to City")) { }

                    column(ShiptoCounty_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to County")) { }
                    column(ShiptoPostCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Post Code")) { }
                    column(ShiptoCountryRegionCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Country/Region Code")) { }
                    column(ShiptoContact_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Ship-to Contact")) { }
                    column(LocationCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Location Code")) { }
                    column(OutboundWhseHandlingTime_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Outbound Whse. Handling Time")) { }
                    column(ShippingTime_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shipping Time")) { }

                    column(ShipmentMethodCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shipment Method Code")) { }
                    column(ShippingAgentCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shipping Agent Code")) { }
                    column(ShippingAgentServiceCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shipping Agent Service Code")) { }
                    column(PackageTrackingNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Package Tracking No.")) { }
                    column(ShipmentDate_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shipment Date")) { }
                    column(BilltoCustomerNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Customer No.")) { }
                    column(BilltoName_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Name")) { }
                    column(BilltoAddress_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Address")) { }
                    column(BilltoAddress2_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Address 2")) { }
                    column(BilltoCity_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to City")) { }
                    column(BilltoCounty_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to County")) { }
                    column(BilltoPostCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Post Code")) { }
                    column(BilltoCountryRegionCode_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Country/Region Code")) { }
                    column(BilltoContactNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Contact No.")) { }
                    column(BilltoContact_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Contact")) { }
                    column(ShortcutDimension1Code_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shortcut Dimension 1 Code")) { }
                    column(ShortcutDimension2Code_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Shortcut Dimension 2 Code")) { }

                    ///// Captions >>
                    ///// Values <<
                    // column(No_SalesShptHeader; "Sales Shipment Header"."No.") { }
                    column(SelltoCustomerName_SalesShptHeader; "Sales Shipment Header"."Sell-to Customer Name") { }
                    column(SelltoAddress_SalesShptHeader; "Sales Shipment Header"."Sell-to Address") { }
                    column(SelltoAddress2_SalesShptHeader; "Sales Shipment Header"."Sell-to Address 2") { }
                    column(SelltoCity_SalesShptHeader; "Sales Shipment Header"."Sell-to City") { }
                    column(SelltoCounty_SalesShptHeader; "Sales Shipment Header"."Sell-to County") { }
                    column(SelltoPostCode_SalesShptHeader; "Sales Shipment Header"."Sell-to Post Code") { }
                    column(SelltoCountryRegionCode_SalesShptHeader; "Sales Shipment Header"."Sell-to Country/Region Code") { }
                    column(SelltoContactNo_SalesShptHeader; "Sales Shipment Header"."Sell-to Contact No.") { }
                    column(SelltoContact_SalesShptHeader; "Sales Shipment Header"."Sell-to Contact") { }
                    column(NoPrinted_SalesShptHeader; "Sales Shipment Header"."No. Printed") { }
                    column(PostingDate_SalesShptHeader; "Sales Shipment Header"."Posting Date") { }
                    column(DocumentDate_SalesShptHeader; "Sales Shipment Header"."Document Date") { }
                    column(RequestedDeliveryDate_SalesShptHeader; "Sales Shipment Header"."Requested Delivery Date") { }
                    column(PromisedDeliveryDate_SalesShptHeader; "Sales Shipment Header"."Promised Delivery Date") { }
                    column(QuoteNo_SalesShptHeader; "Sales Shipment Header"."Quote No.") { }
                    // column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.") { }
                    // column(ExternalDocumentNo_SalesShptHeader; "Sales Shipment Header"."External Document No.") { }
                    column(SalespersonCode_SalesShptHeader; "Sales Shipment Header"."Salesperson Code") { }
                    column(ResponsibilityCenter_SalesShptHeader; "Sales Shipment Header"."Responsibility Center") { }
                    column(WorkDescription_SalesShptHeader; "Sales Shipment Header".GetWorkDescription()) { }
                    column(ShiptoCode_SalesShptHeader; "Sales Shipment Header"."Ship-to Code") { }
                    column(ShiptoName_SalesShptHeader; "Sales Shipment Header"."Ship-to Name") { }
                    column(ShiptoAddress_SalesShptHeader; "Sales Shipment Header"."Ship-to Address") { }
                    column(ShiptoAddress2_SalesShptHeader; "Sales Shipment Header"."Ship-to Address 2") { }
                    column(ShiptoCity_SalesShptHeader; "Sales Shipment Header"."Ship-to City") { }

                    column(ShiptoCounty_SalesShptHeader; "Sales Shipment Header"."Ship-to County") { }
                    column(ShiptoPostCode_SalesShptHeader; "Sales Shipment Header"."Ship-to Post Code") { }
                    column(ShiptoCountryRegionCode_SalesShptHeader; "Sales Shipment Header"."Ship-to Country/Region Code") { }
                    column(ShiptoContact_SalesShptHeader; "Sales Shipment Header"."Ship-to Contact") { }
                    column(LocationCode_SalesShptHeader; "Sales Shipment Header"."Location Code") { }
                    column(OutboundWhseHandlingTime_SalesShptHeader; "Sales Shipment Header"."Outbound Whse. Handling Time") { }
                    column(ShippingTime_SalesShptHeader; "Sales Shipment Header"."Shipping Time") { }

                    column(ShipmentMethodCode_SalesShptHeader; "Sales Shipment Header"."Shipment Method Code") { }
                    column(ShippingAgentCode_SalesShptHeader; "Sales Shipment Header"."Shipping Agent Code") { }
                    column(ShippingAgentServiceCode_SalesShptHeader; "Sales Shipment Header"."Shipping Agent Service Code") { }
                    column(PackageTrackingNo_SalesShptHeader; "Sales Shipment Header"."Package Tracking No.") { }
                    column(ShipmentDate_SalesShptHeader; "Sales Shipment Header"."Shipment Date") { }
                    column(BilltoCustomerNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.") { }
                    column(BilltoName_SalesShptHeader; "Sales Shipment Header"."Bill-to Name") { }
                    column(BilltoAddress_SalesShptHeader; "Sales Shipment Header"."Bill-to Address") { }
                    column(BilltoAddress2_SalesShptHeader; "Sales Shipment Header"."Bill-to Address 2") { }
                    column(BilltoCity_SalesShptHeader; "Sales Shipment Header"."Bill-to City") { }
                    column(BilltoCounty_SalesShptHeader; "Sales Shipment Header"."Bill-to County") { }
                    column(BilltoPostCode_SalesShptHeader; "Sales Shipment Header"."Bill-to Post Code") { }
                    column(BilltoCountryRegionCode_SalesShptHeader; "Sales Shipment Header"."Bill-to Country/Region Code") { }
                    column(BilltoContactNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Contact No.") { }
                    column(BilltoContact_SalesShptHeader; "Sales Shipment Header"."Bill-to Contact") { }
                    column(ShortcutDimension1Code_SalesShptHeader; "Sales Shipment Header"."Shortcut Dimension 1 Code") { }
                    column(ShortcutDimension2Code_SalesShptHeader; "Sales Shipment Header"."Shortcut Dimension 2 Code") { }

                    column(NetGrossWeightFactor_ACOAppSetup; ACOAppSetup."Net/Gross Weight Factor") { }
                    ///// Values >>
                    ///// Added Fields from Page >>
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Shipment Line"; "Sales Shipment Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(Description_SalesShptLine; Description)
                        {
                        }
                        column(Description2_SalesShptLine; "Sales Shipment Line"."Description 2")
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(ShowCorrectionLines; ShowCorrectionLines)
                        {
                        }
                        column(Type_SalesShptLine; Format(Type, 0, 2))
                        {
                        }
                        column(AsmHeaderExists; AsmHeaderExists)
                        {
                        }
                        column(DocumentNo_SalesShptLine; "Document No.")
                        {
                        }
                        column(LinNo; LinNo)
                        {
                        }
                        column(Qty_SalesShptLine; Quantity)
                        {
                        }
                        column(UOM_SalesShptLine; "Unit of Measure")
                        {
                        }
                        column(No_SalesShptLine; "No.")
                        {
                        }
                        column(LineNo_SalesShptLine; "Line No.")
                        {
                        }
                        column(Description_SalesShptLineCaption; FieldCaption(Description))
                        {
                        }
                        column(Qty_SalesShptLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesShptLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(No_SalesShptLineCaption; FieldCaption("No."))
                        {
                        }
                        ///// Fields on Subform Page <<
                        ///// Captions <<
                        column(Type_SalesShptLineCaption; "Sales Shipment Line".FieldCaption(Type)) { }
                        // column(FilteredTypeField; FormatType)) { }
                        // column(No_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("No.")) { }
                        column(CrossReferenceNo_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Item Reference No.")) { }
                        column(VariantCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Variant Code")) { }
                        // column(Description_SalesShptLineCaption; "Sales Shipment Line".FieldCaption(Description)) { }
                        column(ReturnReasonCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Return Reason Code")) { }
                        column(LocationCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Location Code")) { }
                        column(BinCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Bin Code")) { }
                        column(Quantity_SalesShptLineCaption; "Sales Shipment Line".FieldCaption(Quantity)) { }
                        column(UnitofMeasureCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Unit of Measure Code")) { }
                        column(UnitofMeasure_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Unit of Measure")) { }
                        column(QuantityInvoiced_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Quantity Invoiced")) { }
                        column(QtyShippedNotInvoiced_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Qty. Shipped Not Invoiced")) { }
                        column(RequestedDeliveryDate_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Requested Delivery Date")) { }
                        column(PromisedDeliveryDate_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Promised Delivery Date")) { }
                        column(PlannedDeliveryDate_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Planned Delivery Date")) { }
                        column(PlannedShipmentDate_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Planned Shipment Date")) { }
                        column(ShipmentDate_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Shipment Date")) { }
                        column(ShippingTime_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Shipping Time")) { }
                        column(JobNo_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Job No.")) { }
                        column(JobTaskNo_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Job Task No.")) { }
                        column(OutboundWhseHandlingTime_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Outbound Whse. Handling Time")) { }
                        column(AppltoItemEntry_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Appl.-to Item Entry")) { }
                        column(Correction_SalesShptLineCaption; "Sales Shipment Line".FieldCaption(Correction)) { }
                        column(ShortcutDimension1Code_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Shortcut Dimension 1 Code")) { }
                        column(ShortcutDimension2Code_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Shortcut Dimension 2 Code")) { }
                        column(ShortcutDimCode3_SalesShptLineCaption; ShortcutDimCode3Dimension.Name) { }
                        column(ShortcutDimCode4_SalesShptLineCaption; ShortcutDimCode4Dimension.Name) { }
                        column(ShortcutDimCode5_SalesShptLineCaption; ShortcutDimCode5Dimension.Name) { }
                        column(ShortcutDimCode6_SalesShptLineCaption; ShortcutDimCode6Dimension.Name) { }
                        column(ShortcutDimCode7_SalesShptLineCaption; ShortcutDimCode7Dimension.Name) { }
                        column(ShortcutDimCode8_SalesShptLineCaption; ShortcutDimCode8Dimension.Name) { }
                        column(ACOProfileCode_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Profile Code")) { }
                        column(ACOProfileDescription_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Profile Description")) { }
                        column(ACOCustomerItemNo_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Customer Item No.")) { }
                        column(ACOProfileCustDescription_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Profile Cust. Description")) { }
                        column(ACONumberofUnits_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Number of Units")) { }
                        column(ACONumberofMeters_ItemVariantCaption; ItemVariant.FieldCaption("ACO Number of Meters")) { }
                        column(Weightpermeter_ACOProfileCaption; ACOProfile.FieldCaption("Weight per meter")) { }
                        column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
                        column(ACOSawing_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Sawing")) { }
                        ///// Captions >>>>>
                        ///// Values <<<<<
                        // column(Type_SalesShptLine; "Sales Shipment Line".Type) { }
                        column(FilteredTypeField; FormatType) { }
                        // column(No_SalesShptLine; "Sales Shipment Line"."No.") { }
                        column(CrossReferenceNo_SalesShptLine; "Sales Shipment Line"."Item Reference No.") { }
                        column(VariantCode_SalesShptLine; "Sales Shipment Line"."Variant Code") { }
                        // column(Description_SalesShptLine; "Sales Shipment Line".Description) { }
                        column(ReturnReasonCode_SalesShptLine; "Sales Shipment Line"."Return Reason Code") { }
                        column(LocationCode_SalesShptLine; "Sales Shipment Line"."Location Code") { }
                        column(BinCode_SalesShptLine; "Sales Shipment Line"."Bin Code") { }
                        column(Quantity_SalesShptLine; "Sales Shipment Line".Quantity) { }
                        column(UnitofMeasureCode_SalesShptLine; "Sales Shipment Line"."Unit of Measure Code") { }
                        column(UnitofMeasure_SalesShptLine; "Sales Shipment Line"."Unit of Measure") { }
                        column(QuantityInvoiced_SalesShptLine; "Sales Shipment Line"."Quantity Invoiced") { }
                        column(QtyShippedNotInvoiced_SalesShptLine; "Sales Shipment Line"."Qty. Shipped Not Invoiced") { }
                        column(RequestedDeliveryDate_SalesShptLine; "Sales Shipment Line"."Requested Delivery Date") { }
                        column(PromisedDeliveryDate_SalesShptLine; "Sales Shipment Line"."Promised Delivery Date") { }
                        column(PlannedDeliveryDate_SalesShptLine; "Sales Shipment Line"."Planned Delivery Date") { }
                        column(PlannedShipmentDate_SalesShptLine; "Sales Shipment Line"."Planned Shipment Date") { }
                        column(ShipmentDate_SalesShptLine; "Sales Shipment Line"."Shipment Date") { }
                        column(ShippingTime_SalesShptLine; "Sales Shipment Line"."Shipping Time") { }
                        column(JobNo_SalesShptLine; "Sales Shipment Line"."Job No.") { }
                        column(JobTaskNo_SalesShptLine; "Sales Shipment Line"."Job Task No.") { }
                        column(OutboundWhseHandlingTime_SalesShptLine; "Sales Shipment Line"."Outbound Whse. Handling Time") { }
                        column(AppltoItemEntry_SalesShptLine; "Sales Shipment Line"."Appl.-to Item Entry") { }
                        column(Correction_SalesShptLine; "Sales Shipment Line".Correction) { }
                        column(ShortcutDimension1Code_SalesShptLine; "Sales Shipment Line"."Shortcut Dimension 1 Code") { }
                        column(ShortcutDimension2Code_SalesShptLine; "Sales Shipment Line"."Shortcut Dimension 2 Code") { }
                        column(ShortcutDimCode3_SalesShptLine; ShortcutDimCode[3]) { }
                        column(ShortcutDimCode4_SalesShptLine; ShortcutDimCode[4]) { }
                        column(ShortcutDimCode5_SalesShptLine; ShortcutDimCode[5]) { }
                        column(ShortcutDimCode6_SalesShptLine; ShortcutDimCode[6]) { }
                        column(ShortcutDimCode7_SalesShptLine; ShortcutDimCode[7]) { }
                        column(ShortcutDimCode8_SalesShptLine; ShortcutDimCode[8]) { }
                        column(ACOProfileCode_SalesShptLine; "Sales Shipment Line"."ACO Profile Code") { }
                        column(ACOProfileDescription_SalesShptLine; "Sales Shipment Line"."ACO Profile Description") { }
                        column(ACOCustomerItemNo_SalesShptLine; "Sales Shipment Line"."ACO Customer Item No.") { }
                        column(ACOProfileCustDescription_SalesShptLine; "Sales Shipment Line"."ACO Profile Cust. Description") { }
                        column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                        column(Weightpermeter_ACOProfile; ACOProfile."Weight per meter") { }
                        column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                        column(ACOSawing_SalesShptLine; "Sales Shipment Line"."ACO Sawing") { }
                        ///// Values >>
                        ///// Fields on Subform Page >>
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();
                            end;
                        }
                        dataitem(DisplayAsmInfo; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(PostedAsmLineItemNo; BlanksForIndent + PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; BlanksForIndent + PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; GetUnitOfMeasureDescr(PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                ItemTranslation: Record "Item Translation";
                            begin
                                if Number = 1 then
                                    PostedAsmLine.FindSet
                                else
                                    PostedAsmLine.Next;

                                if ItemTranslation.Get(PostedAsmLine."No.",
                                     PostedAsmLine."Variant Code",
                                     "Sales Shipment Header"."Language Code")
                                then
                                    PostedAsmLine.Description := ItemTranslation.Description;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not AsmHeaderExists then
                                    CurrReport.Break();

                                PostedAsmLine.SetRange("Document No.", PostedAsmHeader."No.");
                                SetRange(Number, 1, PostedAsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            LinNo := "Line No.";
                            if not ShowCorrectionLines and Correction then
                                CurrReport.Skip();

                            DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                            if DisplayAssemblyInformation then
                                AsmHeaderExists := AsmToShipmentExists(PostedAsmHeader);

                            if not ItemVariant.Get("No.", "Variant Code") then
                                Clear(ItemVariant);

                            if not ACOProfile.Get("ACO Profile Code") then
                                Clear(ACOProfile);
                        end;

                        trigger OnPostDataItem()
                        begin
                            if ShowLotSN then begin
                                ItemTrackingDocMgt.SetRetrieveAsmItemTracking(true);
                                TrackingSpecCount :=
                                  ItemTrackingDocMgt.RetrieveDocumentItemTracking(TrackingSpecBuffer,
                                    "Sales Shipment Header"."No.", DATABASE::"Sales Shipment Header", 0);
                                ItemTrackingDocMgt.SetRetrieveAsmItemTracking(false);
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(BilltoCustNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.")
                        {
                        }
                        column(CustAddr1; CustAddr[1])
                        {
                        }
                        column(CustAddr2; CustAddr[2])
                        {
                        }
                        column(CustAddr3; CustAddr[3])
                        {
                        }
                        column(CustAddr4; CustAddr[4])
                        {
                        }
                        column(CustAddr5; CustAddr[5])
                        {
                        }
                        column(CustAddr6; CustAddr[6])
                        {
                        }
                        column(CustAddr7; CustAddr[7])
                        {
                        }
                        column(CustAddr8; CustAddr[8])
                        {
                        }
                        column(BilltoAddressCaption; BilltoAddressCaptionLbl)
                        {
                        }
                        column(BilltoCustNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowCustAddr then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(ItemTrackingLine; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(TrackingSpecBufferNo; TrackingSpecBuffer."Item No.")
                        {
                        }
                        column(TrackingSpecBufferDesc; TrackingSpecBuffer.Description)
                        {
                        }
                        column(TrackingSpecBufferLotNo; TrackingSpecBuffer."Lot No.")
                        {
                        }
                        column(TrackingSpecBufferSerNo; TrackingSpecBuffer."Serial No.")
                        {
                        }
                        column(TrackingSpecBufferQty; TrackingSpecBuffer."Quantity (Base)")
                        {
                        }
                        column(ShowTotal; ShowTotal)
                        {
                        }
                        column(ShowGroup; ShowGroup)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(SerialNoCaption; SerialNoCaptionLbl)
                        {
                        }
                        column(LotNoCaption; LotNoCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(NoCaption; NoCaptionLbl)
                        {
                        }
                        dataitem(TotalItemTracking; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                            column(Quantity1; TotalQty)
                            {
                            }
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TrackingSpecBuffer.FindSet
                            else
                                TrackingSpecBuffer.Next;

                            if not ShowCorrectionLines and TrackingSpecBuffer.Correction then
                                CurrReport.Skip();
                            if TrackingSpecBuffer.Correction then
                                TrackingSpecBuffer."Quantity (Base)" := -TrackingSpecBuffer."Quantity (Base)";

                            ShowTotal := false;
                            if ItemTrackingAppendix.IsStartNewGroup(TrackingSpecBuffer) then
                                ShowTotal := true;

                            ShowGroup := false;
                            if (TrackingSpecBuffer."Source Ref. No." <> OldRefNo) or
                               (TrackingSpecBuffer."Item No." <> OldNo)
                            then begin
                                OldRefNo := TrackingSpecBuffer."Source Ref. No.";
                                OldNo := TrackingSpecBuffer."Item No.";
                                TotalQty := 0;
                            end else
                                ShowGroup := true;
                            TotalQty += TrackingSpecBuffer."Quantity (Base)";
                        end;

                        trigger OnPreDataItem()
                        begin
                            if TrackingSpecCount = 0 then
                                CurrReport.Break();
                            SetRange(Number, 1, TrackingSpecCount);
                            TrackingSpecBuffer.SetCurrentKey("Source ID", "Source Type", "Source Subtype", "Source Batch Name",
                              "Source Prod. Order Line", "Source Ref. No.");
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        // Item Tracking:
                        if ShowLotSN then begin
                            TrackingSpecCount := 0;
                            OldRefNo := 0;
                            ShowGroup := false;
                        end;
                    end;
                }

                dataitem("ACO Package Header"; "ACO Package Header")
                {
                    DataItemLink = "Sales Shipment No." = field("No.");
                    DataItemLinkReference = "Sales Shipment Header";
                    column(No_; "No.")
                    {

                    }
                    column(Rack_No__Customer; "Rack No. Customer")
                    {

                    }
                    column(Remark; Remark)
                    {

                    }

                    column(Reject; Reject)
                    {

                    }
                    dataitem("ACO Package Line"; "ACO Package Line")
                    {
                        DataItemLink = "Package No." = field("No.");
                        DataItemLinkReference = "ACO Package Header";
                        column(Profile_no_; "Profile no.")
                        {

                        }
                        column(Quantity; Quantity)
                        {

                        }
                        column(Length; Length)
                        {

                        }
                        column(Your_Reference; "Your Reference")
                        {

                        }
                        column(NetWeight; NetWeight)
                        {

                        }
                        column(GrossWeight; GrossWeight)
                        {

                        }

                        column(Reject_Reason_Code; "Reject Reason Code")
                        {

                        }
                        column(Description_RejectReasonCode; RejectReasonCode.Description)
                        {

                        }
                        trigger OnAfterGetRecord()
                        var
                            ACOProfile: Record "ACO Profile";
                        begin
                            if ACOProfile.Get("ACO Package Line"."Profile no.") then begin
                                NetWeight := "ACO Package Line".Quantity * ACOProfile."Weight per meter" * ("ACO Package Line".Length / 1000);
                                GrossWeight := NetWeight * ACOAppSetup."Net/Gross Weight Factor";
                            end else begin
                                NetWeight := 0;
                                GrossWeight := 0;
                            end;
                            if not RejectReasonCode.Get("ACO Package Line"."Reject Reason Code") then
                                Clear(RejectReasonCode);
                        end;
                    }
                }


                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                    TotalQty := 0;           // Item Tracking
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales Shpt.-Printed", "Sales Shipment Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := 1 + Abs(NoOfCopies);
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Shipment Header");
                FormatDocumentFields("Sales Shipment Header");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Shipment Header");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if the document shows internal information.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the reports that you print as interactions.';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(ShowLotSN; ShowLotSN)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Serial/Lot Number Appendix';
                        ToolTip = 'Specifies if you want to print an appendix to the sales shipment report showing the lot and serial numbers in the shipment.';
                    }
                    field(DisplayAsmInfo; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
        if not ShortcutDimCode3Dimension.Get(GLSetup."Shortcut Dimension 3 Code") then Clear(ShortcutDimCode3Dimension);
        if not ShortcutDimCode4Dimension.Get(GLSetup."Shortcut Dimension 4 Code") then Clear(ShortcutDimCode4Dimension);
        if not ShortcutDimCode5Dimension.Get(GLSetup."Shortcut Dimension 5 Code") then Clear(ShortcutDimCode5Dimension);
        if not ShortcutDimCode6Dimension.Get(GLSetup."Shortcut Dimension 6 Code") then Clear(ShortcutDimCode6Dimension);
        if not ShortcutDimCode7Dimension.Get(GLSetup."Shortcut Dimension 7 Code") then Clear(ShortcutDimCode7Dimension);
        if not ShortcutDimCode8Dimension.Get(GLSetup."Shortcut Dimension 8 Code") then Clear(ShortcutDimCode8Dimension);
        CompanyInfo.Get();
        SalesSetup.Get();
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
        ACOAppSetup.Get();
        OnAfterInitReport();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Shipment Header".FindSet then
                repeat
                    SegManagement.LogDocument(
                      5, "Sales Shipment Header"."No.", 0, 0, DATABASE::Customer, "Sales Shipment Header"."Sell-to Customer No.",
                      "Sales Shipment Header"."Salesperson Code", "Sales Shipment Header"."Campaign No.",
                      "Sales Shipment Header"."Posting Description", '');
                until "Sales Shipment Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
        AsmHeaderExists := false;
    end;

    var
        Text002: Label 'Sales - Shipment %1', Comment = '%1 = Document No.';
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        TrackingSpecBuffer: Record "Tracking Specification" temporary;
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        RespCenter: Record "Responsibility Center";
        GLSetup: Record "General Ledger Setup";
        ShortcutDimCode3Dimension: Record Dimension;
        ShortcutDimCode4Dimension: Record Dimension;
        ShortcutDimCode5Dimension: Record Dimension;
        ShortcutDimCode6Dimension: Record Dimension;
        ShortcutDimCode7Dimension: Record Dimension;
        ShortcutDimCode8Dimension: Record Dimension;
        ItemVariant: Record "Item Variant";
        ItemTrackingAppendix: Report "Item Tracking Appendix";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        RejectReasonCode: Record "Reason Code";
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[20];
        ReferenceText: Text[80];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        OutputNo: Integer;
        NoOfLoops: Integer;
        TrackingSpecCount: Integer;
        OldRefNo: Integer;
        OldNo: Code[20];
        CopyText: Text[30];
        ShowCustAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShortcutDimCode: array[8] of Code[20];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        ShowLotSN: Boolean;
        ShowTotal: Boolean;
        ShowGroup: Boolean;
        TotalQty: Decimal;
        [InDataSet]
        NetWeight: Decimal;
        GrossWeight: Decimal;
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmHeaderExists: Boolean;
        LinNo: Integer;
        ItemTrackingAppendixCaptionLbl: Label 'Item Tracking - Appendix';
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Reg. No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        ShipmentNoCaptionLbl: Label 'Shipment No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        DocumentDateCaptionLbl: Label 'Document Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        BilltoAddressCaptionLbl: Label 'Bill-to Address';
        QuantityCaptionLbl: Label 'Quantity';
        SerialNoCaptionLbl: Label 'Serial No.';
        LotNoCaptionLbl: Label 'Lot No.';
        DescriptionCaptionLbl: Label 'Description';
        NoCaptionLbl: Label 'No.';
        PageCaptionCap: Label 'Page %1 of %2';
        OurDocumentNoLbl: Label 'Our Document No.';
        PurchaseOrderNoLbl: Label 'Purchase Order No.';

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(5) <> '';
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        ShowCorrectionLines := NewShowCorrectionLines;
        ShowLotSN := NewShowLotSN;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatAddr.GetCompanyAddr(SalesShipmentHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesShptShipTo(ShipToAddr, SalesShipmentHeader);
        ShowCustAddr := FormatAddr.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
    end;

    local procedure FormatDocumentFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatDocument.SetSalesPerson(SalesPurchPerson, SalesShipmentHeader."Salesperson Code", SalesPersonText);
        ReferenceText := FormatDocument.SetText(SalesShipmentHeader."Your Reference" <> '', SalesShipmentHeader.FieldCaption("Your Reference"));
    end;

    local procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;
}

