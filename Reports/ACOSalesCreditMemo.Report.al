report 50011 "ACO Sales - Credit Memo"
{
    RDLCLayout = './StandardSalesCreditMemo.rdlc';
    // WordLayout = './StandardSalesCreditMemo.docx';
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
            column(No_SalesCrMemoHeader; "No.")
            {
            }
            column(VATAmtLineVATCptn; VATAmtLineVATCptnLbl)
            {
            }
            column(VATAmtLineVATBaseCptn; VATAmtLineVATBaseCptnLbl)
            {
            }
            column(VATAmtLineVATAmtCptn; VATAmtLineVATAmtCptnLbl)
            {
            }
            column(VATAmtLineVATIdentifierCptn; VATAmtLineVATIdentifierCptnLbl)
            {
            }
            column(TotalCptn; TotalCptnLbl)
            {
            }
            column(SalesCrMemoLineDiscCaption; SalesCrMemoLineDiscCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(DocCptnCopyTxt; StrSubstNo(DocumentCaption, CopyText))
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
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
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
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostDate_SalesCrMemoHeader; Format("Sales Cr.Memo Header"."Posting Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."VAT Registration No.")
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(AppliedToText; AppliedToText)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesCrMemoHeader; "Sales Cr.Memo Header"."Your Reference")
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
                    column(DocDt_SalesCrMemoHeader; Format("Sales Cr.Memo Header"."Document Date", 0, 4))
                    {
                    }
                    column(PriceInclVAT_SalesCrMemoHeader; "Sales Cr.Memo Header"."Prices Including VAT")
                    {
                    }
                    column(ReturnOrderNoText; ReturnOrderNoText)
                    {
                    }
                    column(ReturnOrdNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Return Order No.")
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; Format("Sales Cr.Memo Header"."Prices Including VAT"))
                    {
                    }
                    column(VATBaseDiscPrc_SalesCrMemoLine; "Sales Cr.Memo Header"."VAT Base Discount %")
                    {
                    }
                    column(CompanyInfoPhoneNoCptn; CompanyInfoPhoneNoCptnLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCptn; CompanyInfoVATRegNoCptnLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCptn; CompanyInfoGiroNoCptnLbl)
                    {
                    }
                    column(CompanyInfoBankNameCptn; CompanyInfoBankNameCptnLbl)
                    {
                    }
                    column(CompanyInfoBankAccNoCptn; CompanyInfoBankAccNoCptnLbl)
                    {
                    }
                    column(No1_SalesCrMemoHeaderCptn; No1_SalesCrMemoHeaderCptnLbl)
                    {
                    }
                    column(SalesCrMemoHeaderPostDtCptn; SalesCrMemoHeaderPostDtCptnLbl)
                    {
                    }
                    column(DocumentDate; DocumentDateLbl)
                    {
                    }
                    column(CompanyInfoHomePageCaption; CompanyInfoHomePageCaptionLbl)
                    {
                    }
                    column(CompanyINfoEmailCaption; CompanyINfoEmailCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PriceInclVAT_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Prices Including VAT"))
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
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Num; Number)
                        {
                        }
                        column(HeaderDimCptn; HeaderDimCptnLbl)
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
                    dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt_SalesCrMemoLine; "Line Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesCrMemoLine; Description)
                        {
                        }
                        column(No_SalesCrMemoLine; "No.")
                        {
                        }
                        column(Qty_SalesCrMemoLine; Quantity)
                        {
                        }
                        column(UOM_SalesCrMemoLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesCrMemoLine; "Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(Disc_SalesCrMemoLine; "Line Discount %")
                        {
                        }
                        column(VATIdentif_SalesCrMemoLine; "VAT Identifier")
                        {
                        }
                        column(PostedReceiptDate; Format("Shipment Date"))
                        {
                        }
                        column(Type_SalesCrMemoLine; Format(Type))
                        {
                        }
                        column(NNCTotalLineAmt; NNC_TotalLineAmount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalAmtInclVat; NNC_TotalAmountInclVat)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalInvDiscAmt_SalesCrMemoLine; NNC_TotalInvDiscAmount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalAmt; NNC_TotalAmount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(InvDiscAmt_SalesCrMemoLine; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amt_SalesCrMemoLine; Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmtLineVATAmtTxt; VATAmountLine.VATAmountText)
                        {
                        }
                        column(LineAmtInvDiscAmt_SalesCrMemoLine; -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT"))
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineNo_SalesCrMemoLine; "Line No.")
                        {
                        }
                        column(UnitPriceCptn; UnitPriceCptnLbl)
                        {
                        }
                        column(AmountCptn; AmountCptnLbl)
                        {
                        }
                        column(PostedReceiptDateCptn; PostedReceiptDateCptnLbl)
                        {
                        }
                        column(InvDiscAmt_SalesCrMemoLineCptn; InvDiscAmt_SalesCrMemoLineCptnLbl)
                        {
                        }
                        column(SubtotalCptn; SubtotalCptnLbl)
                        {
                        }
                        column(LineAmtInvDiscAmt_SalesCrMemoLineCptn; LineAmtInvDiscAmt_SalesCrMemoLineCptnLbl)
                        {
                        }
                        column(Desc_SalesCrMemoLineCaption; FieldCaption(Description))
                        {
                        }
                        column(No_SalesCrMemoLineCaption; FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesCrMemoLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesCrMemoLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdentif_SalesCrMemoLineCaption; FieldCaption("VAT Identifier"))
                        {
                        }
                        ///// Fields on Subform Page
                        ///// Captions <<
                        column(Type_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption(Type)) { }
                        // column(No_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("No.")) { }
                        column(CrossReferenceNo_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Item Reference No.")) { }
                        column(ICPartnerCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("IC Partner Code")) { }
                        column(VariantCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Variant Code")) { }
                        column(Description_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption(Description)) { }
                        column(ReturnReasonCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Return Reason Code")) { }
                        column(Quantity_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption(Quantity)) { }
                        column(UnitofMeasureCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Unit of Measure Code")) { }
                        column(UnitofMeasure_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Unit of Measure")) { }
                        column(UnitCostLCY_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Unit Cost (LCY)")) { }
                        column(UnitPrice_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Unit Price")) { }
                        column(TaxLiable_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Tax Liable")) { }
                        column(TaxAreaCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Tax Area Code")) { }
                        column(TaxGroupCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Tax Group Code")) { }
                        column(LineAmount_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Line Amount")) { }
                        column(LineDiscountPercentage_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Line Discount %")) { }
                        column(LineDiscountAmount_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Line Discount Amount")) { }
                        column(AllowInvoiceDisc_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Allow Invoice Disc.")) { }
                        column(JobNo_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Job No.")) { }
                        column(JobTaskNo_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Job Task No.")) { }
                        column(ApplfromItemEntry_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Appl.-from Item Entry")) { }
                        column(AppltoItemEntry_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Appl.-to Item Entry")) { }
                        column(DeferralCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Deferral Code")) { }
                        column(ShortcutDimension1Code_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Shortcut Dimension 1 Code")) { }
                        column(ShortcutDimension2Code_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("Shortcut Dimension 2 Code")) { }
                        column(ShortcutDimCode3_SalesCrMemoLineCaption; ShortcutDimCode3Dimension.Name) { }
                        column(ShortcutDimCode4_SalesCrMemoLineCaption; ShortcutDimCode4Dimension.Name) { }
                        column(ShortcutDimCode5_SalesCrMemoLineCaption; ShortcutDimCode5Dimension.Name) { }
                        column(ShortcutDimCode6_SalesCrMemoLineCaption; ShortcutDimCode6Dimension.Name) { }
                        column(ShortcutDimCode7_SalesCrMemoLineCaption; ShortcutDimCode7Dimension.Name) { }
                        column(ShortcutDimCode8_SalesCrMemoLineCaption; ShortcutDimCode8Dimension.Name) { }
                        column(ACOProfileDescription_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("ACO Profile Description")) { }
                        column(ACOCustomerItemNo_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("ACO Customer Item No.")) { }
                        column(ACOProfileCustDescription_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("ACO Profile Cust. Description")) { }
                        column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
                        column(ACOSawing_SalesCrMemoLineCaption; "Sales Cr.Memo Line".FieldCaption("ACO Sawing")) { }
                        column(ACOProfileCode_SalesCrMemoLineCaption; "Sales Cr.Memo Line"."ACO Profile Code") { }
                        column(ACONumberofMeters_ItemVariantCaption; ItemVariant."ACO Number of Meters") { }
                        column(ACONumberofUnits_SalesCrMemoLineCaption; "Sales Cr.Memo Line"."ACO Number of Units") { }

                        ///// Captions >>
                        ///// Values <<
                        // column(Type_SalesCrMemoLine; "Sales Cr.Memo Line".Type) { }
                        column(FilteredTypeField_SalesCrMemoLine; "Sales Cr.Memo Line".FormatType) { }
                        // column(No_SalesCrMemoLine; "Sales Cr.Memo Line"."No.") { }
                        column(CrossReferenceNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Item Reference No.") { }
                        column(ICPartnerCode_SalesCrMemoLine; "Sales Cr.Memo Line"."IC Partner Code") { }
                        column(VariantCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Variant Code") { }
                        column(Description_SalesCrMemoLine; "Sales Cr.Memo Line".Description) { }
                        column(ReturnReasonCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Return Reason Code") { }
                        column(Quantity_SalesCrMemoLine; "Sales Cr.Memo Line".Quantity) { }
                        column(UnitofMeasureCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit of Measure Code") { }
                        column(UnitofMeasure_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit of Measure") { }
                        column(UnitCostLCY_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Cost (LCY)") { }
                        // column(UnitPrice_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Price") { }
                        column(TaxLiable_SalesCrMemoLine; "Sales Cr.Memo Line"."Tax Liable") { }
                        column(TaxAreaCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Tax Area Code") { }
                        column(TaxGroupCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Tax Group Code") { }
                        column(LineAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Amount") { }
                        column(LineDiscountPercentage_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Discount %") { }
                        column(LineDiscountAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Discount Amount") { }
                        column(AllowInvoiceDisc_SalesCrMemoLine; "Sales Cr.Memo Line"."Allow Invoice Disc.") { }
                        column(JobNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Job No.") { }
                        column(JobTaskNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Job Task No.") { }
                        column(ApplfromItemEntry_SalesCrMemoLine; "Sales Cr.Memo Line"."Appl.-from Item Entry") { }
                        column(AppltoItemEntry_SalesCrMemoLine; "Sales Cr.Memo Line"."Appl.-to Item Entry") { }
                        column(DeferralCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Deferral Code") { }
                        column(ShortcutDimension1Code_SalesCrMemoLine; "Sales Cr.Memo Line"."Shortcut Dimension 1 Code") { }
                        column(ShortcutDimension2Code_SalesCrMemoLine; "Sales Cr.Memo Line"."Shortcut Dimension 2 Code") { }
                        column(ShortcutDimCode3_SalesCrMemoLine; ShortcutDimCode[3]) { }
                        column(ShortcutDimCode4_SalesCrMemoLine; ShortcutDimCode[4]) { }
                        column(ShortcutDimCode5_SalesCrMemoLine; ShortcutDimCode[5]) { }
                        column(ShortcutDimCode6_SalesCrMemoLine; ShortcutDimCode[6]) { }
                        column(ShortcutDimCode7_SalesCrMemoLine; ShortcutDimCode[7]) { }
                        column(ShortcutDimCode8_SalesCrMemoLine; ShortcutDimCode[8]) { }
                        column(ACOProfileCode_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Profile Code") { }
                        column(ACOProfileDescription_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Profile Description") { }
                        column(ACOCustomerItemNo_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Customer Item No.") { }
                        column(ACOProfileCustDescription_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Profile Cust. Description") { }
                        column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                        column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                        column(ACOSawing_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Sawing") { }
                        column(ACONumberofUnits_SalesCrMemoLine; "Sales Cr.Memo Line"."ACO Number of Units") { }

                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText_DimensionLoop2; DimText)
                            {
                            }
                            column(LineDimCptn; LineDimCptnLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.Find('-') then
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

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            NNC_TotalLineAmount += "Line Amount";
                            NNC_TotalAmountInclVat += "Amount Including VAT";
                            NNC_TotalInvDiscAmount += "Inv. Discount Amount";
                            NNC_TotalAmount += Amount;

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

                            if not ACOProfile.Get("ACO Profile Code") then
                                Clear(ACOProfile);

                            if not ItemVariant.Get("ACO Profile Code") then
                                Clear(ItemVariant);
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DeleteAll();
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvoiceDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtSpecificationCptn; VATAmtSpecificationCptnLbl)
                        {
                        }
                        column(VATAmtLineInvDiscBaseAmtCptn; VATAmtLineInvDiscBaseAmtCptnLbl)
                        {
                        }
                        column(VATAmtLineLineAmtCptn; VATAmtLineLineAmtCptnLbl)
                        {
                        }
                        column(VATAmtLineInvoiceDiscAmtCptn; VATAmtLineInvoiceDiscAmtCptnLbl)
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
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATClausesCaption; VATClausesCap)
                        {
                        }
                        column(VATClauseVATIdentifierCaption; VATAmtLineVATIdentifierCptnLbl)
                        {
                        }
                        column(VATClauseVATAmtCaption; VATAmtLineVATAmtCptnLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            if not VATClause.Get(VATAmountLine."VAT Clause Code") then
                                CurrReport.Skip();
                            VATClause.GetDescription("Sales Cr.Memo Header");
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(VATClause);
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercent; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATCounterLCY; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code",
                                "Sales Cr.Memo Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code",
                                "Sales Cr.Memo Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Cr.Memo Header"."Currency Code" = '')
                            then
                                CurrReport.Break();

                            SetRange(Number, 1, VATAmountLine.Count);
                            Clear(VALVATBaseLCY);
                            Clear(VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text008 + Text009
                            else
                                VALSpecLCYHeader := Text008 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code", 1);
                            CalculatedExchRate := Round(1 / "Sales Cr.Memo Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := StrSubstNo(Text010, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Customer No.")
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
                        column(ShiptoAddressCptn; ShiptoAddressCptnLbl)
                        {
                        }
                        column(SelltoCustNo_SalesCrMemoHeaderCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
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

                    NNC_TotalLineAmount := 0;
                    NNC_TotalAmountInclVat := 0;
                    NNC_TotalInvDiscAmount := 0;
                    NNC_TotalAmount := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales Cr. Memo-Printed", "Sales Cr.Memo Header");
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

                FormatAddressFields("Sales Cr.Memo Header");
                FormatDocumentFields("Sales Cr.Memo Header");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                OnAfterGetRecordSalesCrMemoHeader("Sales Cr.Memo Header");
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Cr.Memo Header");
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
            LogInteraction := SegManagement.FindInteractTmplCode(6) <> '';
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

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Cr.Memo Header".FindSet then
                repeat
                    if "Sales Cr.Memo Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          6, "Sales Cr.Memo Header"."No.", 0, 0, DATABASE::Contact, "Sales Cr.Memo Header"."Bill-to Contact No.",
                          "Sales Cr.Memo Header"."Salesperson Code", "Sales Cr.Memo Header"."Campaign No.",
                          "Sales Cr.Memo Header"."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          6, "Sales Cr.Memo Header"."No.", 0, 0, DATABASE::Customer, "Sales Cr.Memo Header"."Sell-to Customer No.",
                          "Sales Cr.Memo Header"."Salesperson Code", "Sales Cr.Memo Header"."Campaign No.",
                          "Sales Cr.Memo Header"."Posting Description", '');
                until "Sales Cr.Memo Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text003: Label '(Applies to %1 %2)';
        Text005: Label 'Sales - Credit Memo %1', Comment = '%1 = Document No.';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        RespCenter: Record "Responsibility Center";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        VATAmountLine: Record "VAT Amount Line" temporary;
        VATClause: Record "VAT Clause";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        CurrExchRate: Record "Currency Exchange Rate";
        ItemVariant: Record "Item Variant";
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ShortcutDimCode3Dimension: Record Dimension;
        ShortcutDimCode4Dimension: Record Dimension;
        ShortcutDimCode5Dimension: Record Dimension;
        ShortcutDimCode6Dimension: Record Dimension;
        ShortcutDimCode7Dimension: Record Dimension;
        ShortcutDimCode8Dimension: Record Dimension;
        ACOProfile: Record "ACO Profile";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ReturnOrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        AppliedToText: Text;
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
        ShortcutDimCode: array[8] of Code[20];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        Text008: Label 'VAT Amount Specification in ';
        Text009: Label 'Local Currency';
        Text010: Label 'Exchange rate: %1/%2';
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        CalculatedExchRate: Decimal;
        Text011: Label 'Sales - Prepmt. Credit Memo %1';
        OutputNo: Integer;
        NNC_TotalLineAmount: Decimal;
        NNC_TotalAmountInclVat: Decimal;
        NNC_TotalInvDiscAmount: Decimal;
        NNC_TotalAmount: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        CompanyInfoPhoneNoCptnLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCptnLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCptnLbl: Label 'Giro No.';
        CompanyInfoBankNameCptnLbl: Label 'Bank';
        CompanyInfoBankAccNoCptnLbl: Label 'Account No.';
        No1_SalesCrMemoHeaderCptnLbl: Label 'Credit Memo No.';
        SalesCrMemoHeaderPostDtCptnLbl: Label 'Posting Date';
        DocumentDateLbl: Label 'Document Date';
        CompanyInfoHomePageCaptionLbl: Label 'Home Page';
        CompanyINfoEmailCaptionLbl: Label 'Email';
        HeaderDimCptnLbl: Label 'Header Dimensions';
        UnitPriceCptnLbl: Label 'Unit Price';
        AmountCptnLbl: Label 'Amount';
        PostedReceiptDateCptnLbl: Label 'Posted Return Receipt Date';
        InvDiscAmt_SalesCrMemoLineCptnLbl: Label 'Invoice Discount Amount';
        SubtotalCptnLbl: Label 'Subtotal';
        LineAmtInvDiscAmt_SalesCrMemoLineCptnLbl: Label 'Payment Discount on VAT';
        VATClausesCap: Label 'VAT Clause';
        LineDimCptnLbl: Label 'Line Dimensions';
        VATAmtSpecificationCptnLbl: Label 'VAT Amount Specification';
        VATAmtLineInvDiscBaseAmtCptnLbl: Label 'Invoice Discount Base Amount';
        VATAmtLineLineAmtCptnLbl: Label 'Line Amount';
        VATAmtLineInvoiceDiscAmtCptnLbl: Label 'Invoice Discount Amount';
        ShiptoAddressCptnLbl: Label 'Ship-to Address';
        VATAmtLineVATCptnLbl: Label 'VAT %';
        VATAmtLineVATBaseCptnLbl: Label 'VAT Base';
        VATAmtLineVATAmtCptnLbl: Label 'VAT Amount';
        VATAmtLineVATIdentifierCptnLbl: Label 'VAT Identifier';
        TotalCptnLbl: Label 'Total';
        SalesCrMemoLineDiscCaptionLbl: Label 'Discount %';

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(6) <> '';
    end;

    local procedure DocumentCaption(): Text[250]
    var
        DocCaption: Text[250];
    begin
        OnBeforeDocumentCaption("Sales Cr.Memo Header", DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);
        if "Sales Cr.Memo Header"."Prepayment Credit Memo" then
            exit(Text011);
        exit(Text005);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        FormatAddr.GetCompanyAddr(SalesCrMemoHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesCrMemoBillTo(CustAddr, SalesCrMemoHeader);
        ShowShippingAddr := FormatAddr.SalesCrMemoShipTo(ShipToAddr, CustAddr, SalesCrMemoHeader);
    end;

    local procedure FormatDocumentFields(SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        FormatDocument.SetTotalLabels(SalesCrMemoHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
        FormatDocument.SetSalesPerson(SalesPurchPerson, SalesCrMemoHeader."Salesperson Code", SalesPersonText);

        ReturnOrderNoText := FormatDocument.SetText(SalesCrMemoHeader."Return Order No." <> '', SalesCrMemoHeader.FieldCaption("Return Order No."));
        ReferenceText := FormatDocument.SetText(SalesCrMemoHeader."Your Reference" <> '', SalesCrMemoHeader.FieldCaption("Your Reference"));
        VATNoText := FormatDocument.SetText(SalesCrMemoHeader."VAT Registration No." <> '', SalesCrMemoHeader.FieldCaption("VAT Registration No."));
        AppliedToText :=
          FormatDocument.SetText(
            SalesCrMemoHeader."Applies-to Doc. No." <> '', Format(StrSubstNo(Text003, Format(SalesCrMemoHeader."Applies-to Doc. Type"), SalesCrMemoHeader."Applies-to Doc. No.")));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordSalesCrMemoHeader(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDocumentCaption(SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var DocCaption: Text[250])
    begin
    end;
}

