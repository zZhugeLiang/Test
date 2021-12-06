report 50010 "ACO Sales - Invoice"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './SalesInvoice.rdlc';
    Caption = 'Sales - Invoice';
    EnableHyperlinks = true;
    Permissions = TableData "Sales Shipment Buffer" = rimd;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(No_SalesInvHdr; "No.")
            {
            }
            column(InvDiscountAmtCaption; InvDiscountAmtCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(PaymentTermsDescCaption; PaymentTermsDescCaptionLbl)
            {
            }
            column(ShptMethodDescCaption; ShptMethodDescCaptionLbl)
            {
            }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmtCaption; VATAmtCaptionLbl)
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EMailCaption; EMailCaptionLbl)
            {
            }
            column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(HomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(EMail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(DocumentCaptionCopyText; StrSubstNo(DocumentCaption, CopyText))
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
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
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
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesInvHdr; Format("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesInvHdr; "Sales Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(DueDate_SalesInvHdr; Format("Sales Invoice Header"."Due Date", 0, 4))
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
                    column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(HdrOrderNo_SalesInvHdr; "Sales Invoice Header"."Order No.")
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
                    column(DocDate_SalesInvHdr; Format("Sales Invoice Header"."Document Date", 0, 4))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo_SalesInvHdr; Format("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(PaymentTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCptn; CompanyInfoVATRegNoCptnLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCptn; CompanyInfoBankNameCptnLbl)
                    {
                    }
                    column(CompanyInfoBankAccNoCptn; CompanyInfoBankAccNoCptnLbl)
                    {
                    }
                    column(SalesInvDueDateCaption; SalesInvDueDateCaptionLbl)
                    {
                    }
                    column(InvNoCaption; InvNoCaptionLbl)
                    {
                    }
                    column(SalesInvPostingDateCptn; SalesInvPostingDateCptnLbl)
                    {
                    }
                    column(BilltoCustNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    ///// Added Fields from Page <<
                    ///// Captions <<
                    // column(No_SalesInvHdr; "Sales Invoice Header".FieldCaption("No.")) { }
                    column(SelltoCustomerName_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Customer Name")) { }
                    column(SelltoAddress_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Address")) { }
                    column(SelltoAddress2_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Address 2")) { }
                    column(SelltoCity_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to City")) { }
                    column(SelltoCounty_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to County")) { }
                    column(SelltoPostCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Post Code")) { }
                    column(SelltoCountryRegionCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Country/Region Code")) { }
                    column(SelltoContactNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Contact No.")) { }
                    column(SelltoContact_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Contact")) { }
                    column(YourReference_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Your Reference")) { }
                    column(DocumentDate_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Document Date")) { }
                    // column(PostingDate_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Posting Date")) { }
                    // column(DueDate_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Due Date")) { }

                    column(DocumentExchangeStatus_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Document Exchange Status")) { }
                    column(QuoteNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Quote No.")) { }
                    column(OrderNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Order No.")) { }
                    column(PreAssignedNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Pre-Assigned No.")) { }
                    column(ExternalDocumentNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("External Document No.")) { }
                    column(SalespersonCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Salesperson Code")) { }
                    column(ResponsibilityCenter_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Responsibility Center")) { }
                    column(NoPrinted_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("No. Printed")) { }
                    column(Cancelled_SalesInvHeaderCaption; "Sales Invoice Header".FieldCaption(Cancelled)) { }
                    column(Corrective_SalesInvHeaderCaption; "Sales Invoice Header".FieldCaption(Corrective)) { }
                    column(Closed_SalesInvHeaderCaption; "Sales Invoice Header".FieldCaption(Closed)) { }
                    column(WorkDescription_SalesInvheaderCaption; "Sales Invoice Header".FieldCaption("Work Description")) { }
                    column(CurrencyCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Currency Code")) { }
                    column(ShipmentDate_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Shipment Date")) { }
                    column(PaymentTermsCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Payment Terms Code")) { }
                    column(PaymentMethodCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Payment Method Code")) { }
                    column(ShortcutDimension1Code_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Shortcut Dimension 1 Code")) { }
                    column(ShortcutDimension2Code_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Shortcut Dimension 2 Code")) { }
                    column(PaymentDiscountPercentage_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Payment Discount %")) { }
                    column(PmtDiscountDate_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Pmt. Discount Date")) { }
                    column(DirectDebitMandateID_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Direct Debit Mandate ID")) { }
                    column(TaxLiable_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Tax Liable")) { }
                    column(TaxAreaCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Tax Area Code")) { }
                    column(LocationCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Location Code")) { }
                    column(TransactionMode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Transaction Mode")) { }
                    column(BankAccount_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bank Account")) { }
                    column(ShipmentMethodCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Shipment Method Code")) { }
                    column(ShippingAgentCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Shipping Agent Code")) { }
                    column(PackageTrackingNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Package Tracking No.")) { }
                    column(ShiptoCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Code")) { }
                    column(ShiptoName_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Name")) { }
                    column(ShiptoAddress_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Address")) { }
                    column(ShiptoAddress2_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Address 2")) { }
                    column(Shiptoity_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to City")) { }
                    column(ShiptoCounty_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to County")) { }
                    column(ShiptoPostCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Post Code")) { }
                    column(ShiptoCountryRegionCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Country/Region Code")) { }
                    column(ShiptoContact_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Ship-to Contact")) { }
                    column(BilltoName_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Name")) { }
                    column(BilltoAddress_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Address")) { }
                    column(BilltoAddress2_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Address 2")) { }
                    column(BilltoCity_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to City")) { }
                    column(BilltoCounty_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to County")) { }
                    column(BilltoPostCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Post Code")) { }
                    column(BilltoCountryRegionCode_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Country/Region Code")) { }
                    column(BilltoContactNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Contact No.")) { }
                    column(BilltoContact_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Contact")) { }
                    column(EU3PartyTrade_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("EU 3-Party Trade")) { }
                    column(TransactionSpecification_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Transaction Specification")) { }
                    column(TransportMethod_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Transport Method")) { }
                    column(ExitPoint_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Exit Point")) { }
                    column(Area_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption(Area)) { }
                    ///// >>
                    /////
                    ///// Values <<
                    column(NoSalesInvHdr; "Sales Invoice Header"."No.") { }
                    column(SelltoCustomerName_SalesInvHdr; "Sales Invoice Header"."Sell-to Customer Name") { }
                    column(SelltoAddress_SalesInvHdr; "Sales Invoice Header"."Sell-to Address") { }
                    column(SelltoAddress2_SalesInvHdr; "Sales Invoice Header"."Sell-to Address 2") { }
                    column(SelltoCity_SalesInvHdr; "Sales Invoice Header"."Sell-to City") { }
                    column(SelltoCounty_SalesInvHdr; "Sales Invoice Header"."Sell-to County") { }
                    column(SelltoPostCode_SalesInvHdr; "Sales Invoice Header"."Sell-to Post Code") { }
                    column(SelltoCountryRegionCode_SalesInvHdr; "Sales Invoice Header"."Sell-to Country/Region Code") { }
                    column(SelltoContactNo_SalesInvHdr; "Sales Invoice Header"."Sell-to Contact No.") { }
                    column(SelltoContact_SalesInvHdr; "Sales Invoice Header"."Sell-to Contact") { }
                    // column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference") { }
                    column(DocumentDate_SalesInvHdr; "Sales Invoice Header"."Document Date") { }
                    // column(PostingDate_SalesInvHdr; "Sales Invoice Header"."Posting Date") { }
                    // column(DueDate_SalesInvHdr; "Sales Invoice Header"."Due Date") { }

                    column(DocumentExchangeStatus_SalesInvHdr; "Sales Invoice Header"."Document Exchange Status") { }
                    column(QuoteNo_SalesInvHdr; "Sales Invoice Header"."Quote No.") { }
                    column(OrderNo_SalesInvHdr; "Sales Invoice Header"."Order No.") { }
                    column(PreAssignedNo_SalesInvHdr; "Sales Invoice Header"."Pre-Assigned No.") { }
                    column(ExternalDocumentNo_SalesInvHdr; "Sales Invoice Header"."External Document No.") { }
                    column(SalespersonCode_SalesInvHdr; "Sales Invoice Header"."Salesperson Code") { }
                    column(ResponsibilityCenter_SalesInvHdr; "Sales Invoice Header"."Responsibility Center") { }
                    column(NoPrinted_SalesInvHdr; "Sales Invoice Header"."No. Printed") { }
                    column(Cancelled_SalesInvHdr; "Sales Invoice Header".Cancelled) { }
                    column(Corrective_SalesInvHdr; "Sales Invoice Header".Corrective) { }
                    column(Closed_SalesInvHdr; "Sales Invoice Header".Closed) { }
                    column(WorkDescription_SalesInvHdr; "Sales Invoice Header".GetWorkDescription()) { }
                    column(CurrencyCode_SalesInvHdr; "Sales Invoice Header"."Currency Code") { }
                    column(ShipmentDate_SalesInvHdr; "Sales Invoice Header"."Shipment Date") { }
                    column(PaymentTermsCode_SalesInvHdr; "Sales Invoice Header"."Payment Terms Code") { }
                    column(PaymentMethodCode_SalesInvHdr; "Sales Invoice Header"."Payment Method Code") { }
                    column(SelectedPayments; "Sales Invoice Header".GetSelectedPaymentsText) { }
                    column(ShortcutDimension1Code_SalesInvHdr; "Sales Invoice Header"."Shortcut Dimension 1 Code") { }
                    column(ShortcutDimension2Code_SalesInvHdr; "Sales Invoice Header"."Shortcut Dimension 2 Code") { }
                    column(PaymentDiscountPercentage_SalesInvHdr; "Sales Invoice Header"."Payment Discount %") { }
                    column(PmtDiscountDate_SalesInvHdr; "Sales Invoice Header"."Pmt. Discount Date") { }
                    column(DirectDebitMandateID_SalesInvHdr; "Sales Invoice Header"."Direct Debit Mandate ID") { }
                    column(TaxLiable_SalesInvHdr; "Sales Invoice Header"."Tax Liable") { }
                    column(TaxAreaCode_SalesInvHdr; "Sales Invoice Header"."Tax Area Code") { }
                    column(LocationCode_SalesInvHdr; "Sales Invoice Header"."Location Code") { }
                    column(TransactionMode_SalesInvHdr; "Sales Invoice Header"."Transaction Mode") { }
                    column(BankAccount_SalesInvHdr; "Sales Invoice Header"."Bank Account") { }
                    column(ShipmentMethodCode_SalesInvHdr; "Sales Invoice Header"."Shipment Method Code") { }
                    column(ShippingAgentCode_SalesInvHdr; "Sales Invoice Header"."Shipping Agent Code") { }
                    column(PackageTrackingNo_SalesInvHdr; "Sales Invoice Header"."Package Tracking No.") { }
                    column(ShiptoCode_SalesInvHdr; "Sales Invoice Header"."Ship-to Code") { }
                    column(ShiptoName_SalesInvHdr; "Sales Invoice Header"."Ship-to Name") { }
                    column(ShiptoAddress_SalesInvHdr; "Sales Invoice Header"."Ship-to Address") { }
                    column(ShiptoAddress2_SalesInvHdr; "Sales Invoice Header"."Ship-to Address 2") { }
                    column(Shiptoity_SalesInvHdr; "Sales Invoice Header"."Ship-to City") { }
                    column(ShiptoCounty_SalesInvHdr; "Sales Invoice Header"."Ship-to County") { }
                    column(ShiptoPostCode_SalesInvHdr; "Sales Invoice Header"."Ship-to Post Code") { }
                    column(ShiptoCountryRegionCode_SalesInvHdr; "Sales Invoice Header"."Ship-to Country/Region Code") { }
                    column(ShiptoContact_SalesInvHdr; "Sales Invoice Header"."Ship-to Contact") { }
                    column(BilltoName_SalesInvHdr; "Sales Invoice Header"."Bill-to Name") { }
                    column(BilltoAddress_SalesInvHdr; "Sales Invoice Header"."Bill-to Address") { }
                    column(BilltoAddress2_SalesInvHdr; "Sales Invoice Header"."Bill-to Address 2") { }
                    column(BilltoCity_SalesInvHdr; "Sales Invoice Header"."Bill-to City") { }
                    column(BilltoCounty_SalesInvHdr; "Sales Invoice Header"."Bill-to County") { }
                    column(BilltoPostCode_SalesInvHdr; "Sales Invoice Header"."Bill-to Post Code") { }
                    column(BilltoCountryRegionCode_SalesInvHdr; "Sales Invoice Header"."Bill-to Country/Region Code") { }
                    column(BilltoContactNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Contact No.") { }
                    column(BilltoContact_SalesInvHdr; "Sales Invoice Header"."Bill-to Contact") { }
                    column(EU3PartyTrade_SalesInvHdr; "Sales Invoice Header"."EU 3-Party Trade") { }
                    column(TransactionSpecification_SalesInvHdr; "Sales Invoice Header"."Transaction Specification") { }
                    column(TransportMethod_SalesInvHdr; "Sales Invoice Header"."Transport Method") { }
                    column(ExitPoint_SalesInvHdr; "Sales Invoice Header"."Exit Point") { }
                    column(Area_SalesInvHdr; "Sales Invoice Header".Area) { }
                    column(ACOProfileCode_SalesInvoiceLineCaption; "Sales Invoice Line".FieldCaption("ACO Profile Code")) { }
                    column(ACOProfileDescription_SalesInvoiceLineCaption; "Sales Invoice Line".FieldCaption("ACO Profile Description")) { }
                    column(ACOCustomerItemNo_SalesInvoiceLineCaption; "Sales Invoice Line".FieldCaption("ACO Customer Item No.")) { }
                    column(ACOProfileCustDescription_SalesInvoiceLineCaption; "Sales Invoice Line".FieldCaption("ACO Profile Cust. Description")) { }
                    column(ACONumberofMeters_ItemVariantCaption; ItemVariant.FieldCaption("ACO Number of Meters")) { }
                    column(ACONumberofUnits_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("ACO Number of Units")) { }
                    column(ACORejectBillableShipped_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("ACO Reject Billable Shipped")) { }
                    column(ACO_RejNotBillableShippedSalesInvLineCaption; "Sales Invoice Line".FieldCaption("ACO Rej. Not Billable Shipped")) { }
                    ///// >>
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
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
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt_SalesInvLine; "Line Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesInvLine; Description)
                        {
                        }
                        column(Desc2_SalesInvLine; "Description 2")
                        {
                        }
                        column(No_SalesInvLine; "No.")
                        {
                        }
                        column(Qty_SalesInvLine; Quantity)
                        {
                        }
                        column(UOM_SalesInvLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; "Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(Discount_SalesInvLine; "Line Discount %")
                        {
                        }
                        column(VATIdentifier_SalesInvLine; "VAT Identifier")
                        {
                        }
                        column(PostedShipmentDate; Format("Shipment Date"))
                        {
                        }
                        column(Type_SalesInvLine; Format(Type))
                        {
                        }
                        column(InvDiscLineAmt_SalesInvLine; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvDiscAmount; TotalInvDiscAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_SalesInvLine; Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Amount_AmtInclVAT; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmtAfterInvDiscAmt; -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT"))
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc_SalesInvHdr; "Sales Invoice Header"."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscOnVAT; TotalPaymentDiscOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_SalesInvLine; TotalInclVATText)
                        {
                        }
                        column(VATAmtText_SalesInvLine; VATAmountLine.VATAmountText)
                        {
                        }
                        column(DocNo_SalesInvLine; "Document No.")
                        {
                        }
                        column(LineNo_SalesInvLine; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(SalesInvLineDiscCaption; SalesInvLineDiscCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(LineAmtAfterInvDiscCptn; LineAmtAfterInvDiscCptnLbl)
                        {
                        }
                        column(Desc_SalesInvLineCaption; FieldCaption(Description))
                        {
                        }
                        column(No_SalesInvLineCaption; FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesInvLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesInvLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_SalesInvLineCaption; FieldCaption("VAT Identifier"))
                        {
                        }
                        column(IsLineWithTotals; LineNoWithTotal = "Line No.")
                        {
                        }
                        ///// Fields on Subform Page
                        ///// Captions <<
                        // column(FilteredTypeField_SalesInvLineCaption; "Sales Invoice Line".FormatType)) { }
                        // column(No_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("No.")) { }
                        column(CrossReferenceNo_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Item Reference No.")) { }
                        column(ICPartnerCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("IC Partner Code")) { }
                        column(VariantCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Variant Code")) { }
                        column(Description_SalesInvLineCaption; "Sales Invoice Line".FieldCaption(Description)) { }
                        column(ReturnReasonCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Return Reason Code")) { }
                        column(Quantity_SalesInvLineCaption; "Sales Invoice Line".FieldCaption(Quantity)) { }
                        column(UnitofMeasureCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Unit of Measure Code")) { }
                        column(UnitofMeasure_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Unit of Measure")) { }
                        // column(UnitCostLCY_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Unit Cost (LCY)) { }")) { }
                        // column(UnitPrice_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Unit Price")) { }
                        column(TaxLiable_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Tax Liable")) { }
                        column(TaxAreaCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Tax Area Code")) { }
                        column(TaxGroupCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Tax Group Code")) { }
                        column(LineDiscountPercentage_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Line Discount %")) { }
                        column(LineAmount_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Line Amount")) { }
                        column(LineDiscountAmount_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Line Discount Amount")) { }
                        column(AllowInvoiceDisc_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Allow Invoice Disc.")) { }
                        column(JobNo_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Job No.")) { }
                        column(JobTaskNo_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Job Task No.")) { }
                        column(JobContractEntryNo_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Job Contract Entry No.")) { }
                        column(AppltoItemEntry_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Appl.-to Item Entry")) { }
                        column(DeferralCode_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Deferral Code")) { }
                        column(ShortcutDimension1Code_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Shortcut Dimension 1 Code")) { }
                        column(ShortcutDimension2Code_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("Shortcut Dimension 2 Code")) { }
                        column(ShortcutDimCode3_SalesInvLineCaption; ShortcutDimCode3Dimension.Name) { }
                        column(ShortcutDimCode4_SalesInvLineCaption; ShortcutDimCode4Dimension.Name) { }
                        column(ShortcutDimCode5_SalesInvLineCaption; ShortcutDimCode5Dimension.Name) { }
                        column(ShortcutDimCode6_SalesInvLineCaption; ShortcutDimCode6Dimension.Name) { }
                        column(ShortcutDimCode7_SalesInvLineCaption; ShortcutDimCode7Dimension.Name) { }
                        column(ShortcutDimCode8_SalesInvLineCaption; ShortcutDimCode8Dimension.Name) { }
                        column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
                        column(ACOSawing_SalesInvLineCaption; "Sales Invoice Line".FieldCaption("ACO Sawing")) { }
                        ///// Captions >>
                        ///// Values <<
                        // column(Type_SalesInvLine; "Sales Invoice Line".Type) { }
                        column(FilteredTypeField_SalesInvLine; "Sales Invoice Line".FormatType) { }
                        // column(No_SalesInvLine; "Sales Invoice Line"."No.") { }
                        column(CrossReferenceNo_SalesInvLine; "Sales Invoice Line"."Item Reference No.") { }
                        column(ICPartnerCode_SalesInvLine; "Sales Invoice Line"."IC Partner Code") { }
                        column(VariantCode_SalesInvLine; "Sales Invoice Line"."Variant Code") { }
                        column(Description_SalesInvLine; "Sales Invoice Line".Description) { }
                        column(ReturnReasonCode_SalesInvLine; "Sales Invoice Line"."Return Reason Code") { }
                        column(Quantity_SalesInvLine; "Sales Invoice Line".Quantity) { }
                        column(UnitofMeasureCode_SalesInvLine; "Sales Invoice Line"."Unit of Measure Code") { }
                        column(UnitofMeasure_SalesInvLine; "Sales Invoice Line"."Unit of Measure") { }
                        // column(UnitCostLCY_SalesInvLine; "Sales Invoice Line"."Unit Cost (LCY) { }") { }
                        // column(UnitPrice_SalesInvLine; "Sales Invoice Line"."Unit Price") { }
                        column(TaxLiable_SalesInvLine; "Sales Invoice Line"."Tax Liable") { }
                        column(TaxAreaCode_SalesInvLine; "Sales Invoice Line"."Tax Area Code") { }
                        column(TaxGroupCode_SalesInvLine; "Sales Invoice Line"."Tax Group Code") { }
                        column(LineDiscountPercentage_SalesInvLine; "Sales Invoice Line"."Line Discount %") { }
                        column(LineAmount_SalesInvLine; "Sales Invoice Line"."Line Amount") { }
                        column(LineDiscountAmount_SalesInvLine; "Sales Invoice Line"."Line Discount Amount") { }
                        column(AllowInvoiceDisc_SalesInvLine; "Sales Invoice Line"."Allow Invoice Disc.") { }
                        column(JobNo_SalesInvLine; "Sales Invoice Line"."Job No.") { }
                        column(JobTaskNo_SalesInvLine; "Sales Invoice Line"."Job Task No.") { }
                        column(JobContractEntryNo_SalesInvLine; "Sales Invoice Line"."Job Contract Entry No.") { }
                        column(AppltoItemEntry_SalesInvLine; "Sales Invoice Line"."Appl.-to Item Entry") { }
                        column(DeferralCode_SalesInvLine; "Sales Invoice Line"."Deferral Code") { }
                        column(ShortcutDimension1Code_SalesInvLine; "Sales Invoice Line"."Shortcut Dimension 1 Code") { }
                        column(ShortcutDimension2Code_SalesInvLine; "Sales Invoice Line"."Shortcut Dimension 2 Code") { }
                        column(ShortcutDimCode3_SalesInvLine; ShortcutDimCode[3]) { }
                        column(ShortcutDimCode4_SalesInvLine; ShortcutDimCode[4]) { }
                        column(ShortcutDimCode5_SalesInvLine; ShortcutDimCode[5]) { }
                        column(ShortcutDimCode6_SalesInvLine; ShortcutDimCode[6]) { }
                        column(ShortcutDimCode7_SalesInvLine; ShortcutDimCode[7]) { }
                        column(ShortcutDimCode8_SalesInvLine; ShortcutDimCode[8]) { }
                        column(ACOProfileCode_SalesInvoiceLine; "Sales Invoice Line"."ACO Profile Code") { }
                        column(ACOProfileDescription_SalesInvoiceLine; "Sales Invoice Line"."ACO Profile Description") { }
                        column(ACOCustomerItemNo_SalesInvoiceLine; "Sales Invoice Line"."ACO Customer Item No.") { }
                        column(ACOProfileCustDescription_SalesInvoiceLine; "Sales Invoice Line"."ACO Profile Cust. Description") { }
                        column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                        column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                        column(ACOSawing_SalesInvLine; "Sales Invoice Line"."ACO Sawing") { }
                        column(ACORejectBillableShipped_SalesInvLine; "Sales Invoice Line"."ACO Reject Billable Shipped") { }
                        column(ACO_RejNotBillableShippedSalesInvLine; "Sales Invoice Line"."ACO Rej. Not Billable Shipped") { }
                        ///// Values >>
                        dataitem("Sales Shipment Buffer"; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(SalesShptBufferPostDate; Format(SalesShipmentBuffer."Posting Date"))
                            {
                            }
                            column(SalesShptBufferQty; SalesShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(ShipmentCaption; ShipmentCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    SalesShipmentBuffer.Find('-')
                                else
                                    SalesShipmentBuffer.Next;
                            end;

                            trigger OnPreDataItem()
                            begin
                                SalesShipmentBuffer.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                                SalesShipmentBuffer.SetRange("Line No.", "Sales Invoice Line"."Line No.");

                                SetRange(Number, 1, SalesShipmentBuffer.Count);
                            end;
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText_DimLoop; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
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
                                    CurrReport.Break();

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(TempPostedAsmLineNo; BlanksForIndent + TempPostedAsmLine."No.")
                            {
                            }
                            column(TempPostedAsmLineQuantity; TempPostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(TempPostedAsmLineDesc; BlanksForIndent + TempPostedAsmLine.Description)
                            {
                            }
                            column(TempPostAsmLineVartCode; BlanksForIndent + TempPostedAsmLine."Variant Code")
                            {
                            }
                            column(TempPostedAsmLineUOM; GetUOMText(TempPostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                ItemTranslation: Record "Item Translation";
                            begin
                                if Number = 1 then
                                    TempPostedAsmLine.FindSet
                                else
                                    TempPostedAsmLine.Next;

                                if ItemTranslation.Get(TempPostedAsmLine."No.",
                                     TempPostedAsmLine."Variant Code",
                                     "Sales Invoice Header"."Language Code")
                                then
                                    TempPostedAsmLine.Description := ItemTranslation.Description;
                            end;

                            trigger OnPreDataItem()
                            begin
                                Clear(TempPostedAsmLine);
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                CollectAsmInformation;
                                Clear(TempPostedAsmLine);
                                SetRange(Number, 1, TempPostedAsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            InitializeShipmentBuffer;
                            if (Type = Type::"G/L Account") and (not ShowInternalInfo) then
                                "No." := '';

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
                            VATAmountLine.InsertLine;
                            CalcVATAmountLineLCY(
                              "Sales Invoice Header", VATAmountLine, TempVATAmountLineLCY,
                              VATBaseRemainderAfterRoundingLCY, AmtInclVATRemainderAfterRoundingLCY);

                            TotalSubTotal += "Line Amount";
                            TotalInvDiscAmount -= "Inv. Discount Amount";
                            TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");

                            if not ItemVariant.Get("Sales Invoice Line"."No.", "Sales Invoice Line"."Variant Code") then
                                Clear(ItemVariant);

                            if not ACOProfile.Get("ACO Profile Code") then
                                Clear(ACOProfile);
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DeleteAll();
                            TempVATAmountLineLCY.DeleteAll();
                            VATBaseRemainderAfterRoundingLCY := 0;
                            AmtInclVATRemainderAfterRoundingLCY := 0;
                            SalesShipmentBuffer.Reset();
                            SalesShipmentBuffer.DeleteAll();
                            FirstValueEntryNo := 0;
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            LineNoWithTotal := "Line No.";
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPer; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtSpecificationCptn; VATAmtSpecificationCptnLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmtCaption; LineAmtCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VATClauseEntryCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATClauseCode; VATAmountLine."VAT Clause Code")
                        {
                        }
                        column(VATClauseDescription; VATClause.Description)
                        {
                        }
                        column(VATClauseDescription2; VATClause."Description 2")
                        {
                        }
                        column(VATClauseAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATClausesCaption; VATClausesCap)
                        {
                        }
                        column(VATClauseVATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(VATClauseVATAmtCaption; VATAmtCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            if not VATClause.Get(VATAmountLine."VAT Clause Code") then
                                CurrReport.Skip();
                            VATClause.GetDescription("Sales Invoice Header");
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(VATClause);
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VatCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
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
                        column(VATPer_VATCounterLCY; TempVATAmountLineLCY."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATCounterLCY; TempVATAmountLineLCY."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            TempVATAmountLineLCY.GetLine(Number);
                            VALVATBaseLCY := TempVATAmountLineLCY."VAT Base";
                            VALVATAmountLCY := TempVATAmountLineLCY."Amount Including VAT" - TempVATAmountLineLCY."VAT Base";
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Invoice Header"."Currency Code" = '')
                            then
                                CurrReport.Break();

                            SetRange(Number, 1, VATAmountLine.Count);
                            Clear(VALVATBaseLCY);
                            Clear(VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code", 1);
                            CalculatedExchRate := Round(1 / "Sales Invoice Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := StrSubstNo(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(PaymentReportingArgument; "Payment Reporting Argument")
                    {
                        DataItemTableView = SORTING(Key);
                        UseTemporary = true;
                        column(PaymentServiceLogo; Logo)
                        {
                        }
                        column(PaymentServiceURLText; "URL Caption")
                        {
                        }
                        column(PaymentServiceURL; GetTargetURL)
                        {
                        }

                        trigger OnPreDataItem()
                        var
                            PaymentServiceSetup: Record "Payment Service Setup";
                        begin
                            PaymentServiceSetup.CreateReportingArgs(PaymentReportingArgument, "Sales Invoice Header");
                            if IsEmpty then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesInvHdr; "Sales Invoice Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(LineFee; "Integer")
                    {
                        DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 ..));
                        column(LineFeeCaptionLbl; TempLineFeeNoteOnReportHist.ReportText)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if not DisplayAdditionalFeeNote then
                                CurrReport.Break();

                            if Number = 1 then begin
                                if not TempLineFeeNoteOnReportHist.FindSet then
                                    CurrReport.Break
                            end else
                                if TempLineFeeNoteOnReportHist.Next = 0 then
                                    CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;

                    TotalSubTotal := 0;
                    TotalInvDiscAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscOnVAT := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales Inv.-Printed", "Sales Invoice Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + Cust."Invoice Copies" + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            //            var
            //                Handled: Boolean;
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Invoice Header");
                FormatDocumentFields("Sales Invoice Header");

                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                GetLineFeeNoteOnReportHist("No.");

                OnAfterGetRecordSalesInvoiceHeader("Sales Invoice Header");
                // OnGetReferenceText("Sales Invoice Header", ReferenceText, Handled);
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Invoice Header");
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
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Additional Fee Note';
                        ToolTip = 'Specifies that any notes about additional fees are included on the document.';
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
        SalesSetup.Get();
        CompanyInfo.Get();
        CompanyInfo.VerifyAndSetPaymentInfo;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Invoice Header".FindSet then
                repeat
                    if "Sales Invoice Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Contact,
                          "Sales Invoice Header"."Bill-to Contact No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Customer,
                          "Sales Invoice Header"."Bill-to Customer No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '');
                until "Sales Invoice Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text004: Label 'Sales - Invoice %1', Comment = '%1 = Document No.';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        Cust: Record Customer;
        VATAmountLine: Record "VAT Amount Line" temporary;
        TempVATAmountLineLCY: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        VATClause: Record "VAT Clause";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        ShortcutDimCode3Dimension: Record Dimension;
        ShortcutDimCode4Dimension: Record Dimension;
        ShortcutDimCode5Dimension: Record Dimension;
        ShortcutDimCode6Dimension: Record Dimension;
        ShortcutDimCode7Dimension: Record Dimension;
        ShortcutDimCode8Dimension: Record Dimension;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShortcutDimCode: array[8] of Code[20];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCptnLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCptnLbl: Label 'Bank';
        CompanyInfoBankAccNoCptnLbl: Label 'Account No.';
        SalesInvDueDateCaptionLbl: Label 'Due Date';
        InvNoCaptionLbl: Label 'Invoice No.';
        SalesInvPostingDateCptnLbl: Label 'Posting Date';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        SalesInvLineDiscCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        VATClausesCap: Label 'VAT Clause';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        SubtotalCaptionLbl: Label 'Subtotal';
        LineAmtAfterInvDiscCptnLbl: Label 'Payment Discount on VAT';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecificationCptnLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        InvDiscountAmtCaptionLbl: Label 'Invoice Discount Amount';
        DocumentDateCaptionLbl: Label 'Document Date';
        PaymentTermsDescCaptionLbl: Label 'Payment Terms';
        ShptMethodDescCaptionLbl: Label 'Shipment Method';
        VATPercentageCaptionLbl: Label 'VAT %';
        TotalCaptionLbl: Label 'Total';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        HomePageCaptionLbl: Label 'Home Page';
        EMailCaptionLbl: Label 'Email';
        DisplayAdditionalFeeNote: Boolean;
        LineNoWithTotal: Integer;
        VATBaseRemainderAfterRoundingLCY: Decimal;
        AmtInclVATRemainderAfterRoundingLCY: Decimal;

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitializeShipmentBuffer()
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        TempSalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        if "Sales Invoice Line"."Shipment No." <> '' then
            if SalesShipmentHeader.Get("Sales Invoice Line"."Shipment No.") then
                exit;

        if "Sales Invoice Header"."Order No." = '' then
            exit;

        case "Sales Invoice Line".Type of
            "Sales Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Invoice Line");
            "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
          "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
                GenerateBufferFromShipment("Sales Invoice Line");
        end;

        SalesShipmentBuffer.Reset();
        SalesShipmentBuffer.SetRange("Document No.", "Sales Invoice Line"."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", "Sales Invoice Line"."Line No.");
        if SalesShipmentBuffer.Find('-') then begin
            TempSalesShipmentBuffer := SalesShipmentBuffer;
            if SalesShipmentBuffer.Next = 0 then begin
                SalesShipmentBuffer.Get(
                  TempSalesShipmentBuffer."Document No.", TempSalesShipmentBuffer."Line No.", TempSalesShipmentBuffer."Entry No.");
                SalesShipmentBuffer.Delete();
                exit;
            end;
            SalesShipmentBuffer.CalcSums(Quantity);
            if SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity then begin
                SalesShipmentBuffer.DeleteAll();
                exit;
            end;
        end;
    end;

    local procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SetCurrentKey("Document No.");
        ValueEntry.SetRange("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SetRange("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SetRange("Item Charge No.", '');
        ValueEntry.SetFilter("Entry No.", '%1..', FirstValueEntryNo);
        if ValueEntry.Find('-') then
            repeat
                if ItemLedgerEntry.Get(ValueEntry."Item Ledger Entry No.") then begin
                    if SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 then
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    else
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                end;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            until (ValueEntry.Next = 0) or (TotalQuantity = 0);
    end;

    local procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SetCurrentKey("Order No.");
        SalesInvoiceHeader.SetFilter("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SetRange("Order No.", "Sales Invoice Header"."Order No.");
        if SalesInvoiceHeader.Find('-') then
            repeat
                SalesInvoiceLine2.SetRange("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SetRange("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SetRange(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SetRange("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SetRange("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                if SalesInvoiceLine2.Find('-') then
                    repeat
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    until SalesInvoiceLine2.Next = 0;
            until SalesInvoiceHeader.Next = 0;

        SalesShipmentLine.SetCurrentKey("Order No.", "Order Line No.");
        SalesShipmentLine.SetRange("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SetRange("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SetRange("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SetRange(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SetRange("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SetRange("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SetFilter(Quantity, '<>%1', 0);

        if SalesShipmentLine.Find('-') then
            repeat
                if "Sales Invoice Header"."Get Shipment Used" then
                    CorrectShipment(SalesShipmentLine);
                if Abs(SalesShipmentLine.Quantity) <= Abs(TotalQuantity - SalesInvoiceLine.Quantity) then
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                else begin
                    if Abs(SalesShipmentLine.Quantity) > Abs(TotalQuantity) then
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    if SalesShipmentHeader.Get(SalesShipmentLine."Document No.") then
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                end;
            until (SalesShipmentLine.Next = 0) or (TotalQuantity = 0);
    end;

    local procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SetCurrentKey("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SetRange("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SetRange("Shipment Line No.", SalesShipmentLine."Line No.");
        if SalesInvoiceLine.Find('-') then
            repeat
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            until SalesInvoiceLine.Next = 0;
    end;

    local procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SetRange("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SetRange("Posting Date", PostingDate);
        if SalesShipmentBuffer.Find('-') then begin
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.Modify();
            exit;
        end;

        SalesShipmentBuffer."Document No." := SalesInvoiceLine."Document No.";
        SalesShipmentBuffer."Line No." := SalesInvoiceLine."Line No.";
        SalesShipmentBuffer."Entry No." := NextEntryNo;
        SalesShipmentBuffer.Type := SalesInvoiceLine.Type;
        SalesShipmentBuffer."No." := SalesInvoiceLine."No.";
        SalesShipmentBuffer.Quantity := QtyOnShipment;
        SalesShipmentBuffer."Posting Date" := PostingDate;
        SalesShipmentBuffer.Insert();
        NextEntryNo := NextEntryNo + 1
    end;

    local procedure DocumentCaption(): Text[250]
    var
        DocCaption: Text;
    begin
        OnBeforeGetDocumentCaption("Sales Invoice Header", DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);
        if "Sales Invoice Header"."Prepayment Invoice" then
            exit(Text010);
        exit(Text004);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatDocument.SetTotalLabels(SalesInvoiceHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
        FormatDocument.SetSalesPerson(SalesPurchPerson, SalesInvoiceHeader."Salesperson Code", SalesPersonText);
        FormatDocument.SetPaymentTerms(PaymentTerms, SalesInvoiceHeader."Payment Terms Code", SalesInvoiceHeader."Language Code");
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesInvoiceHeader."Shipment Method Code", SalesInvoiceHeader."Language Code");

        OrderNoText := FormatDocument.SetText(SalesInvoiceHeader."Order No." <> '', SalesInvoiceHeader.FieldCaption("Order No."));
        ReferenceText := FormatDocument.SetText(SalesInvoiceHeader."Your Reference" <> '', SalesInvoiceHeader.FieldCaption(SalesInvoiceHeader."Your Reference"));
        VATNoText := FormatDocument.SetText(SalesInvoiceHeader."VAT Registration No." <> '', SalesInvoiceHeader.FieldCaption("VAT Registration No."));
    end;

    local procedure FormatAddressFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatAddr.GetCompanyAddr(SalesInvoiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesInvBillTo(CustAddr, SalesInvoiceHeader);
        ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, SalesInvoiceHeader);
    end;

    local procedure CollectAsmInformation()
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        TempPostedAsmLine.DeleteAll();
        if "Sales Invoice Line".Type <> "Sales Invoice Line".Type::Item then
            exit;

        ValueEntry.SetCurrentKey("Document No.");
        ValueEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
        ValueEntry.SetRange("Document Type", ValueEntry."Document Type"::"Sales Invoice");
        ValueEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
        ValueEntry.SetRange(Adjustment, false);
        if not ValueEntry.FindSet() then
            exit;

        repeat
            if ItemLedgerEntry.Get(ValueEntry."Item Ledger Entry No.") then
                if ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" then begin
                    SalesShipmentLine.Get(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
                    if SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) then begin
                        PostedAsmLine.SetRange("Document No.", PostedAsmHeader."No.");
                        if PostedAsmLine.FindSet then
                            repeat
                                TreatAsmLineBuffer(PostedAsmLine);
                            until PostedAsmLine.Next = 0;
                    end;
                end;
        until ValueEntry.Next = 0;
    end;

    local procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line")
    begin
        Clear(TempPostedAsmLine);
        TempPostedAsmLine.SetRange(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SetRange("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SetRange("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SetRange(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SetRange("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        if TempPostedAsmLine.FindFirst then begin
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.Modify();
        end else begin
            Clear(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.Insert();
        end;
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
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

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
    var
        LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist.";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
    begin
        TempLineFeeNoteOnReportHist.DeleteAll();
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SetRange("Document No.", SalesInvoiceHeaderNo);
        if not CustLedgerEntry.FindFirst then
            exit;

        if not Customer.Get(CustLedgerEntry."Customer No.") then
            exit;

        LineFeeNoteOnReportHist.SetRange("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SetRange("Language Code", Customer."Language Code");
        if LineFeeNoteOnReportHist.FindSet then begin
            repeat
                InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
            until LineFeeNoteOnReportHist.Next = 0;
        end else begin
            LineFeeNoteOnReportHist.SetRange("Language Code", Language.GetUserLanguageCode);
            if LineFeeNoteOnReportHist.FindSet then
                repeat
                    InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
                until LineFeeNoteOnReportHist.Next = 0;
        end;
    end;

    local procedure CalcVATAmountLineLCY(SalesInvoiceHeader: Record "Sales Invoice Header"; TempVATAmountLine2: Record "VAT Amount Line" temporary; var TempVATAmountLineLCY2: Record "VAT Amount Line" temporary; var VATBaseRemainderAfterRoundingLCY2: Decimal; var AmtInclVATRemainderAfterRoundingLCY2: Decimal)
    var
        VATBaseLCY: Decimal;
        AmtInclVATLCY: Decimal;
    begin
        if (not GLSetup."Print VAT specification in LCY") or
           (SalesInvoiceHeader."Currency Code" = '')
        then
            exit;

        TempVATAmountLineLCY2.Init();
        TempVATAmountLineLCY2 := TempVATAmountLine2;
        VATBaseLCY :=
          CurrExchRate.ExchangeAmtFCYToLCY(
            SalesInvoiceHeader."Posting Date", SalesInvoiceHeader."Currency Code", TempVATAmountLine2."VAT Base", SalesInvoiceHeader."Currency Factor") +
          VATBaseRemainderAfterRoundingLCY2;
        AmtInclVATLCY :=
          CurrExchRate.ExchangeAmtFCYToLCY(
            SalesInvoiceHeader."Posting Date", SalesInvoiceHeader."Currency Code", TempVATAmountLine2."Amount Including VAT", SalesInvoiceHeader."Currency Factor") +
          AmtInclVATRemainderAfterRoundingLCY2;
        TempVATAmountLineLCY2."VAT Base" := Round(VATBaseLCY);
        TempVATAmountLineLCY2."Amount Including VAT" := Round(AmtInclVATLCY);
        TempVATAmountLineLCY2.InsertLine;

        VATBaseRemainderAfterRoundingLCY2 := VATBaseLCY - TempVATAmountLineLCY2."VAT Base";
        AmtInclVATRemainderAfterRoundingLCY2 := AmtInclVATLCY - TempVATAmountLineLCY2."Amount Including VAT";
    end;

    local procedure InsertTempLineFeeNoteOnReportHist(var LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist."; var TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary)
    begin
        repeat
            TempLineFeeNoteOnReportHist.Init();
            TempLineFeeNoteOnReportHist.Copy(LineFeeNoteOnReportHist);
            TempLineFeeNoteOnReportHist.Insert();
        until TempLineFeeNoteOnReportHist.Next = 0;
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterGetRecordSalesInvoiceHeader(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetDocumentCaption(SalesInvoiceHeader: Record "Sales Invoice Header"; var DocCaption: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('OnPrem')]
    procedure OnGetReferenceText(SalesInvoiceHeader: Record "Sales Invoice Header"; var ReferenceText: Text[80]; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin

    end;
}

