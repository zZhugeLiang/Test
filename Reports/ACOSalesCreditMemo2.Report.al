report 50015 "ACO Std. Sales - Credit Memo"
{
    RDLCLayout = './StandardSalesCreditMemo.rdlc';
    WordLayout = './StandardSalesCreditMemo.docx';
    Caption = 'Sales - Credit Memo';
    DefaultLayout = Word;
    Permissions = TableData "Sales Shipment Buffer" = rimd;
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Sales Cr.Memo Header";

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Credit Memo';


            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                    column(CompanyAddress1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddress2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddress3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddress4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddress5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddress6; CompanyAddr[6])
                    {
                    }
                    column(CompanyHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyEMail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyPicture; DummyCompanyInfo.Picture)
                    {
                    }
                    column(CompanyPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoLbl)
                    {
                    }
                    column(CompanyGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyGiroNo_Lbl; CompanyInfoGiroNoLbl)
                    {
                    }
                    column(CompanyBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyBankName_Lbl; CompanyInfoBankNameLbl)
                    {
                    }
                    column(CompanyBankBranchNo; CompanyInfo."Bank Branch No.")
                    {
                    }
                    column(CompanyBankBranchNo_Lbl; CompanyInfo.FieldCaption("Bank Branch No."))
                    {
                    }
                    column(CompanyBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoLbl)
                    {
                    }
                    column(CompanyIBAN; CompanyInfo.IBAN)
                    {
                    }
                    column(CompanyIBAN_Lbl; CompanyInfo.FieldCaption(IBAN))
                    {
                    }
                    column(CompanySWIFT; CompanyInfo."SWIFT Code")
                    {
                    }
                    column(CompanySWIFT_Lbl; CompanyInfo.FieldCaption("SWIFT Code"))
                    {
                    }
                    column(CompanyLogoPosition; CompanyLogoPosition)
                    {
                    }
                    column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber)
                    {
                    }
                    column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl)
                    {
                    }
                    column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber)
                    {
                    }
                    column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
                    {
                    }
                    column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber)
                    {
                    }
                    column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
                    {
                    }
                    column(CompanyLegalOffice; CompanyInfo.GetLegalOffice)
                    {
                    }
                    column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl)
                    {
                    }
                    column(CompanyCustomGiro; CompanyInfo.GetCustomGiro)
                    {
                    }
                    column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl)
                    {
                    }
                    column(CompanyLegalStatement; "Sales Cr.Memo Header".GetLegalStatement)
                    {
                    }
                    column(CustomerAddress1; CustAddr[1])
                    {
                    }
                    column(CustomerAddress2; CustAddr[2])
                    {
                    }
                    column(CustomerAddress3; CustAddr[3])
                    {
                    }
                    column(CustomerAddress4; CustAddr[4])
                    {
                    }
                    column(CustomerAddress5; CustAddr[5])
                    {
                    }
                    column(CustomerAddress6; CustAddr[6])
                    {
                    }
                    column(CustomerAddress7; CustAddr[7])
                    {
                    }
                    column(CustomerAddress8; CustAddr[8])
                    {
                    }
                    column(SellToContactPhoneNoLbl; SellToContactPhoneNoLbl)
                    {
                    }
                    column(SellToContactMobilePhoneNoLbl; SellToContactMobilePhoneNoLbl)
                    {
                    }
                    column(SellToContactEmailLbl; SellToContactEmailLbl)
                    {
                    }
                    column(BillToContactPhoneNoLbl; BillToContactPhoneNoLbl)
                    {
                    }
                    column(BillToContactMobilePhoneNoLbl; BillToContactMobilePhoneNoLbl)
                    {
                    }
                    column(BillToContactEmailLbl; BillToContactEmailLbl)
                    {
                    }
                    column(SellToContactPhoneNo; SellToContact."Phone No.")
                    {
                    }
                    column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
                    {
                    }
                    column(SellToContactEmail; SellToContact."E-Mail")
                    {
                    }
                    column(BillToContactPhoneNo; BillToContact."Phone No.")
                    {
                    }
                    column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
                    {
                    }
                    column(BillToContactEmail; BillToContact."E-Mail")
                    {
                    }
                    column(CustomerPostalBarCode; FormatAddr.PostalBarCode(1))
                    {
                    }
                    column(YourReference; "Sales Cr.Memo Header"."Your Reference")
                    {
                    }
                    column(YourReference_Lbl; "Sales Cr.Memo Header".FieldCaption("Your Reference"))
                    {
                    }
                    column(ExternalDocumentNo; "Sales Cr.Memo Header"."External Document No.")
                    {
                    }
                    column(ExternalDocumentNoLbl; "Sales Cr.Memo Header".FieldCaption("External Document No."))
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(ShipmentMethodDescription_Lbl; ShptMethodDescLbl)
                    {
                    }
                    column(ShipmentDate; Format("Sales Cr.Memo Header"."Shipment Date", 0, 4))
                    {
                    }
                    column(ShipmentDate_Lbl; "Sales Cr.Memo Header".FieldCaption("Shipment Date"))
                    {
                    }
                    column(Shipment_Lbl; ShipmentLbl)
                    {
                    }
                    column(ShowShippingAddress; ShowShippingAddr)
                    {
                    }
                    column(ShipToAddress_Lbl; ShiptoAddrLbl)
                    {
                    }
                    column(ShipToAddress1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddress2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddress3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddress4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddress5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddress6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddress7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddress8; ShipToAddr[8])
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(PaymentTermsDescription_Lbl; PaymentTermsDescLbl)
                    {
                    }
                    column(PaymentMethodDescription; PaymentMethod.Description)
                    {
                    }
                    column(PaymentMethodDescription_Lbl; PaymentMethodDescLbl)
                    {
                    }
                    column(DocumentCopyText; StrSubstNo(DocumentCaption, CopyText))
                    {
                    }
                    column(BilltoCustumerNo; "Sales Cr.Memo Header"."Bill-to Customer No.")
                    {
                    }
                    column(BilltoCustumerNo_Lbl; "Sales Cr.Memo Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(DocumentDate; Format("Sales Cr.Memo Header"."Document Date", 0, 4))
                    {
                    }
                    column(DocumentDate_Lbl; "Sales Cr.Memo Header".FieldCaption("Document Date"))
                    {
                    }
                    column(DueDate; Format("Sales Cr.Memo Header"."Due Date", 0, 4))
                    {
                    }
                    column(DueDate_Lbl; "Sales Cr.Memo Header".FieldCaption("Due Date"))
                    {
                    }
                    column(DocumentNo; "Sales Cr.Memo Header"."No.")
                    {
                    }
                    column(DocumentNo_Lbl; InvNoLbl)
                    {
                    }
                    column(AppliesToDocument; AppliesToText)
                    {
                    }
                    column(AppliesToDocument_Lbl; AppliesToTextLbl)
                    {
                    }
                    column(PricesIncludingVAT; "Sales Cr.Memo Header"."Prices Including VAT")
                    {
                    }
                    column(PricesIncludingVAT_Lbl; "Sales Cr.Memo Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    column(PricesIncludingVATYesNo; Format("Sales Cr.Memo Header"."Prices Including VAT"))
                    {
                    }
                    column(SalesPerson_Lbl; SalespersonLbl)
                    {
                    }
                    column(SalesPersonBlank_Lbl; SalesPersonText)
                    {
                    }
                    column(SalesPersonName; SalespersonPurchaser.Name)
                    {
                    }
                    column(SelltoCustomerNo; "Sales Cr.Memo Header"."Sell-to Customer No.")
                    {
                    }
                    column(SelltoCustomerNo_Lbl; "Sales Cr.Memo Header".FieldCaption("Sell-to Customer No."))
                    {
                    }
                    column(VATRegistrationNo; "Sales Cr.Memo Header".GetCustomerVATRegistrationNumber)
                    {
                    }
                    column(VATRegistrationNo_Lbl; "Sales Cr.Memo Header".GetCustomerVATRegistrationNumberLbl)
                    {
                    }
                    column(GlobalLocationNumber; "Sales Cr.Memo Header".GetCustomerGlobalLocationNumber)
                    {
                    }
                    column(GlobalLocationNumber_Lbl; "Sales Cr.Memo Header".GetCustomerGlobalLocationNumberLbl)
                    {
                    }
                    column(LegalEntityType; Cust.GetLegalEntityType)
                    {
                    }
                    column(LegalEntityType_Lbl; Cust.GetLegalEntityTypeLbl)
                    {
                    }
                    column(Copy_Lbl; CopyLbl)
                    {
                    }
                    column(EMail_Header_Lbl; EMailLbl)
                    {
                    }
                    column(HomePage_Header_Lbl; HomePageLbl)
                    {
                    }
                    column(InvoiceDiscountBaseAmount_Lbl; InvDiscBaseAmtLbl)
                    {
                    }
                    column(InvoiceDiscountAmount_Lbl; InvDiscountAmtLbl)
                    {
                    }
                    column(LineAmountAfterInvoiceDiscount_Lbl; LineAmtAfterInvDiscLbl)
                    {
                    }
                    column(LocalCurrency_Lbl; LocalCurrencyLbl)
                    {
                    }
                    column(ExchangeRateASText; ExchangeRateText)
                    {
                    }
                    column(Page_Lbl; PageLbl)
                    {
                    }
                    column(SalesInvoiceLineDiscount_Lbl; SalesInvLineDiscLbl)
                    {
                    }
                    column(DocumentTitle_Lbl; SalesCreditMemoLbl)
                    {
                    }
                    column(ShowWorkDescription; ShowWorkDescription)
                    {
                    }
                    column(Subtotal_Lbl; SubtotalLbl)
                    {
                    }
                    column(Total_Lbl; TotalLbl)
                    {
                    }
                    column(VATAmount_Lbl; VATAmtLbl)
                    {
                    }
                    column(VATBase_Lbl; VATBaseLbl)
                    {
                    }
                    column(VATAmountSpecification_Lbl; VATAmtSpecificationLbl)
                    {
                    }
                    column(VATClauses_Lbl; VATClausesLbl)
                    {
                    }
                    column(VATIdentifier_Lbl; VATIdentifierLbl)
                    {
                    }
                    column(VATPercentage_Lbl; VATPercentageLbl)
                    {
                    }
                    column(VATClause_Lbl; VATClause.TableCaption)
                    {
                    }
                    ///// Added Fields from Page <<
                    ///// Captions <<
                    column(No_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("No.")) { }
                    column(SelltoCustomerName_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Customer Name")) { }
                    column(SelltoAddress_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Address")) { }
                    column(SelltoAddress2_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Address 2")) { }
                    column(SelltoCity_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to City")) { }
                    column(SelltoCounty_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to County")) { }
                    column(SelltoPostCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Post Code")) { }
                    column(SelltoCountryRegionCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Country/Region Code")) { }
                    column(SelltoContactNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Contact No.")) { }
                    column(SelltoContact_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Contact")) { }
                    column(PostingDate_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Posting Date")) { }
                    column(YourReference_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Your Reference")) { }
                    column(DocumentDate_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Document Date")) { }
                    column(DocumentExchangeStatus_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Document Exchange Status")) { }
                    column(PreAssignedNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Pre-Assigned No.")) { }
                    column(ExternalDocumentNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("External Document No.")) { }
                    column(SalespersonCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Salesperson Code")) { }
                    column(ResponsibilityCenter_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Responsibility Center")) { }
                    column(Cancelled_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption(Cancelled)) { }
                    column(Corrective_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption(Corrective)) { }
                    column(NoPrinted_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("No. Printed")) { }
                    column(WorkDescription_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Work Description")) { }
                    column(CurrencyCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Currency Code")) { }
                    column(ShortcutDimension1Code_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Shortcut Dimension 1 Code")) { }
                    column(ShortcutDimension2Code_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Shortcut Dimension 2 Code")) { }
                    column(LocationCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Location Code")) { }
                    column(AppliestoDocType_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Applies-to Doc. Type")) { }
                    column(AppliestoDocNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Applies-to Doc. No.")) { }
                    column(PaymentMethodCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Payment Method Code")) { }
                    column(TransactionMode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Transaction Mode")) { }
                    column(BankAccount_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bank Account")) { }
                    column(EU3PartyTrade_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("EU 3-Party Trade")) { }
                    column(TaxLiable_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Tax Liable")) { }
                    column(TaxAreaCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Tax Area Code")) { }
                    column(ShiptoName_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Name")) { }
                    column(ShiptoAddress_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Address")) { }
                    column(ShiptoAddress2_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Address 2")) { }
                    column(ShiptoCity_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to City")) { }
                    column(ShiptoCounty_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to County")) { }
                    column(ShiptoPostCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Post Code")) { }
                    column(ShiptoCountryRegionCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Country/Region Code")) { }
                    column(ShiptoContact_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Ship-to Contact")) { }
                    column(BilltoName_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Name")) { }
                    column(BilltoAddress_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Address")) { }
                    column(BilltoAddress2_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Address 2")) { }
                    column(BilltoCity_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to City")) { }
                    column(BilltoCounty_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to County")) { }
                    column(BilltoPostCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Post Code")) { }
                    column(BilltoCountryRegionCode_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Country/Region Code")) { }
                    column(BilltoContactNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Contact No.")) { }
                    column(BilltoContactSalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Contact")) { }
                    ///// Captions >>
                    ///// Values <<
                    // column(No_SalesCrMemoHeader; "Sales Cr.Memo Header"."No.") { }
                    column(SelltoCustomerName_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Customer Name") { }
                    column(SelltoAddress_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Address") { }
                    column(SelltoAddress2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Address 2") { }
                    column(SelltoCity_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to City") { }
                    column(SelltoCounty_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to County") { }
                    column(SelltoPostCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Post Code") { }
                    column(SelltoCountryRegionCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Country/Region Code") { }
                    column(SelltoContactNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Contact No.") { }
                    column(SelltoContact_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Contact") { }
                    column(PostingDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Posting Date") { }
                    column(YourReference_SalesCrMemoHeader; "Sales Cr.Memo Header"."Your Reference") { }
                    column(DocumentDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Document Date") { }
                    column(DocumentExchangeStatus_SalesCrMemoHeader; "Sales Cr.Memo Header"."Document Exchange Status") { }
                    column(PreAssignedNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Pre-Assigned No.") { }
                    column(ExternalDocumentNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."External Document No.") { }
                    column(SalespersonCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Salesperson Code") { }
                    column(ResponsibilityCenter_SalesCrMemoHeader; "Sales Cr.Memo Header"."Responsibility Center") { }
                    column(Cancelled_SalesCrMemoHeader; "Sales Cr.Memo Header".Cancelled) { }
                    column(Corrective_SalesCrMemoHeader; "Sales Cr.Memo Header".Corrective) { }
                    column(NoPrinted_SalesCrMemoHeader; "Sales Cr.Memo Header"."No. Printed") { }
                    column(WorkDescription_SalesCrMemoHeader; "Sales Cr.Memo Header".GetWorkDescription()) { }
                    column(CurrencyCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Currency Code") { }
                    column(ShortcutDimension1Code_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shortcut Dimension 1 Code") { }
                    column(ShortcutDimension2Code_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shortcut Dimension 2 Code") { }
                    column(LocationCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Location Code") { }
                    column(AppliestoDocType_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. Type") { }
                    column(AppliestoDocNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. No.") { }
                    column(PaymentMethodCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Payment Method Code") { }
                    column(TransactionMode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Transaction Mode") { }
                    column(BankAccount_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bank Account") { }
                    column(EU3PartyTrade_SalesCrMemoHeader; "Sales Cr.Memo Header"."EU 3-Party Trade") { }
                    column(TaxLiable_SalesCrMemoHeader; "Sales Cr.Memo Header"."Tax Liable") { }
                    column(TaxAreaCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Tax Area Code") { }
                    column(ShiptoName_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Name") { }
                    column(ShiptoAddress_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Address") { }
                    column(ShiptoAddress2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Address 2") { }
                    column(ShiptoCity_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to City") { }
                    column(ShiptoCounty_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to County") { }
                    column(ShiptoPostCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Post Code") { }
                    column(ShiptoCountryRegionCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Country/Region Code") { }
                    column(ShiptoContact_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Contact") { }
                    column(BilltoName_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Name") { }
                    column(BilltoAddress_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Address") { }
                    column(BilltoAddress2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Address 2") { }
                    column(BilltoCity_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to City") { }
                    column(BilltoCounty_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to County") { }
                    column(BilltoPostCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Post Code") { }
                    column(BilltoCountryRegionCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Country/Region Code") { }
                    column(BilltoContactNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Contact No.") { }
                    column(BilltoContactSalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Contact") { }
                    ///// Values >>
                    ///// Added Fields from Page >>	    
                    dataitem(Line; "Sales Cr.Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineNo_Line; "Line No.")
                        {
                        }
                        column(AmountExcludingVAT_Line; Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(AmountExcludingVAT_Line_Lbl; FieldCaption(Amount))
                        {
                        }
                        column(AmountIncludingVAT_Line; "Amount Including VAT")
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(AmountIncludingVAT_Line_Lbl; FieldCaption("Amount Including VAT"))
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(Description_Line; Description)
                        {
                        }
                        column(Description_Line_Lbl; FieldCaption(Description))
                        {
                        }
                        column(LineDiscountPercent_Line; "Line Discount %")
                        {
                        }
                        column(LineDiscountPercentText_Line; LineDiscountPctText)
                        {
                        }
                        column(LineAmount_Line; FormattedLineAmount)
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(LineAmount_Line_Lbl; FieldCaption("Line Amount"))
                        {
                        }
                        column(ItemNo_Line; "No.")
                        {
                        }
                        column(ItemNo_Line_Lbl; FieldCaption("No."))
                        {
                        }
                        column(CrossReferenceNo_Line; "Cross-Reference No.")
                        {
                            ObsoleteState = Pending;
                            ObsoleteReason = 'Replaced by Item Reference No.';
                            ObsoleteTag = '17.0';
                        }
                        column(CrossReferenceNo_Line_Lbl; FieldCaption("Cross-Reference No."))
                        {
                            ObsoleteState = Pending;
                            ObsoleteReason = 'Replaced by Item Reference No.';
                            ObsoleteTag = '17.0';
                        }
                        column(ItemReferenceNo_Line; "Item Reference No.")
                        {
                        }
                        column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No."))
                        {
                        }
                        column(ShipmentDate_Line; Format("Shipment Date"))
                        {
                        }
                        column(ShipmentDate_Line_Lbl; PostedShipmentDateLbl)
                        {
                        }
                        column(Quantity_Line; FormattedQuantity)
                        {
                        }
                        column(Quantity_Line_Lbl; FieldCaption(Quantity))
                        {
                        }
                        column(Type_Line; Format(Type))
                        {
                        }
                        column(UnitPrice; FormattedUnitPrice)
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 2;
                        }
                        column(UnitPrice_Lbl; FieldCaption("Unit Price"))
                        {
                        }
                        column(UnitOfMeasure; "Unit of Measure")
                        {
                        }
                        column(UnitOfMeasure_Lbl; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_Line; "VAT Identifier")
                        {
                        }
                        column(VATIdentifier_Line_Lbl; FieldCaption("VAT Identifier"))
                        {
                        }
                        column(VATPct_Line; FormattedVATPct)
                        {
                        }
                        column(VATPct_Line_Lbl; FieldCaption("VAT %"))
                        {
                        }
                        column(TransHeaderAmount; TransHeaderAmount)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        ///// Fields on Subform Page
                        ///// Captions <<
                        column(Type_SalesCrMemoLineCaption; Line.FieldCaption(Type)) { }
                        // column(No_SalesCrMemoLineCaption; Line.FieldCaption("No.")) { }
                        column(CrossReferenceNo_SalesCrMemoLineCaption; Line.FieldCaption("Item Reference No.")) { }
                        column(ICPartnerCode_SalesCrMemoLineCaption; Line.FieldCaption("IC Partner Code")) { }
                        column(VariantCode_SalesCrMemoLineCaption; Line.FieldCaption("Variant Code")) { }
                        column(Description_SalesCrMemoLineCaption; Line.FieldCaption(Description)) { }
                        column(ReturnReasonCode_SalesCrMemoLineCaption; Line.FieldCaption("Return Reason Code")) { }
                        column(Quantity_SalesCrMemoLineCaption; Line.FieldCaption(Quantity)) { }
                        column(UnitofMeasureCode_SalesCrMemoLineCaption; Line.FieldCaption("Unit of Measure Code")) { }
                        column(UnitofMeasure_SalesCrMemoLineCaption; Line.FieldCaption("Unit of Measure")) { }
                        column(UnitCostLCY_SalesCrMemoLineCaption; Line.FieldCaption("Unit Cost (LCY)")) { }
                        column(UnitPrice_SalesCrMemoLineCaption; Line.FieldCaption("Unit Price")) { }
                        column(TaxLiable_SalesCrMemoLineCaption; Line.FieldCaption("Tax Liable")) { }
                        column(TaxAreaCode_SalesCrMemoLineCaption; Line.FieldCaption("Tax Area Code")) { }
                        column(TaxGroupCode_SalesCrMemoLineCaption; Line.FieldCaption("Tax Group Code")) { }
                        column(LineAmount_SalesCrMemoLineCaption; Line.FieldCaption("Line Amount")) { }
                        column(LineDiscountPercentage_SalesCrMemoLineCaption; Line.FieldCaption("Line Discount %")) { }
                        column(LineDiscountAmount_SalesCrMemoLineCaption; Line.FieldCaption("Line Discount Amount")) { }
                        column(AllowInvoiceDisc_SalesCrMemoLineCaption; Line.FieldCaption("Allow Invoice Disc.")) { }
                        column(JobNo_SalesCrMemoLineCaption; Line.FieldCaption("Job No.")) { }
                        column(JobTaskNo_SalesCrMemoLineCaption; Line.FieldCaption("Job Task No.")) { }
                        column(ApplfromItemEntry_SalesCrMemoLineCaption; Line.FieldCaption("Appl.-from Item Entry")) { }
                        column(AppltoItemEntry_SalesCrMemoLineCaption; Line.FieldCaption("Appl.-to Item Entry")) { }
                        column(DeferralCode_SalesCrMemoLineCaption; Line.FieldCaption("Deferral Code")) { }
                        column(ShortcutDimension1Code_SalesCrMemoLineCaption; Line.FieldCaption("Shortcut Dimension 1 Code")) { }
                        column(ShortcutDimension2Code_SalesCrMemoLineCaption; Line.FieldCaption("Shortcut Dimension 2 Code")) { }
                        column(ShortcutDimCode3_SalesCrMemoLineCaption; ShortcutDimCode3Dimension.Name) { }
                        column(ShortcutDimCode4_SalesCrMemoLineCaption; ShortcutDimCode4Dimension.Name) { }
                        column(ShortcutDimCode5_SalesCrMemoLineCaption; ShortcutDimCode5Dimension.Name) { }
                        column(ShortcutDimCode6_SalesCrMemoLineCaption; ShortcutDimCode6Dimension.Name) { }
                        column(ShortcutDimCode7_SalesCrMemoLineCaption; ShortcutDimCode7Dimension.Name) { }
                        column(ShortcutDimCode8_SalesCrMemoLineCaption; ShortcutDimCode8Dimension.Name) { }
                        column(ACOProfileDescription_SalesCrMemoLineCaption; Line.FieldCaption("ACO Profile Description")) { }
                        column(ACOCustomerItemNo_SalesCrMemoLineCaption; Line.FieldCaption("ACO Customer Item No.")) { }
                        column(ACOProfileCustDescription_SalesCrMemoLineCaption; Line.FieldCaption("ACO Profile Cust. Description")) { }
                        column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
                        column(ACOSawing_SalesCrMemoLineCaption; Line.FieldCaption("ACO Sawing")) { }
                        column(ACOProfileCode_SalesCrMemoLineCaption; Line."ACO Profile Code") { }
                        column(ACONumberofMeters_ItemVariantCaption; ItemVariant."ACO Number of Meters") { }
                        column(ACONumberofUnits_SalesCrMemoLineCaption; Line."ACO Number of Units") { }

                        ///// Captions >>
                        ///// Values <<
                        column(FilteredTypeField_SalesCrMemoLine; Line.FormatType) { }
                        column(CrossReferenceNo_SalesCrMemoLine; Line."Item Reference No.") { }
                        column(ICPartnerCode_SalesCrMemoLine; Line."IC Partner Code") { }
                        column(VariantCode_SalesCrMemoLine; Line."Variant Code") { }
                        column(Description_SalesCrMemoLine; Line.Description) { }
                        column(ReturnReasonCode_SalesCrMemoLine; Line."Return Reason Code") { }
                        column(Quantity_SalesCrMemoLine; Line.Quantity) { }
                        column(UnitofMeasureCode_SalesCrMemoLine; Line."Unit of Measure Code") { }
                        column(UnitofMeasure_SalesCrMemoLine; Line."Unit of Measure") { }
                        column(UnitCostLCY_SalesCrMemoLine; Line."Unit Cost (LCY)") { }
                        column(TaxLiable_SalesCrMemoLine; Line."Tax Liable") { }
                        column(TaxAreaCode_SalesCrMemoLine; Line."Tax Area Code") { }
                        column(TaxGroupCode_SalesCrMemoLine; Line."Tax Group Code") { }
                        column(LineAmount_SalesCrMemoLine; Line."Line Amount") { }
                        column(LineDiscountPercentage_SalesCrMemoLine; Line."Line Discount %") { }
                        column(LineDiscountAmount_SalesCrMemoLine; Line."Line Discount Amount") { }
                        column(AllowInvoiceDisc_SalesCrMemoLine; Line."Allow Invoice Disc.") { }
                        column(JobNo_SalesCrMemoLine; Line."Job No.") { }
                        column(JobTaskNo_SalesCrMemoLine; Line."Job Task No.") { }
                        column(ApplfromItemEntry_SalesCrMemoLine; Line."Appl.-from Item Entry") { }
                        column(AppltoItemEntry_SalesCrMemoLine; Line."Appl.-to Item Entry") { }
                        column(DeferralCode_SalesCrMemoLine; Line."Deferral Code") { }
                        column(ShortcutDimension1Code_SalesCrMemoLine; Line."Shortcut Dimension 1 Code") { }
                        column(ShortcutDimension2Code_SalesCrMemoLine; Line."Shortcut Dimension 2 Code") { }
                        column(ShortcutDimCode3_SalesCrMemoLine; ShortcutDimCode[3]) { }
                        column(ShortcutDimCode4_SalesCrMemoLine; ShortcutDimCode[4]) { }
                        column(ShortcutDimCode5_SalesCrMemoLine; ShortcutDimCode[5]) { }
                        column(ShortcutDimCode6_SalesCrMemoLine; ShortcutDimCode[6]) { }
                        column(ShortcutDimCode7_SalesCrMemoLine; ShortcutDimCode[7]) { }
                        column(ShortcutDimCode8_SalesCrMemoLine; ShortcutDimCode[8]) { }
                        column(ACOProfileCode_SalesCrMemoLine; Line."ACO Profile Code") { }
                        column(ACOProfileDescription_SalesCrMemoLine; Line."ACO Profile Description") { }
                        column(ACOCustomerItemNo_SalesCrMemoLine; Line."ACO Customer Item No.") { }
                        column(ACOProfileCustDescription_SalesCrMemoLine; Line."ACO Profile Cust. Description") { }
                        column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                        column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                        column(ACOSawing_SalesCrMemoLine; Line."ACO Sawing") { }
                        column(ACONumberofUnits_SalesCrMemoLine; Line."ACO Number of Units") { }

                        dataitem(ShipmentLine; "Sales Shipment Buffer")
                        {
                            DataItemTableView = SORTING("Document No.", "Line No.", "Entry No.");
                            UseTemporary = true;
                            column(DocumentNo_ShipmentLine; "Document No.")
                            {
                            }
                            column(PostingDate_ShipmentLine; "Posting Date")
                            {
                            }
                            column(PostingDate_ShipmentLine_Lbl; FieldCaption("Posting Date"))
                            {
                            }
                            column(Quantity_ShipmentLine; Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(Quantity_ShipmentLine_Lbl; FieldCaption(Quantity))
                            {
                            }

                            trigger OnPreDataItem()
                            begin
                                SetRange("Line No.", Line."Line No.");
                            end;
                        }
                        dataitem(AssemblyLine; "Posted Assembly Line")
                        {
                            DataItemTableView = SORTING("Document No.", "Line No.");
                            UseTemporary = true;
                            column(LineNo_AssemblyLine; "No.")
                            {
                            }
                            column(Description_AssemblyLine; Description)
                            {
                            }
                            column(Quantity_AssemblyLine; Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(UnitOfMeasure_AssemblyLine; GetUOMText("Unit of Measure Code"))
                            {
                            }
                            column(VariantCode_AssemblyLine; "Variant Code")
                            {
                            }

                            trigger OnPreDataItem()
                            var
                                ValueEntry: Record "Value Entry";
                            begin
                                Clear(AssemblyLine);
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                GetAssemblyLinesForDocument(
                                  AssemblyLine, ValueEntry."Document Type"::"Sales Credit Memo", Line."Document No.", Line."Line No.");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            InitializeSalesShipmentLine;
                            if Type = Type::"G/L Account" then
                                "No." := '';

                            if "Line Discount %" = 0 then
                                LineDiscountPctText := ''
                            else
                                LineDiscountPctText := StrSubstNo('%1%', -Round("Line Discount %", 0.1));

                            VATAmountLine.Init();
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            if "Allow Invoice Disc." then
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                            VATAmountLine.InsertLine();

                            TransHeaderAmount += PrevLineAmount;
                            PrevLineAmount := "Line Amount";
                            TotalSubTotal += "Line Amount";
                            TotalInvDiscAmount -= "Inv. Discount Amount";
                            TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");

                            FormatDocument.SetSalesCrMemoLine(Line, FormattedQuantity, FormattedUnitPrice, FormattedVATPct, FormattedLineAmount);

                            if FirstLineHasBeenOutput then
                                Clear(DummyCompanyInfo.Picture);
                            FirstLineHasBeenOutput := true;

                            ///
                            if not ACOProfile.Get("ACO Profile Code") then
                                Clear(ACOProfile);

                            if not ItemVariant.Get("ACO Profile Code") then
                                Clear(ItemVariant);
                            ///

                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DeleteAll();
                            VATClauseLine.DeleteAll();
                            ShipmentLine.Reset();
                            ShipmentLine.DeleteAll();
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                            TransHeaderAmount := 0;
                            PrevLineAmount := 0;
                            FirstLineHasBeenOutput := false;
                            DummyCompanyInfo.Picture := CompanyInfo.Picture;
                        end;
                    }
                    dataitem(WorkDescriptionLines; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 .. 99999));
                        column(WorkDescriptionLineNumber; Number)
                        {
                        }
                        column(WorkDescriptionLine; WorkDescriptionLine)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if WorkDescriptionInstream.EOS then
                                CurrReport.Break();
                            WorkDescriptionInstream.ReadText(WorkDescriptionLine);
                        end;

                        trigger OnPostDataItem()
                        begin
                            Clear(WorkDescriptionInstream)
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowWorkDescription then
                                CurrReport.Break();
                            "Sales Cr.Memo Header"."Work Description".CreateInStream(WorkDescriptionInstream, TEXTENCODING::UTF8);
                        end;
                    }
                    dataitem(VATAmountLine; "VAT Amount Line")
                    {
                        DataItemTableView = SORTING("VAT Identifier", "VAT Calculation Type", "Tax Group Code", "Use Tax", Positive);
                        UseTemporary = true;
                        column(InvoiceDiscountAmount_VATAmountLine; "Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvoiceDiscountAmount_VATAmountLine_Lbl; FieldCaption("Invoice Discount Amount"))
                        {
                        }
                        column(InvoiceDiscountBaseAmount_VATAmountLine; "Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvoiceDiscountBaseAmount_VATAmountLine_Lbl; FieldCaption("Inv. Disc. Base Amount"))
                        {
                        }
                        column(LineAmount_VatAmountLine; "Line Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmount_VatAmountLine_Lbl; FieldCaption("Line Amount"))
                        {
                        }
                        column(VATAmount_VatAmountLine; "VAT Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount_VatAmountLine_Lbl; FieldCaption("VAT Amount"))
                        {
                        }
                        column(VATAmountLCY_VATAmountLine; VATAmountLCY)
                        {
                        }
                        column(VATAmountLCY_VATAmountLine_Lbl; VATAmountLCYLbl)
                        {
                        }
                        column(VATBase_VatAmountLine; "VAT Base")
                        {
                            AutoFormatExpression = Line.GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(VATBase_VatAmountLine_Lbl; FieldCaption("VAT Base"))
                        {
                        }
                        column(VATBaseLCY_VATAmountLine; VATBaseLCY)
                        {
                        }
                        column(VATBaseLCY_VATAmountLine_Lbl; VATBaseLCYLbl)
                        {
                        }
                        column(VATIdentifier_VatAmountLine; "VAT Identifier")
                        {
                        }
                        column(VATIdentifier_VatAmountLine_Lbl; FieldCaption("VAT Identifier"))
                        {
                        }
                        column(VATPct_VatAmountLine; "VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATPct_VatAmountLine_Lbl; FieldCaption("VAT %"))
                        {
                        }
                        column(NoOfVATIdentifiers; Count)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATBaseLCY :=
                              GetBaseLCY(
                                "Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code",
                                "Sales Cr.Memo Header"."Currency Factor");
                            VATAmountLCY :=
                              GetAmountLCY(
                                "Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code",
                                "Sales Cr.Memo Header"."Currency Factor");

                            TotalVATBaseLCY += VATBaseLCY;
                            TotalVATAmountLCY += VATAmountLCY;

                            if "VAT Clause Code" <> '' then begin
                                VATClauseLine := VATAmountLine;
                                if VATClauseLine.Insert() then;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(VATBaseLCY);
                            Clear(VATAmountLCY);

                            TotalVATBaseLCY := 0;
                            TotalVATAmountLCY := 0;
                        end;
                    }
                    dataitem(VATClauseLine; "VAT Amount Line")
                    {
                        DataItemTableView = SORTING("VAT Identifier", "VAT Calculation Type", "Tax Group Code", "Use Tax", Positive);
                        UseTemporary = true;
                        column(VATIdentifier_VATClauseLine; "VAT Identifier")
                        {
                        }
                        column(Code_VATClauseLine; VATClause.Code)
                        {
                        }
                        column(Code_VATClauseLine_Lbl; VATClause.FieldCaption(Code))
                        {
                        }
                        column(Description_VATClauseLine; VATClause.Description)
                        {
                        }
                        column(Description2_VATClauseLine; VATClause."Description 2")
                        {
                        }
                        column(VATAmount_VATClauseLine; "VAT Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(NoOfVATClauses; Count)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if "VAT Clause Code" = '' then
                                CurrReport.Skip();
                            if not VATClause.Get("VAT Clause Code") then
                                CurrReport.Skip();
                            VATClause.GetDescription("Sales Cr.Memo Header");
                        end;
                    }
                    dataitem(ReportTotalsLine; "Report Totals Buffer")
                    {
                        DataItemTableView = SORTING("Line No.");
                        UseTemporary = true;
                        column(Description_ReportTotalsLine; Description)
                        {
                        }
                        column(Amount_ReportTotalsLine; Amount)
                        {
                        }
                        column(AmountFormatted_ReportTotalsLine; "Amount Formatted")
                        {
                        }
                        column(FontBold_ReportTotalsLine; "Font Bold")
                        {
                        }
                        column(FontUnderline_ReportTotalsLine; "Font Underline")
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            CreateReportTotalLines;
                        end;
                    }
                    dataitem(LetterText; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(GreetingText; GreetingLbl)
                        {
                        }
                        column(BodyText; BodyLbl)
                        {
                        }
                        column(ClosingText; ClosingLbl)
                        {
                        }
                    }
                    dataitem(Totals; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(TotalNetAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalVATBaseLCY; TotalVATBaseLCY)
                        {
                        }
                        column(TotalAmountIncludingVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalVATAmount; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalVATAmountLCY; TotalVATAmountLCY)
                        {
                        }
                        column(TotalInvoiceDiscountAmount; TotalInvDiscAmount)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscountOnVAT; TotalPaymentDiscOnVAT)
                        {
                        }
                        column(TotalVATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExcludingVATText; TotalExclVATText)
                        {
                        }
                        column(TotalIncludingVATText; TotalInclVATText)
                        {
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotalMinusInvoiceDiscount; TotalSubTotal + TotalInvDiscAmount)
                        {
                        }
                        column(TotalText; TotalText)
                        {
                        }
                    }
                }

                trigger OnAfterGetRecord()
                var
                    CurrencyExchangeRate: Record "Currency Exchange Rate";
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales Cr. Memo-Printed", "Sales Cr.Memo Header");

                    "Sales Cr.Memo Header".CalcFields("Work Description");
                    ShowWorkDescription := "Sales Cr.Memo Header"."Work Description".HasValue;
                    CurrReport.Language := Language.GetLanguageIdOrDefault("Sales Cr.Memo Header"."Language Code");

                    FormatAddressFields("Sales Cr.Memo Header");
                    FormatDocumentFields("Sales Cr.Memo Header");
                    if SellToContact.Get("Sales Cr.Memo Header"."Sell-to Contact No.") then;
                    if BillToContact.Get("Sales Cr.Memo Header"."Bill-to Contact No.") then;

                    if not Cust.Get("Sales Cr.Memo Header"."Bill-to Customer No.") then
                        Clear(Cust);

                    if "Sales Cr.Memo Header"."Currency Code" <> '' then begin
                        CurrencyExchangeRate.FindCurrency("Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code", 1);
                        CalculatedExchRate :=
                          Round(1 / "Sales Cr.Memo Header"."Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.000001);
                        ExchangeRateText := StrSubstNo(ExchangeRateTxt, CalculatedExchRate, CurrencyExchangeRate."Exchange Rate Amount");
                    end;

                    TotalSubTotal := 0;
                    TotalInvDiscAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscOnVAT := 0;
                end;

                trigger OnPreDataItem()
                begin
                    FirstLineHasBeenOutput := false;
                end;
            }
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
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                    field(DisplayShipmentInformation; DisplayShipmentInformation)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Shipments';
                        ToolTip = 'Specifies that shipments are shown on the document.';
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
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        SalesSetup.Get();
        CompanyInfo.VerifyAndSetPaymentInfo;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Cr.Memo Header".FindSet then
                repeat
                    if "Sales Cr.Memo Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          6, "Sales Cr.Memo Header"."No.", 0, 0, DATABASE::Contact, "Sales Cr.Memo Header"."Bill-to Contact No.", "Sales Cr.Memo Header"."Salesperson Code",
                          "Sales Cr.Memo Header"."Campaign No.", "Sales Cr.Memo Header"."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          6, "Sales Cr.Memo Header"."No.", 0, 0, DATABASE::Customer, "Sales Cr.Memo Header"."Bill-to Customer No.", "Sales Cr.Memo Header"."Salesperson Code",
                          "Sales Cr.Memo Header"."Campaign No.", "Sales Cr.Memo Header"."Posting Description", '');
                until "Sales Cr.Memo Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if "Sales Cr.Memo Header".GetFilters = '' then
            Error(NoFilterSetErr);

        if not CurrReport.UseRequestPage then
            InitLogInteraction;

        CompanyLogoPosition := SalesSetup."Logo Position on Documents";
    end;

    var
        SalesCreditMemoNoLbl: Label 'Sales - Credit Memo %1';
        SalespersonLbl: Label 'Sales person';
        CompanyInfoBankAccNoLbl: Label 'Account No.';
        CompanyInfoBankNameLbl: Label 'Bank';
        CompanyInfoGiroNoLbl: Label 'Giro No.';
        CompanyInfoPhoneNoLbl: Label 'Phone No.';
        CopyLbl: Label 'Copy';
        EMailLbl: Label 'Email';
        HomePageLbl: Label 'Home Page';
        InvDiscBaseAmtLbl: Label 'Invoice Discount Base Amount';
        InvDiscountAmtLbl: Label 'Invoice Discount';
        InvNoLbl: Label 'Credit Memo No.';
        LineAmtAfterInvDiscLbl: Label 'Payment Discount on VAT';
        LocalCurrencyLbl: Label 'Local Currency';
        PageLbl: Label 'Page';
        PaymentTermsDescLbl: Label 'Payment Terms';
        PaymentMethodDescLbl: Label 'Payment Method';
        PostedShipmentDateLbl: Label 'Shipment Date';
        SalesInvLineDiscLbl: Label 'Discount %';
        SalesCreditMemoLbl: Label 'Credit Memo';
        ShipmentLbl: Label 'Shipment';
        ShiptoAddrLbl: Label 'Ship-to Address';
        ShptMethodDescLbl: Label 'Shipment Method';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        VATAmtSpecificationLbl: Label 'VAT Amount Specification';
        VATAmtLbl: Label 'VAT Amount';
        VATAmountLCYLbl: Label 'VAT Amount (LCY)';
        VATBaseLbl: Label 'VAT Base';
        VATBaseLCYLbl: Label 'VAT Base (LCY)';
        VATClausesLbl: Label 'VAT Clause';
        VATIdentifierLbl: Label 'VAT Identifier';
        VATPercentageLbl: Label 'VAT %';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        DummyCompanyInfo: Record "Company Information";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        RespCenter: Record "Responsibility Center";
        VATClause: Record "VAT Clause";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        ShortcutDimCode3Dimension: Record Dimension;
        ShortcutDimCode4Dimension: Record Dimension;
        ShortcutDimCode5Dimension: Record Dimension;
        ShortcutDimCode6Dimension: Record Dimension;
        ShortcutDimCode7Dimension: Record Dimension;
        ShortcutDimCode8Dimension: Record Dimension;
        ACOProfile: Record "ACO Profile";
        ItemVariant: Record "Item Variant";
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        WorkDescriptionInstream: InStream;
        WorkDescriptionLine: Text;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[30];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        LineDiscountPctText: Text;
        FormattedVATPct: Text;
        FormattedUnitPrice: Text;
        FormattedQuantity: Text;
        FormattedLineAmount: Text;
        ShortcutDimCode: array[8] of Code[20];
        MoreLines: Boolean;
        CopyText: Text[30];
        ShowWorkDescription: Boolean;
        ShowShippingAddr: Boolean;
        LogInteraction: Boolean;
        SalesPrepCreditMemoNoLbl: Label 'Sales - Prepmt. Credit Memo %1';
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        TransHeaderAmount: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        DisplayShipmentInformation: Boolean;
        CompanyLogoPosition: Integer;
        FirstLineHasBeenOutput: Boolean;
        CalculatedExchRate: Decimal;
        ExchangeRateText: Text;
        ExchangeRateTxt: Label 'Exchange rate: %1/%2', Comment = '%1 and %2 are both amounts.';
        VATBaseLCY: Decimal;
        VATAmountLCY: Decimal;
        TotalVATBaseLCY: Decimal;
        TotalVATAmountLCY: Decimal;
        PrevLineAmount: Decimal;
        AppliesToText: Text;
        AppliesToTextLbl: Label 'Applies to Document';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        BodyLbl: Label 'Thank you for your business. Your credit memo is attached to this message.';

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(6) <> '';
    end;

    local procedure InitializeSalesShipmentLine(): Date
    var
        ReturnReceiptHeader: Record "Return Receipt Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer";
    begin
        if Line."Return Receipt No." <> '' then
            if ReturnReceiptHeader.Get(Line."Return Receipt No.") then
                exit(ReturnReceiptHeader."Posting Date");
        if "Sales Cr.Memo Header"."Return Order No." = '' then
            exit("Sales Cr.Memo Header"."Posting Date");
        if Line.Type = Line.Type::" " then
            exit(0D);

        ShipmentLine.GetLinesForSalesCreditMemoLine(Line, "Sales Cr.Memo Header");

        ShipmentLine.Reset();
        ShipmentLine.SetRange("Line No.", Line."Line No.");
        if ShipmentLine.Find('-') then begin
            SalesShipmentBuffer2 := ShipmentLine;
            if not DisplayShipmentInformation then
                if ShipmentLine.Next = 0 then begin
                    ShipmentLine.Get(
                      SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                    ShipmentLine.Delete();
                    exit(SalesShipmentBuffer2."Posting Date");
                end;
            ShipmentLine.CalcSums(Quantity);
            if ShipmentLine.Quantity <> Line.Quantity then begin
                ShipmentLine.DeleteAll();
                exit("Sales Cr.Memo Header"."Posting Date");
            end;
        end;
        exit("Sales Cr.Memo Header"."Posting Date");
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure DocumentCaption(): Text[250]
    var
        DocCaption: Text[250];
    begin
        OnBeforeDocumentCaption("Sales Cr.Memo Header", DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);

        if "Sales Cr.Memo Header"."Prepayment Credit Memo" then
            exit(SalesPrepCreditMemoNoLbl);
        exit(SalesCreditMemoNoLbl);
    end;

    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    local procedure CreateReportTotalLines()
    begin
        ReportTotalsLine.DeleteAll();
        if (TotalInvDiscAmount <> 0) or (TotalAmountVAT <> 0) then
            ReportTotalsLine.Add(SubtotalLbl, TotalSubTotal, true, false, false);
        if TotalInvDiscAmount <> 0 then begin
            ReportTotalsLine.Add(InvDiscountAmtLbl, TotalInvDiscAmount, false, false, false);
            if TotalAmountVAT <> 0 then
                ReportTotalsLine.Add(TotalExclVATText, TotalAmount, true, false, false);
        end;
        if TotalAmountVAT <> 0 then
            ReportTotalsLine.Add(VATAmountLine.VATAmountText, TotalAmountVAT, false, true, false);
    end;

    local procedure FormatAddressFields(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        FormatAddr.GetCompanyAddr(SalesCrMemoHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesCrMemoBillTo(CustAddr, SalesCrMemoHeader);
        ShowShippingAddr := FormatAddr.SalesCrMemoShipTo(ShipToAddr, CustAddr, SalesCrMemoHeader);
    end;

    local procedure FormatDocumentFields(SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        with SalesCrMemoHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetSalesPerson(SalespersonPurchaser, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentMethod(PaymentMethod, "Payment Method Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            AppliesToText :=
              FormatDocument.SetText("Applies-to Doc. No." <> '', StrSubstNo('%1 %2', Format("Applies-to Doc. Type"), "Applies-to Doc. No."));
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDocumentCaption(SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var DocCaption: Text[250])
    begin
    end;
}

