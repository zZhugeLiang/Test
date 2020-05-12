report 50009 "ACO Order Confirmation"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './OrderConfirmation.rdlc';
    Caption = 'Order Confirmation';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Order';
            column(DocType_SalesHeader; "Document Type")
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
            {
            }
            column(PhoneNoCaption; PhoneNoCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmtCaption; VATAmtCaptionLbl)
            {
            }
            column(VATAmtSpecCaption; VATAmtSpecCaptionLbl)
            {
            }
            column(LineAmtCaption; LineAmtCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(UnitPriceCaption; UnitPriceCaptionLbl)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(AllowInvDiscCaption; AllowInvDiscCaptionLbl)
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
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(OrderConfirmCopyCaption; StrSubstNo(Text004, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhNo; CompanyInfo."Phone No.")
                    {
                        IncludeCaption = false;
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocDate_SalesHeader; Format("Sales Header"."Document Date"))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(ShptDate_SalesHeader; Format("Sales Header"."Shipment Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; "Sales Header".FieldCaption("External Document No."))
                    {
                    }
                    column(SalesOrderReference_SalesHeader; "Sales Header"."External Document No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PricesInclVAT_SalesHeader; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PmntTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShptMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(PricesInclVATYesNo_SalesHeader; Format("Sales Header"."Prices Including VAT"))
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankCaption; BankCaptionLbl)
                    {
                    }
                    column(AccountNoCaption; AccountNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(OrderNoCaption; OrderNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesHeaderCaption; "Sales Header".FieldCaption("Prices Including VAT"))
                    {
                    }

                    ///// Added Fields from Page <<
                    ///// Caption <<
                    // column(No_SalesHeaderCaption; "Sales Header".FieldCaption("No.")) { }
                    column(SelltoCustomerNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Customer No.")) { }
                    column(SelltoCustomerName_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Customer Name")) { }
                    column(QuoteNo_SalesHeaderCaption; "Sales Header".FieldCaption("Quote No.")) { }
                    column(PostingDescription_SalesHeaderCaption; "Sales Header".FieldCaption("Posting Description")) { }
                    column(SelltoAddress_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Address")) { }
                    column(SelltoAddress2_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Address 2")) { }
                    column(SelltoCity_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to City")) { }
                    column(SelltoCounty_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to County")) { }
                    column(SelltoPostCode_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Post Code")) { }
                    column(SelltoCountryRegionCode_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Country/Region Code")) { }
                    column(SelltoContactNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Contact No.")) { }
                    column(SelltoPhoneNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Phone No.")) { }
                    column(SelltoEMail_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to E-Mail")) { }
                    column(SelltoContact_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Contact")) { }
                    column(No_ofArchivedVersions_SalesHeaderCaption; "Sales Header".FieldCaption("No. of Archived Versions")) { }
                    column(DocumentDate_SalesHeaderCaption; "Sales Header".FieldCaption("Document Date")) { }
                    column(PostingDate_SalesHeaderCaption; "Sales Header".FieldCaption("Posting Date")) { }
                    column(OrderDate_SalesHeaderCaption; "Sales Header".FieldCaption("Order Date")) { }
                    column(DueDate_SalesHeaderCaption; "Sales Header".FieldCaption("Due Date")) { }
                    column(RequestedDeliveryDate_SalesHeaderCaption; "Sales Header".FieldCaption("Requested Delivery Date")) { }
                    column(PromisedDeliveryDate_SalesHeaderCaption; "Sales Header".FieldCaption("Promised Delivery Date")) { }
                    column(ExternalDocumentNo_SalesHeaderCaption; "Sales Header".FieldCaption("External Document No.")) { }
                    column(YourReference_SalesHeaderCaption; "Sales Header".FieldCaption("Your Reference")) { }
                    column(SalespersonCode_SalesHeaderCaption; "Sales Header".FieldCaption("Salesperson Code")) { }
                    column(CampaignNo_SalesHeaderCaption; "Sales Header".FieldCaption("Campaign No.")) { }
                    column(OpportunityNo_SalesHeaderCaption; "Sales Header".FieldCaption("Opportunity No.")) { }
                    column(ResponsibilityCenter_SalesHeaderCaption; "Sales Header".FieldCaption("Responsibility Center")) { }
                    column(AssignedUserID_SalesHeaderCaption; "Sales Header".FieldCaption("Assigned User ID")) { }
                    column(JobQueueStatus_SalesHeaderCaption; "Sales Header".FieldCaption("Job Queue Status")) { }
                    column(Status_SalesHeaderCaption; "Sales Header".FieldCaption(Status)) { }
                    column(WorkDescription_SalesHeaderCaption; "Sales Header".FieldCaption("Work Description")) { }
                    column(CurrencyCode_SalesHeaderCaption; "Sales Header".FieldCaption("Currency Code")) { }
                    column(PricesIncludingVAT_SalesHeaderCaption; "Sales Header".FieldCaption("Prices Including VAT")) { }
                    column(VATBus_PostingGroup_SalesHeaderCaption; "Sales Header".FieldCaption("VAT Bus. Posting Group")) { }
                    column(TransactionModeCode_SalesHeaderCaption; "Sales Header".FieldCaption("Transaction Mode Code")) { }
                    column(BankAccountCode_SalesHeaderCaption; "Sales Header".FieldCaption("Bank Account Code")) { }
                    column(PaymentTermsCode_SalesHeaderCaption; "Sales Header".FieldCaption("Payment Terms Code")) { }
                    column(EU3PartyTrade_SalesHeaderCaption; "Sales Header".FieldCaption("EU 3-Party Trade")) { }
                    column(ShortcutDimension1Code_SalesHeaderCaption; "Sales Header".FieldCaption("Shortcut Dimension 1 Code")) { }
                    column(ShortcutDimension2Code_SalesHeaderCaption; "Sales Header".FieldCaption("Shortcut Dimension 2 Code")) { }
                    column(PaymentDiscountPercentage_SalesHeaderCaption; "Sales Header".FieldCaption("Payment Discount %")) { }
                    column(Pmt_DiscountDate_SalesHeaderCaption; "Sales Header".FieldCaption("Pmt. Discount Date")) { }
                    column(DirectDebitMandateID_SalesHeaderCaption; "Sales Header".FieldCaption("Direct Debit Mandate ID")) { }
                    // Groups
                    column(ShiptoCode_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Code")) { }
                    column(ShiptoName_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Name")) { }
                    column(ShiptoAddress_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Address")) { }
                    column(ShiptoAddress2_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Address 2")) { }
                    column(ShiptoCity_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to City")) { }
                    column(ShiptoCounty_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to County")) { }
                    column(ShiptoPostCode_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Post Code")) { }
                    column(ShiptoCountryRegionCode_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Country/Region Code")) { }
                    column(ShiptoContact_SalesHeaderCaption; "Sales Header".FieldCaption("Ship-to Contact")) { }
                    column(ShipmentMethodCode_SalesHeaderCaption; "Sales Header".FieldCaption("Shipment Method Code")) { }
                    column(ShippingAgentCode_SalesHeaderCaption; "Sales Header".FieldCaption("Shipping Agent Code")) { }
                    column(ShippingAgentServiceCode_SalesHeaderCaption; "Sales Header".FieldCaption("Shipping Agent Service Code")) { }
                    column(PackageTrackingNo_SalesHeaderCaption; "Sales Header".FieldCaption("Package Tracking No.")) { }
                    // column(BillToOptions; "Sales Header".FieldCaption(BillToOptions)) { }
                    column(BilltoName_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Name")) { }
                    column(BilltoAddress_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Address")) { }
                    column(BilltoAddress2_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Address 2")) { }
                    column(BilltoCity_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to City")) { }
                    column(BilltoCounty_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to County")) { }
                    column(BilltoPostCode_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Post Code")) { }
                    column(BilltoCountryRegionCode_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Country/Region Code")) { }
                    column(BilltoContactNo_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Contact No.")) { }
                    column(BilltoContact_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Contact")) { }
                    column(LocationCode_SalesHeaderCaption; "Sales Header".FieldCaption("Location Code")) { }
                    column(ShipmentDate_SalesHeaderCaption; "Sales Header".FieldCaption("Shipment Date")) { }
                    column(ShippingAdvice_SalesHeaderCaption; "Sales Header".FieldCaption("Shipping Advice")) { }
                    column(OutboundWhse_HandlingTime_SalesHeaderCaption; "Sales Header".FieldCaption("Outbound Whse. Handling Time")) { }
                    column(ShippingTime_SalesHeaderCaption; "Sales Header".FieldCaption("Shipping Time")) { }
                    column(LateOrderShipping_SalesHeaderCaption; "Sales Header".FieldCaption("Late Order Shipping")) { }
                    column(CombineShipments_SalesHeaderCaption; "Sales Header".FieldCaption("Combine Shipments")) { }
                    column(TransactionSpecification_SalesHeaderCaption; "Sales Header".FieldCaption("Transaction Specification")) { }
                    column(TransactionType_SalesHeaderCaption; "Sales Header".FieldCaption("Transaction Type")) { }
                    column(TransportMethod_SalesHeaderCaption; "Sales Header".FieldCaption("Transport Method")) { }
                    column(ExitPoint_SalesHeaderCaption; "Sales Header".FieldCaption("Exit Point")) { }
                    column(Area_SalesHeaderCaption; "Sales Header".FieldCaption(Area)) { }
                    column(PrepaymentPercentage_SalesHeaderCaption; "Sales Header".FieldCaption("Prepayment %")) { }
                    column(CompressPrepayment_SalesHeaderCaption; "Sales Header".FieldCaption("Compress Prepayment")) { }
                    column(Prepmt_PaymentTermsCode_SalesHeaderCaption; "Sales Header".FieldCaption("Prepmt. Payment Terms Code")) { }
                    column(PrepaymentDueDate_SalesHeaderCaption; "Sales Header".FieldCaption("Prepayment Due Date")) { }
                    column(Prepmt_PaymentDiscountPercentage_SalesHeaderCaption; "Sales Header".FieldCaption("Prepmt. Payment Discount %")) { }
                    column(Prepmt_Pmt_DiscountDate_SalesHeaderCaption; "Sales Header".FieldCaption("Prepmt. Pmt. Discount Date")) { }
                    column(ACOWeekCapacity_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Week Capacity")) { }
                    column(ACOLargeLine_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Large Line")) { }
                    column(ACOQuantityCharges_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Quantity Charges")) { }
                    column(ACOLoggedIn_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Logged In")) { }
                    column(ACOLoggedInDay_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Logged In Day")) { }
                    column(ACOLoggedInWeek_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Logged In Week")) { }
                    column(ACOLoggedInYear_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Logged In Year")) { }
                    column(ACOCustomerComment_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Customer Comment")) { }
                    column(ACODocumentDateDay_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Document Date Day")) { }
                    column(ACODocumentDateWeek_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Document Date Week")) { }
                    column(ACOocumentDateYear_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Document Date Year")) { }
                    column(ACOSupplier_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Supplier")) { }
                    column(ACOOwnShippingAgent_SalesHeaderCaption; "Sales Header".FieldCaption("ACO Own Shipping Agent")) { }
                    ///// Captions >>
                    ///// Values <<
                    // column(No_SalesHeader; "Sales Header"."No.") { }
                    column(SelltoCustomerNo_SalesHeader; "Sales Header"."Sell-to Customer No.") { }
                    column(SelltoCustomerName_SalesHeader; "Sales Header"."Sell-to Customer Name") { }
                    column(QuoteNo_SalesHeader; "Sales Header"."Quote No.") { }
                    column(PostingDescription_SalesHeader; "Sales Header"."Posting Description") { }
                    column(SelltoAddress_SalesHeader; "Sales Header"."Sell-to Address") { }
                    column(SelltoAddress2_SalesHeader; "Sales Header"."Sell-to Address 2") { }
                    column(SelltoCity_SalesHeader; "Sales Header"."Sell-to City") { }
                    column(SelltoCounty_SalesHeader; "Sales Header"."Sell-to County") { }
                    column(SelltoPostCode_SalesHeader; "Sales Header"."Sell-to Post Code") { }
                    column(SelltoCountryRegionCode_SalesHeader; "Sales Header"."Sell-to Country/Region Code") { }
                    column(SelltoContactNo_SalesHeader; "Sales Header"."Sell-to Contact No.") { }
                    column(SelltoPhoneNo_SalesHeader; "Sales Header"."Sell-to Phone No.") { }
                    column(SelltoEMail_SalesHeader; "Sales Header"."Sell-to E-Mail") { }
                    column(SelltoContact_SalesHeader; "Sales Header"."Sell-to Contact") { }
                    column(No_ofArchivedVersions_SalesHeader; "Sales Header"."No. of Archived Versions") { }
                    column(DocumentDate_SalesHeader; "Sales Header"."Document Date") { }
                    column(PostingDate_SalesHeader; "Sales Header"."Posting Date") { }
                    column(OrderDate_SalesHeader; "Sales Header"."Order Date") { }
                    column(DueDate_SalesHeader; "Sales Header"."Due Date") { }
                    column(RequestedDeliveryDate_SalesHeader; "Sales Header"."Requested Delivery Date") { }
                    column(PromisedDeliveryDate_SalesHeader; "Sales Header"."Promised Delivery Date") { }
                    column(ExternalDocumentNo_SalesHeader; "Sales Header"."External Document No.") { }
                    column(YourReference_SalesHeader; "Sales Header"."Your Reference") { }
                    column(SalespersonCode_SalesHeader; "Sales Header"."Salesperson Code") { }
                    column(CampaignNo_SalesHeader; "Sales Header"."Campaign No.") { }
                    column(OpportunityNo_SalesHeader; "Sales Header"."Opportunity No.") { }
                    column(ResponsibilityCenter_SalesHeader; "Sales Header"."Responsibility Center") { }
                    column(AssignedUserID_SalesHeader; "Sales Header"."Assigned User ID") { }
                    column(JobQueueStatus_SalesHeader; "Sales Header"."Job Queue Status") { }
                    column(Status_SalesHeader; "Sales Header".Status) { }
                    column(WorkDescription_SalesHeader; "Sales Header"."Work Description") { }
                    column(CurrencyCode_SalesHeader; "Sales Header"."Currency Code") { }
                    column(PricesIncludingVAT_SalesHeader; "Sales Header"."Prices Including VAT") { }
                    column(VATBus_PostingGroup_SalesHeader; "Sales Header"."VAT Bus. Posting Group") { }
                    column(TransactionModeCode_SalesHeader; "Sales Header"."Transaction Mode Code") { }
                    column(BankAccountCode_SalesHeader; "Sales Header"."Bank Account Code") { }
                    column(PaymentTermsCode_SalesHeader; "Sales Header"."Payment Terms Code") { }
                    column(EU3PartyTrade_SalesHeader; "Sales Header"."EU 3-Party Trade") { }
                    column(SelectedPayments; "Sales Header".GetSelectedPaymentServicesText()) { }
                    column(ShortcutDimension1Code_SalesHeader; "Sales Header"."Shortcut Dimension 1 Code") { }
                    column(ShortcutDimension2Code_SalesHeader; "Sales Header"."Shortcut Dimension 2 Code") { }
                    column(PaymentDiscountPercentage_SalesHeader; "Sales Header"."Payment Discount %") { }
                    column(Pmt_DiscountDate_SalesHeader; "Sales Header"."Pmt. Discount Date") { }
                    column(DirectDebitMandateID_SalesHeader; "Sales Header"."Direct Debit Mandate ID") { }

                    // Groups
                    column(ShiptoCode_SalesHeader; "Sales Header"."Ship-to Code") { }
                    column(ShiptoName_SalesHeader; "Sales Header"."Ship-to Name") { }
                    column(ShiptoAddress_SalesHeader; "Sales Header"."Ship-to Address") { }
                    column(ShiptoAddress2_SalesHeader; "Sales Header"."Ship-to Address 2") { }
                    column(ShiptoCity_SalesHeader; "Sales Header"."Ship-to City") { }
                    column(ShiptoCounty_SalesHeader; "Sales Header"."Ship-to County") { }
                    column(ShiptoPostCode_SalesHeader; "Sales Header"."Ship-to Post Code") { }
                    column(ShiptoCountryRegionCode_SalesHeader; "Sales Header"."Ship-to Country/Region Code") { }
                    column(ShiptoContact_SalesHeader; "Sales Header"."Ship-to Contact") { }
                    column(ShipmentMethodCode_SalesHeader; "Sales Header"."Shipment Method Code") { }
                    column(ShippingAgentCode_SalesHeader; "Sales Header"."Shipping Agent Code") { }
                    column(ShippingAgentServiceCode_SalesHeader; "Sales Header"."Shipping Agent Service Code") { }
                    column(PackageTrackingNo_SalesHeader; "Sales Header"."Package Tracking No.") { }
                    // column(BillToOptions; "Sales Header".BillToOptions) { }
                    column(BilltoName_SalesHeader; "Sales Header"."Bill-to Name") { }
                    column(BilltoAddress_SalesHeader; "Sales Header"."Bill-to Address") { }
                    column(BilltoAddress2_SalesHeader; "Sales Header"."Bill-to Address 2") { }
                    column(BilltoCity_SalesHeader; "Sales Header"."Bill-to City") { }
                    column(BilltoCounty_SalesHeader; "Sales Header"."Bill-to County") { }
                    column(BilltoPostCode_SalesHeader; "Sales Header"."Bill-to Post Code") { }
                    column(BilltoCountryRegionCode_SalesHeader; "Sales Header"."Bill-to Country/Region Code") { }
                    column(BilltoContactNo_SalesHeader; "Sales Header"."Bill-to Contact No.") { }
                    column(BilltoContact_SalesHeader; "Sales Header"."Bill-to Contact") { }
                    column(LocationCode_SalesHeader; "Sales Header"."Location Code") { }
                    column(ShipmentDate_SalesHeader; "Sales Header"."Shipment Date") { }
                    column(ShippingAdvice_SalesHeader; "Sales Header"."Shipping Advice") { }
                    column(OutboundWhse_HandlingTime_SalesHeader; "Sales Header"."Outbound Whse. Handling Time") { }
                    column(ShippingTime_SalesHeader; "Sales Header"."Shipping Time") { }
                    column(LateOrderShipping_SalesHeader; "Sales Header"."Late Order Shipping") { }
                    column(CombineShipments_SalesHeader; "Sales Header"."Combine Shipments") { }
                    column(TransactionSpecification_SalesHeader; "Sales Header"."Transaction Specification") { }
                    column(TransactionType_SalesHeader; "Sales Header"."Transaction Type") { }
                    column(TransportMethod_SalesHeader; "Sales Header"."Transport Method") { }
                    column(ExitPoint_SalesHeader; "Sales Header"."Exit Point") { }
                    column(Area_SalesHeader; "Sales Header".Area) { }
                    column(PrepaymentPercentage_SalesHeader; "Sales Header"."Prepayment %") { }
                    column(CompressPrepayment_SalesHeader; "Sales Header"."Compress Prepayment") { }
                    column(Prepmt_PaymentTermsCode_SalesHeader; "Sales Header"."Prepmt. Payment Terms Code") { }
                    column(PrepaymentDueDate_SalesHeader; "Sales Header"."Prepayment Due Date") { }
                    column(Prepmt_PaymentDiscountPercentage_SalesHeader; "Sales Header"."Prepmt. Payment Discount %") { }
                    column(Prepmt_Pmt_DiscountDate_SalesHeader; "Sales Header"."Prepmt. Pmt. Discount Date") { }
                    column(ACOWeekCapacity_SalesHeader; "Sales Header"."ACO Week Capacity") { }
                    column(ACOLargeLine_SalesHeader; "Sales Header"."ACO Large Line") { }
                    column(ACOQuantityCharges_SalesHeader; "Sales Header"."ACO Quantity Charges") { }
                    column(ACOLoggedIn_SalesHeader; "Sales Header"."ACO Logged In") { }
                    column(ACOLoggedInDay_SalesHeader; "Sales Header"."ACO Logged In Day") { }
                    column(ACOLoggedInWeek_SalesHeader; "Sales Header"."ACO Logged In Week") { }
                    column(ACOLoggedInYear_SalesHeader; "Sales Header"."ACO Logged In Year") { }
                    column(ACOCustomerComment_SalesHeader; "Sales Header"."ACO Customer Comment") { }
                    column(ACODocumentDateDay_SalesHeader; "Sales Header"."ACO Document Date Day") { }
                    column(ACODocumentDateWeek_SalesHeader; "Sales Header"."ACO Document Date Week") { }
                    column(ACOocumentDateYear_SalesHeader; "Sales Header"."ACO Document Date Year") { }
                    column(ACOSupplier_SalesHeader; "Sales Header"."ACO Supplier") { }
                    column(ACOOwnShippingAgent_SalesHeader; "Sales Header"."ACO Own Shipping Agent") { }
                    ///// Values >>
                    ///// Added Fields from Page >>
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
                        {
                        }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.Find('-') then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
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
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break;
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesLineAmt; SalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesLine; "Sales Line".Description)
                        {
                        }
                        column(NNCSalesLineLineAmt; NNCSalesLineLineAmt)
                        {
                        }
                        column(NNCSalesLineInvDiscAmt; NNCSalesLineInvDiscAmt)
                        {
                        }
                        column(NNCTotalLCY; NNCTotalLCY)
                        {
                        }
                        column(NNCTotalExclVAT; NNCTotalExclVAT)
                        {
                        }
                        column(NNCVATAmt; NNCVATAmt)
                        {
                        }
                        column(NNCTotalInclVAT; NNCTotalInclVAT)
                        {
                        }
                        column(NNCPmtDiscOnVAT; NNCPmtDiscOnVAT)
                        {
                        }
                        column(NNCTotalInclVAT2; NNCTotalInclVAT2)
                        {
                        }
                        column(NNCVATAmt2; NNCVATAmt2)
                        {
                        }
                        column(NNCTotalExclVAT2; NNCTotalExclVAT2)
                        {
                        }
                        column(VATBaseDisc_SalesHeader; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(DisplayAssemblyInfo; DisplayAssemblyInformation)
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        // Sales Line Fields
                        column(No2_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(Qty_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(UOM_SalesLine; "Sales Line"."Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;
                            IncludeCaption = false;
                        }
                        column(LineDisc_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(LineAmt_SalesLine; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AllowInvDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(Type_SalesLine; Format("Sales Line".Type))
                        {
                        }
                        column(No_SalesLine; "Sales Line"."Line No.")
                        {
                        }
                        column(AllowInvDiscountYesNo_SalesLine; Format("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(AsmInfoExistsForLine; AsmInfoExistsForLine)
                        {
                        }
                        column(SalesLineInvDiscAmt; SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalsLinAmtExclLineDiscAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(VATAmtLineVATAmtText3; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineAmtExclLineDisc; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(DiscountPercentCaption; DiscountPercentCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountVATCaption; PaymentDiscountVATCaptionLbl)
                        {
                        }
                        column(Desc_SalesLineCaption; "Sales Line".FieldCaption(Description))
                        {
                        }
                        column(No2_SalesLineCaption; "Sales Line".FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesLineCaption; "Sales Line".FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesLineCaption; "Sales Line".FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".FieldCaption("VAT Identifier"))
                        {
                        }
                        ///// Fields on Subform Page <<
                        ///// Captions <<
                        column(CrossReferenceNo_SalesLineCaption; SalesLine.FieldCaption("Cross-Reference No.")) { }
                        column(ICPartnerCode_SalesLineCaption; SalesLine.FieldCaption("IC Partner Code")) { }
                        column(ICPartnerRefType_SalesLineCaption; SalesLine.FieldCaption("IC Partner Ref. Type")) { }
                        column(ICPartnerReference_SalesLineCaption; SalesLine.FieldCaption("IC Partner Reference")) { }
                        column(VariantCode_SalesLineCaption; SalesLine.FieldCaption("Variant Code")) { }
                        column(SubstitutionAvailable_SalesLineCaption; SalesLine.FieldCaption("Substitution Available")) { }
                        column(PurchasingCode_SalesLineCaption; SalesLine.FieldCaption("Purchasing Code")) { }
                        column(Nonstock_SalesLineCaption; SalesLine.FieldCaption(Nonstock)) { }
                        column(VATProdPostingGroup_SalesLineCaption; SalesLine.FieldCaption("VAT Prod. Posting Group")) { }
                        column(Description_SalesLineCaption; SalesLine.FieldCaption(Description)) { }
                        column(DropShipment_SalesLineCaption; SalesLine.FieldCaption("Drop Shipment")) { }
                        column(SpecialOrder_SalesLineCaption; SalesLine.FieldCaption("Special Order")) { }
                        column(ReturnReasonCode_SalesLineCaption; SalesLine.FieldCaption("Return Reason Code")) { }
                        column(LocationCode_SalesLineCaption; SalesLine.FieldCaption("Location Code")) { }
                        column(BinCode_SalesLineCaption; SalesLine.FieldCaption("Bin Code")) { }
                        column(Control50_SalesLineCaption; SalesLine.FieldCaption(Reserve)) { }
                        column(Quantity_SalesLineCaption; SalesLine.FieldCaption(Quantity)) { }
                        column(QtytoAssembletoOrder_SalesLineCaption; SalesLine.FieldCaption("Qty. to Assemble to Order")) { }
                        column(ReservedQuantity_SalesLineCaption; SalesLine.FieldCaption("Reserved Quantity")) { }
                        column(UnitofMeasureCode_SalesLineCaption; SalesLine.FieldCaption("Unit of Measure Code")) { }
                        column(UnitofMeasure_SalesLineCaption; SalesLine.FieldCaption("Unit of Measure")) { }
                        column(UnitCostLCY_SalesLineCaption; SalesLine.FieldCaption("Unit Cost (LCY)")) { }
                        // column(UnitPrice_SalesLineCaption; SalesLine.FieldCaption("Unit Price")) { }
                        column(TaxLiable_SalesLineCaption; SalesLine.FieldCaption("Tax Liable")) { }
                        column(TaxAreaCode_SalesLineCaption; SalesLine.FieldCaption("Tax Area Code")) { }
                        column(TaxGroupCode_SalesLineCaption; SalesLine.FieldCaption("Tax Group Code")) { }
                        column(LineDiscountPercentage_SalesLineCaption; SalesLine.FieldCaption("Line Discount %")) { }
                        column(LineAmountSalesLineCaption; SalesLine.FieldCaption("Line Amount")) { }
                        column(LineDiscountAmount_SalesLineCaption; SalesLine.FieldCaption("Line Discount Amount")) { }
                        column(PrepaymentPercentage_SalesLineCaption; SalesLine.FieldCaption("Prepayment %")) { }
                        column(PrepmtLineAmount_SalesLineCaption; SalesLine.FieldCaption("Prepmt. Line Amount")) { }
                        column(PrepmtAmtInv_SalesLineCaption; SalesLine.FieldCaption("Prepmt. Amt. Inv.")) { }
                        column(AllowInvoiceDisc_SalesLineCaption; SalesLine.FieldCaption("Allow Invoice Disc.")) { }
                        column(InvDiscountAmount_SalesLineCaption; SalesLine.FieldCaption("Inv. Discount Amount")) { }
                        column(InvDiscAmounttoInvoice_SalesLineCaption; SalesLine.FieldCaption("Inv. Disc. Amount to Invoice")) { }
                        column(QtytoShip_SalesLineCaption; SalesLine.FieldCaption("Qty. to Ship")) { }
                        column(QuantityShipped_SalesLineCaption; SalesLine.FieldCaption("Quantity Shipped")) { }
                        column(QtytoInvoice_SalesLineCaption; SalesLine.FieldCaption("Qty. to Invoice")) { }
                        column(QuantityInvoiced_SalesLineCaption; SalesLine.FieldCaption("Quantity Invoiced")) { }
                        column(PrepmtAmttoDeduct_SalesLineCaption; SalesLine.FieldCaption("Prepmt Amt to Deduct")) { }
                        column(PrepmtAmtDeducted_SalesLineCaption; SalesLine.FieldCaption("Prepmt Amt Deducted")) { }
                        column(AllowItemChargeAssignment_SalesLineCaption; SalesLine.FieldCaption("Allow Item Charge Assignment")) { }
                        column(QtytoAssign_SalesLineCaption; SalesLine.FieldCaption("Qty. to Assign")) { }
                        column(QtyAssigned_SalesLineCaption; SalesLine.FieldCaption("Qty. Assigned")) { }
                        column(RequestedDeliveryDate_SalesLineCaption; SalesLine.FieldCaption("Requested Delivery Date")) { }
                        column(PromisedDeliveryDate_SalesLineCaption; SalesLine.FieldCaption("Promised Delivery Date")) { }
                        column(PlannedDeliveryDate_SalesLineCaption; SalesLine.FieldCaption("Planned Delivery Date")) { }
                        column(PlannedShipmentDate_SalesLineCaption; SalesLine.FieldCaption("Planned Shipment Date")) { }
                        column(ShipmentDate_SalesLineCaption; SalesLine.FieldCaption("Shipment Date")) { }
                        column(ShippingAgentCode_SalesLineCaption; SalesLine.FieldCaption("Shipping Agent Code")) { }
                        column(ShippingAgentServiceCode_SalesLineCaption; SalesLine.FieldCaption("Shipping Agent Service Code")) { }
                        column(ShippingTime_SalesLineCaption; SalesLine.FieldCaption("Shipping Time")) { }
                        column(WorkTypeCode_SalesLineCaption; SalesLine.FieldCaption("Work Type Code")) { }
                        column(WhseOutstandingQty_SalesLineCaption; SalesLine.FieldCaption("Whse. Outstanding Qty.")) { }
                        column(WhseOutstandingQtyBase_SalesLineCaption; SalesLine.FieldCaption("Whse. Outstanding Qty. (Base)")) { }
                        column(ATOWhseOutstandingQty_SalesLineCaption; SalesLine.FieldCaption("ATO Whse. Outstanding Qty.")) { }
                        column(ATOWhseOutstdQtyBase_SalesLineCaption; SalesLine.FieldCaption("ATO Whse. Outstd. Qty. (Base)")) { }
                        column(OutboundWhseHandlingTime_SalesLineCaption; SalesLine.FieldCaption("Outbound Whse. Handling Time")) { }
                        column(BlanketOrderNo_SalesLineCaption; SalesLine.FieldCaption("Blanket Order No.")) { }
                        column(BlanketOrderLineNo_SalesLineCaption; SalesLine.FieldCaption("Blanket Order Line No.")) { }
                        column(FAPostingDate_SalesLineCaption; SalesLine.FieldCaption("FA Posting Date")) { }
                        column(DepruntilFAPostingDate_SalesLineCaption; SalesLine.FieldCaption("Depr. until FA Posting Date")) { }
                        column(DepreciationBookCode_SalesLineCaption; SalesLine.FieldCaption("Depreciation Book Code")) { }
                        column(UseDuplicationList_SalesLineCaption; SalesLine.FieldCaption("Use Duplication List")) { }
                        column(DuplicateinDepreciationBook_SalesLineCaption; SalesLine.FieldCaption("Duplicate in Depreciation Book")) { }
                        column(ApplfromItemEntry_SalesLineCaption; SalesLine.FieldCaption("Appl.-from Item Entry")) { }
                        column(AppltoItemEntry_SalesLineCaption; SalesLine.FieldCaption("Appl.-to Item Entry")) { }
                        column(DeferralCode_SalesLineCaption; SalesLine.FieldCaption("Deferral Code")) { }
                        column(ShortcutDimension1Code_SalesLineCaption; SalesLine.FieldCaption("Shortcut Dimension 1 Code")) { }
                        column(ShortcutDimension2Code_SalesLineCaption; SalesLine.FieldCaption("Shortcut Dimension 2 Code")) { }
                        column(ShortcutDimCode3_SalesLineCaption; ShortcutDimCode3Dimension.Name) { }
                        column(ShortcutDimCode4_SalesLineCaption; ShortcutDimCode4Dimension.Name) { }
                        column(ShortcutDimCode5_SalesLineCaption; ShortcutDimCode5Dimension.Name) { }
                        column(ShortcutDimCode6_SalesLineCaption; ShortcutDimCode6Dimension.Name) { }
                        column(ShortcutDimCode7_SalesLineCaption; ShortcutDimCode7Dimension.Name) { }
                        column(ShortcutDimCode8_SalesLineCaption; ShortcutDimCode8Dimension.Name) { }
                        column(DocumentNo_SalesLineCaption; SalesLine.FieldCaption("Document No.")) { }
                        column(LineNo_SalesLineCaption; SalesLine.FieldCaption("Line No.")) { }
                        column(ACONumberofUnits_SalesLineCaption; SalesLine.FieldCaption("ACO Number of Units")) { }
                        column(ACOBritishStandard_SalesLineCaption; SalesLine.FieldCaption("ACO British Standard")) { }
                        column(ACOLayerThickness_SalesLineCaption; SalesLine.FieldCaption("ACO Layer Thickness")) { }
                        column(ACOColor_SalesLineCaption; SalesLine.FieldCaption("ACO Color")) { }
                        column(ACOProfileCode_SalesLineCaption; SalesLine.FieldCaption("ACO Profile Code")) { }
                        column(ACOProfileDescription_SalesLineCaption; SalesLine.FieldCaption("ACO Profile Description")) { }
                        column(ACOProfileCircumference_SalesLineCaption; SalesLine.FieldCaption("ACO Profile Circumference")) { }
                        column(ACONotMeasurable_SalesLineCaption; SalesLine.FieldCaption("ACO Not Measurable")) { }
                        column(ACOExtraFlushing_SalesLineCaption; SalesLine.FieldCaption("ACO Extra Flushing")) { }
                        column(ACOAreaProfile_SalesLineCaption; SalesLine.FieldCaption("ACO Area Profile")) { }
                        column(ACOEurasProfile_SalesLineCaption; SalesLine.FieldCaption("ACO Euras Profile")) { }
                        column(ACOHighEnd_SalesLineCaption; SalesLine.FieldCaption("ACO High End")) { }
                        column(ACOMeasureReport_SalesLineCaption; SalesLine.FieldCaption("ACO Measure Report")) { }
                        column(ACOAttachMethodCodeProfile_SalesLineCaption; SalesLine.FieldCaption("ACO Attach Method Code Profile")) { }
                        column(ACOTypeofClampCode_SalesLineCaption; SalesLine.FieldCaption("ACO Type of Clamp Code")) { }
                        column(ACOArea_SalesLineCaption; SalesLine.FieldCaption("ACO Area")) { }
                        column(ACOSawing_SalesLineCaption; SalesLine.FieldCaption("ACO Sawing")) { }
                        column(ACOFinalLength_SalesLineCaption; SalesLine.FieldCaption("ACO Final Length")) { }
                        column(ACOQtyAfterProduction_SalesLineCaption; SalesLine.FieldCaption("ACO Qty. After Production")) { }
                        column(ACOLinkedHolder_SalesLineCaption; SalesLine.FieldCaption("ACO Linked Holder")) { }
                        column(ACOReceiptBag_SalesLineCaption; SalesLine.FieldCaption("ACO Receipt Bag")) { }
                        column(ACOReceiptShelf_SalesLineCaption; SalesLine.FieldCaption("ACO Receipt Shelf")) { }
                        column(ACOShippingBag_SalesLineCaption; SalesLine.FieldCaption("ACO Shipping Bag")) { }
                        column(ACOShippingShelf_SalesLineCaption; SalesLine.FieldCaption("ACO Shipping Shelf")) { }
                        column(ACOKundentourHUECK_SalesLineCaption; SalesLine.FieldCaption("ACO Kundentour HUECK")) { }
                        column(ACOPackaging_SalesLineCaption; SalesLine.FieldCaption("ACO Packaging")) { }
                        column(ACOProjectColorCode_SalesLineCaption; SalesLine.FieldCaption("ACO Project Color Code")) { }
                        column(ACOHeadCut_SalesLineCaption; SalesLine.FieldCaption("ACO Head Cut")) { }
                        column(ACOReturnRemaining_SalesLineCaption; SalesLine.FieldCaption("ACO Return Remaining")) { }
                        column(ACOLowerAccuracy_SalesLineCaption; SalesLine.FieldCaption("ACO Lower Accuracy")) { }
                        column(ACOUpperAccuracy_SalesLineCaption; SalesLine.FieldCaption("ACO Upper Accuracy")) { }
                        ///// Caption >>
                        ///// Values <<
                        // column(Type_SalesLine; SalesLine.Type) { }
                        // column(FilteredTypecolumn_SalesLine; TypeAsText) { }
                        // column(No_SalesLine; SalesLine."No.") { }
                        column(CrossReferenceNo_SalesLine; SalesLine."Cross-Reference No.") { }
                        column(ICPartnerCode_SalesLine; SalesLine."IC Partner Code") { }
                        column(ICPartnerRefType_SalesLine; SalesLine."IC Partner Ref. Type") { }
                        column(ICPartnerReference_SalesLine; SalesLine."IC Partner Reference") { }
                        column(VariantCode_SalesLine; SalesLine."Variant Code") { }
                        column(SubstitutionAvailable_SalesLine; SalesLine."Substitution Available") { }
                        column(PurchasingCode_SalesLine; SalesLine."Purchasing Code") { }
                        column(Nonstock_SalesLine; SalesLine.Nonstock) { }
                        column(VATProdPostingGroup_SalesLine; SalesLine."VAT Prod. Posting Group") { }
                        column(Description_SalesLine; SalesLine.Description) { }
                        column(DropShipment_SalesLine; SalesLine."Drop Shipment") { }
                        column(SpecialOrder_SalesLine; SalesLine."Special Order") { }
                        column(ReturnReasonCode_SalesLine; SalesLine."Return Reason Code") { }
                        column(LocationCode_SalesLine; SalesLine."Location Code") { }
                        column(BinCode_SalesLine; SalesLine."Bin Code") { }
                        column(Control50_SalesLine; SalesLine.Reserve) { }
                        column(Quantity_SalesLine; SalesLine.Quantity) { }
                        column(QtytoAssembletoOrder_SalesLine; SalesLine."Qty. to Assemble to Order") { }
                        column(ReservedQuantity_SalesLine; SalesLine."Reserved Quantity") { }
                        column(UnitofMeasureCode_SalesLine; SalesLine."Unit of Measure Code") { }
                        column(UnitofMeasure_SalesLine; SalesLine."Unit of Measure") { }
                        column(UnitCostLCY_SalesLine; SalesLine."Unit Cost (LCY)") { }
                        // column(UnitPrice_SalesLine; SalesLine."Unit Price") { }
                        column(TaxLiable_SalesLine; SalesLine."Tax Liable") { }
                        column(TaxAreaCode_SalesLine; SalesLine."Tax Area Code") { }
                        column(TaxGroupCode_SalesLine; SalesLine."Tax Group Code") { }
                        column(LineDiscountPercentage_SalesLine; SalesLine."Line Discount %") { }
                        column(LineAmountSalesLine; SalesLine."Line Amount") { }
                        column(LineDiscountAmount_SalesLine; SalesLine."Line Discount Amount") { }
                        column(PrepaymentPercentage_SalesLine; SalesLine."Prepayment %") { }
                        column(PrepmtLineAmount_SalesLine; SalesLine."Prepmt. Line Amount") { }
                        column(PrepmtAmtInv_SalesLine; SalesLine."Prepmt. Amt. Inv.") { }
                        column(AllowInvoiceDisc_SalesLine; SalesLine."Allow Invoice Disc.") { }
                        column(InvDiscountAmount_SalesLine; SalesLine."Inv. Discount Amount") { }
                        column(InvDiscAmounttoInvoice_SalesLine; SalesLine."Inv. Disc. Amount to Invoice") { }
                        column(QtytoShip_SalesLine; SalesLine."Qty. to Ship") { }
                        column(QuantityShipped_SalesLine; SalesLine."Quantity Shipped") { }
                        column(QtytoInvoice_SalesLine; SalesLine."Qty. to Invoice") { }
                        column(QuantityInvoiced_SalesLine; SalesLine."Quantity Invoiced") { }
                        column(PrepmtAmttoDeduct_SalesLine; SalesLine."Prepmt Amt to Deduct") { }
                        column(PrepmtAmtDeducted_SalesLine; SalesLine."Prepmt Amt Deducted") { }
                        column(AllowItemChargeAssignment_SalesLine; SalesLine."Allow Item Charge Assignment") { }
                        column(QtytoAssign_SalesLine; SalesLine."Qty. to Assign") { }
                        column(QtyAssigned_SalesLine; SalesLine."Qty. Assigned") { }
                        column(RequestedDeliveryDate_SalesLine; SalesLine."Requested Delivery Date") { }
                        column(PromisedDeliveryDate_SalesLine; SalesLine."Promised Delivery Date") { }
                        column(PlannedDeliveryDate_SalesLine; SalesLine."Planned Delivery Date") { }
                        column(PlannedShipmentDate_SalesLine; SalesLine."Planned Shipment Date") { }
                        column(ShipmentDate_SalesLine; SalesLine."Shipment Date") { }
                        column(ShippingAgentCode_SalesLine; SalesLine."Shipping Agent Code") { }
                        column(ShippingAgentServiceCode_SalesLine; SalesLine."Shipping Agent Service Code") { }
                        column(ShippingTime_SalesLine; SalesLine."Shipping Time") { }
                        column(WorkTypeCode_SalesLine; SalesLine."Work Type Code") { }
                        column(WhseOutstandingQty_SalesLine; SalesLine."Whse. Outstanding Qty.") { }
                        column(WhseOutstandingQtyBase_SalesLine; SalesLine."Whse. Outstanding Qty. (Base)") { }
                        column(ATOWhseOutstandingQty_SalesLine; SalesLine."ATO Whse. Outstanding Qty.") { }
                        column(ATOWhseOutstdQtyBase_SalesLine; SalesLine."ATO Whse. Outstd. Qty. (Base)") { }
                        column(OutboundWhseHandlingTime_SalesLine; SalesLine."Outbound Whse. Handling Time") { }
                        column(BlanketOrderNo_SalesLine; SalesLine."Blanket Order No.") { }
                        column(BlanketOrderLineNo_SalesLine; SalesLine."Blanket Order Line No.") { }
                        column(FAPostingDate_SalesLine; SalesLine."FA Posting Date") { }
                        column(DepruntilFAPostingDate_SalesLine; SalesLine."Depr. until FA Posting Date") { }
                        column(DepreciationBookCode_SalesLine; SalesLine."Depreciation Book Code") { }
                        column(UseDuplicationList_SalesLine; SalesLine."Use Duplication List") { }
                        column(DuplicateinDepreciationBook_SalesLine; SalesLine."Duplicate in Depreciation Book") { }
                        column(ApplfromItemEntry_SalesLine; SalesLine."Appl.-from Item Entry") { }
                        column(AppltoItemEntry_SalesLine; SalesLine."Appl.-to Item Entry") { }
                        column(DeferralCode_SalesLine; SalesLine."Deferral Code") { }
                        column(ShortcutDimension1Code_SalesLine; SalesLine."Shortcut Dimension 1 Code") { }
                        column(ShortcutDimension2Code_SalesLine; SalesLine."Shortcut Dimension 2 Code") { }
                        column(ShortcutDimCode3_SalesLine; ShortcutDimCode[3]) { }
                        column(ShortcutDimCode4_SalesLine; ShortcutDimCode[4]) { }
                        column(ShortcutDimCode5_SalesLine; ShortcutDimCode[5]) { }
                        column(ShortcutDimCode6_SalesLine; ShortcutDimCode[6]) { }
                        column(ShortcutDimCode7_SalesLine; ShortcutDimCode[7]) { }
                        column(ShortcutDimCode8_SalesLine; ShortcutDimCode[8]) { }
                        column(DocumentNo_SalesLine; SalesLine."Document No.") { }
                        column(LineNo_SalesLine; SalesLine."Line No.") { }
                        column(ACONumberofUnits_SalesLine; SalesLine."ACO Number of Units") { }
                        column(ACOBritishStandard_SalesLine; SalesLine."ACO British Standard") { }
                        column(ACOLayerThickness_SalesLine; SalesLine."ACO Layer Thickness") { }
                        column(ACOColor_SalesLine; SalesLine."ACO Color") { }
                        column(ACOProfileCode_SalesLine; SalesLine."ACO Profile Code") { }
                        column(ACOProfileDescription_SalesLine; SalesLine."ACO Profile Description") { }
                        column(ACOProfileCircumference_SalesLine; SalesLine."ACO Profile Circumference") { }
                        column(ACONotMeasurable_SalesLine; SalesLine."ACO Not Measurable") { }
                        column(ACOExtraFlushing_SalesLine; SalesLine."ACO Extra Flushing") { }
                        column(ACOAreaProfile_SalesLine; SalesLine."ACO Area Profile") { }
                        column(ACOEurasProfile_SalesLine; SalesLine."ACO Euras Profile") { }
                        column(ACOHighEnd_SalesLine; SalesLine."ACO High End") { }
                        column(ACOMeasureReport_SalesLine; SalesLine."ACO Measure Report") { }
                        column(ACOAttachMethodCodeProfile_SalesLine; SalesLine."ACO Attach Method Code Profile") { }
                        column(ACOTypeofClampCode_SalesLine; SalesLine."ACO Type of Clamp Code") { }
                        column(ACOArea_SalesLine; SalesLine."ACO Area") { }
                        column(ACOSawing_SalesLine; SalesLine."ACO Sawing") { }
                        column(ACOFinalLength_SalesLine; SalesLine."ACO Final Length") { }
                        column(ACOQtyAfterProduction_SalesLine; SalesLine."ACO Qty. After Production") { }
                        column(ACOLinkedHolder_SalesLine; SalesLine."ACO Linked Holder") { }
                        column(ACOReceiptBag_SalesLine; SalesLine."ACO Receipt Bag") { }
                        column(ACOReceiptShelf_SalesLine; SalesLine."ACO Receipt Shelf") { }
                        column(ACOShippingBag_SalesLine; SalesLine."ACO Shipping Bag") { }
                        column(ACOShippingShelf_SalesLine; SalesLine."ACO Shipping Shelf") { }
                        column(ACOKundentourHUECK_SalesLine; SalesLine."ACO Kundentour HUECK") { }
                        column(ACOPackaging_SalesLine; SalesLine."ACO Packaging") { }
                        column(ACOProjectColorCode_SalesLine; SalesLine."ACO Project Color Code") { }
                        column(ACOHeadCut_SalesLine; SalesLine."ACO Head Cut") { }
                        column(ACOReturnRemaining_SalesLine; SalesLine."ACO Return Remaining") { }
                        column(ACOLowerAccuracy_SalesLine; SalesLine."ACO Lower Accuracy") { }
                        column(ACOUpperAccuracy_SalesLine; SalesLine."ACO Upper Accuracy") { }
                        ///// Values >>
                        ///// Fields on Subform Page >>
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText2; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
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
                                    CurrReport.Break;

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(AsmLineType; AsmLine.Type)
                            {
                            }
                            column(AsmLineNo; BlanksForIndent + AsmLine."No.")
                            {
                            }
                            column(AsmLineDescription; BlanksForIndent + AsmLine.Description)
                            {
                            }
                            column(AsmLineQuantity; AsmLine.Quantity)
                            {
                            }
                            column(AsmLineUOMText; GetUnitOfMeasureDescr(AsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    AsmLine.FindSet
                                else
                                    AsmLine.Next;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break;
                                if not AsmInfoExistsForLine then
                                    CurrReport.Break;
                                AsmLine.SetRange("Document Type", AsmHeader."Document Type");
                                AsmLine.SetRange("Document No.", AsmHeader."No.");
                                SetRange(Number, 1, AsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                SalesLine.Find('-')
                            else
                                SalesLine.Next;
                            "Sales Line" := SalesLine;
                            if DisplayAssemblyInformation then
                                AsmInfoExistsForLine := SalesLine.AsmToOrderExists(AsmHeader);

                            if not "Sales Header"."Prices Including VAT" and
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            then
                                SalesLine."Line Amount" := 0;

                            if (SalesLine.Type = SalesLine.Type::"G/L Account") and (not ShowInternalInfo) then
                                "Sales Line"."No." := '';

                            NNCSalesLineLineAmt += SalesLine."Line Amount";
                            NNCSalesLineInvDiscAmt += SalesLine."Inv. Discount Amount";

                            NNCTotalLCY := NNCSalesLineLineAmt - NNCSalesLineInvDiscAmt;

                            NNCTotalExclVAT := NNCTotalLCY;
                            NNCVATAmt := VATAmount;
                            NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                            NNCPmtDiscOnVAT := -VATDiscountAmount;

                            NNCTotalInclVAT2 := TotalAmountInclVAT;

                            NNCVATAmt2 := VATAmount;
                            NNCTotalExclVAT2 := VATBaseAmount;

                            SalesLine.ShowShortcutDimCode(ShortCutDimCode);
                        end;

                        trigger OnPostDataItem()
                        begin
                            SalesLine.DeleteAll;
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := SalesLine.Find('+');
                            while MoreLines and (SalesLine.Description = '') and (SalesLine."Description 2" = '') and
                                  (SalesLine."No." = '') and (SalesLine.Quantity = 0) and
                                  (SalesLine.Amount = 0)
                            do
                                MoreLines := SalesLine.Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break;
                            SalesLine.SetRange("Line No.", 0, SalesLine."Line No.");
                            SetRange(Number, 1, SalesLine.Count);
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if VATAmount = 0 then
                                CurrReport.Break;
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage2; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier2; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Header"."Currency Code" = '') or
                               (VATAmountLine.GetTotalVATAmount = 0)
                            then
                                CurrReport.Break;

                            SetRange(Number, 1, VATAmountLine.Count);
                            Clear(VALVATBaseLCY);
                            Clear(VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Posting Date", "Sales Header"."Currency Code", 1);
                            VALExchRate := StrSubstNo(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break;
                        end;
                    }
                    dataitem(PrepmtLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(PrepmtLineAmount; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBufDesc; PrepmtInvBuf.Description)
                        {
                        }
                        column(PrepmtInvBufGLAccNo; PrepmtInvBuf."G/L Account No.")
                        {
                        }
                        column(TotalExclVATText2; TotalExclVATText)
                        {
                        }
                        column(PrepmtVATAmtLineVATAmtTxt; PrepmtVATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText2; TotalInclVATText)
                        {
                        }
                        column(PrepmtInvAmount; PrepmtInvBuf.Amount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmount; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvAmtInclVATAmt; PrepmtInvBuf.Amount + PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText2; VATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtLoopNumber; Number)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(GLAccountNoCaption; GLAccountNoCaptionLbl)
                        {
                        }
                        column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                        {
                        }
                        dataitem(PrepmtDimLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText3; DimText)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not TempPrepmtDimSetEntry.Find('-') then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText :=
                                          StrSubstNo('%1 %2', TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until TempPrepmtDimSetEntry.Next = 0;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not PrepmtInvBuf.Find('-') then
                                    CurrReport.Break;
                            end else
                                if PrepmtInvBuf.Next = 0 then
                                    CurrReport.Break;

                            if ShowInternalInfo then
                                DimMgt.GetDimensionSet(TempPrepmtDimSetEntry, PrepmtInvBuf."Dimension Set ID");

                            if "Sales Header"."Prices Including VAT" then
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            else
                                PrepmtLineAmount := PrepmtInvBuf.Amount;
                        end;
                    }
                    dataitem(PrepmtVATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(PrepmtVATAmtLineVATAmt; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVATBase; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineLineAmt; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVATPerc; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmtLineVATIdent; PrepmtVATAmountLine."VAT Identifier")
                        {
                        }
                        column(PrepmtVATCounterNumber; Number)
                        {
                        }
                        column(PrepaymentVATAmtSpecCap; PrepaymentVATAmtSpecCapLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            PrepmtVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, PrepmtVATAmountLine.Count);
                        end;
                    }
                    dataitem(PrepmtTotal; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(PrepmtPmtTermsDesc; PrepmtPaymentTerms.Description)
                        {
                        }
                        column(PrepmtPmtTermsDescCaption; PrepmtPmtTermsDescCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not PrepmtInvBuf.Find('-') then
                                CurrReport.Break;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    PrepmtSalesLine: Record "Sales Line" temporary;
                    TempSalesLine: Record "Sales Line" temporary;
                    SalesPost: Codeunit "Sales-Post";
                begin
                    Clear(SalesLine);
                    Clear(SalesPost);
                    VATAmountLine.DeleteAll;
                    SalesLine.DeleteAll;
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    PrepmtInvBuf.DeleteAll;
                    SalesPostPrepmt.GetSalesLines("Sales Header", 0, PrepmtSalesLine);

                    if not PrepmtSalesLine.IsEmpty then begin
                        SalesPostPrepmt.GetSalesLinesToDeduct("Sales Header", TempSalesLine);
                        if not TempSalesLine.IsEmpty then
                            SalesPostPrepmt.CalcVATAmountLines("Sales Header", TempSalesLine, PrepmtVATAmountLineDeduct, 1);
                    end;
                    SalesPostPrepmt.CalcVATAmountLines("Sales Header", PrepmtSalesLine, PrepmtVATAmountLine, 0);
                    PrepmtVATAmountLine.DeductVATAmountLine(PrepmtVATAmountLineDeduct);
                    SalesPostPrepmt.UpdateVATOnLines("Sales Header", PrepmtSalesLine, PrepmtVATAmountLine, 0);
                    SalesPostPrepmt.BuildInvLineBuffer("Sales Header", PrepmtSalesLine, 0, PrepmtInvBuf);
                    PrepmtVATAmount := PrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := PrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := PrepmtVATAmountLine.GetTotalAmountInclVAT;

                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;

                    NNCTotalLCY := 0;
                    NNCTotalExclVAT := 0;
                    NNCVATAmt := 0;
                    NNCTotalInclVAT := 0;
                    NNCPmtDiscOnVAT := 0;
                    NNCTotalInclVAT2 := 0;
                    NNCVATAmt2 := 0;
                    NNCTotalExclVAT2 := 0;
                    NNCSalesLineLineAmt := 0;
                    NNCSalesLineInvDiscAmt := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if Print then
                        CODEUNIT.Run(CODEUNIT::"Sales-Printed", "Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Header");
                FormatDocumentFields("Sales Header");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if Print then begin
                    if CurrReport.UseRequestPage and ArchiveDocument or
                       not CurrReport.UseRequestPage and SalesSetup."Archive Orders"
                    then
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);
                end;

                CalcFields("Work Description");
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Header");
            end;

            trigger OnPreDataItem()
            begin
                Print := Print or not IsReportInPreviewMode;
                AsmInfoExistsForLine := false;
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
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies if the document is archived after you print it.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';

                        trigger OnValidate()
                        begin
                            if LogInteraction then
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
                    }
                    field(ShowAssemblyComponents; DisplayAssemblyInformation)
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
            ArchiveDocument := SalesSetup."Archive Orders";
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
        GLSetup.Get;
        if not ShortcutDimCode3Dimension.Get(GLSetup."Shortcut Dimension 3 Code") then Clear(ShortcutDimCode3Dimension);
        if not ShortcutDimCode4Dimension.Get(GLSetup."Shortcut Dimension 4 Code") then Clear(ShortcutDimCode4Dimension);
        if not ShortcutDimCode5Dimension.Get(GLSetup."Shortcut Dimension 5 Code") then Clear(ShortcutDimCode5Dimension);
        if not ShortcutDimCode6Dimension.Get(GLSetup."Shortcut Dimension 6 Code") then Clear(ShortcutDimCode6Dimension);
        if not ShortcutDimCode7Dimension.Get(GLSetup."Shortcut Dimension 7 Code") then Clear(ShortcutDimCode7Dimension);
        if not ShortcutDimCode8Dimension.Get(GLSetup."Shortcut Dimension 8 Code") then Clear(ShortcutDimCode8Dimension);

        CompanyInfo.Get;
        SalesSetup.Get;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and Print then
            if "Sales Header".FindSet then
                repeat
                    "Sales Header".CalcFields("No. of Archived Versions");
                    if "Sales Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          SegManagement.SalesOrderConfirmInterDocType, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Contact, "Sales Header"."Bill-to Contact No."
                          , "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.")
                    else
                        SegManagement.LogDocument(
                          SegManagement.SalesOrderConfirmInterDocType, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Customer, "Sales Header"."Bill-to Customer No.",
                          "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.");
                until "Sales Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text004: Label 'Order Confirmation %1', Comment = '%1 = Document No.';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        SalesLine: Record "Sales Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        TempPrepmtDimSetEntry: Record "Dimension Set Entry" temporary;
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        AsmHeader: Record "Assembly Header";
        AsmLine: Record "Assembly Line";
        ShortcutDimCode3Dimension: Record Dimension;
        ShortcutDimCode4Dimension: Record Dimension;
        ShortcutDimCode5Dimension: Record Dimension;
        ShortcutDimCode6Dimension: Record Dimension;
        ShortcutDimCode7Dimension: Record Dimension;
        ShortcutDimCode8Dimension: Record Dimension;
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        FormatDocument: Codeunit "Format Document";
        SalesPostPrepmt: Codeunit "Sales-Post Prepayments";
        DimMgt: Codeunit DimensionManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        VALExchRate: Text[50];
        ShortcutDimCode: array[8] of Code[20];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        OutputNo: Integer;
        NNCTotalLCY: Decimal;
        NNCTotalExclVAT: Decimal;
        NNCVATAmt: Decimal;
        NNCTotalInclVAT: Decimal;
        NNCPmtDiscOnVAT: Decimal;
        NNCTotalInclVAT2: Decimal;
        NNCVATAmt2: Decimal;
        NNCTotalExclVAT2: Decimal;
        NNCSalesLineLineAmt: Decimal;
        NNCSalesLineInvDiscAmt: Decimal;
        Print: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmInfoExistsForLine: Boolean;
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankCaptionLbl: Label 'Bank';
        AccountNoCaptionLbl: Label 'Account No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        OrderNoCaptionLbl: Label 'Order No.';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        DiscountPercentCaptionLbl: Label 'Discount %';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscountVATCaptionLbl: Label 'Payment Discount on VAT';
        LineDimCaptionLbl: Label 'Line Dimensions';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        DescriptionCaptionLbl: Label 'Description';
        GLAccountNoCaptionLbl: Label 'G/L Account No.';
        PrepaymentSpecCaptionLbl: Label 'Prepayment Specification';
        PrepaymentVATAmtSpecCapLbl: Label 'Prepayment VAT Amount Specification';
        PrepmtPmtTermsDescCaptionLbl: Label 'Prepmt. Payment Terms';
        PhoneNoCaptionLbl: Label 'Phone No.';
        AmountCaptionLbl: Label 'Amount';
        VATPercentageCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        LineAmtCaptionLbl: Label 'Line Amount';
        TotalCaptionLbl: Label 'Total';
        UnitPriceCaptionLbl: Label 'Unit Price';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        DocumentDateCaptionLbl: Label 'Document Date';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';

    procedure InitializeRequest(NoOfCopiesFrom: Integer; ShowInternalInfoFrom: Boolean; ArchiveDocumentFrom: Boolean; LogInteractionFrom: Boolean; PrintFrom: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NoOfCopiesFrom;
        ShowInternalInfo := ShowInternalInfoFrom;
        ArchiveDocument := ArchiveDocumentFrom;
        LogInteraction := LogInteractionFrom;
        Print := PrintFrom;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(3) <> '';
    end;

    local procedure FormatAddressFields(var SalesHeader: Record "Sales Header")
    begin
        FormatAddr.GetCompanyAddr(SalesHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesHeaderBillTo(CustAddr, SalesHeader);
        ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, SalesHeader);
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        with SalesHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentTerms(PrepmtPaymentTerms, "Prepmt. Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FieldCaption("VAT Registration No."));
        end;
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
    local procedure OnAfterPostDataItem(var SalesHeader: Record "Sales Header")
    begin
    end;
}

