report 50014 "ACO CMR - Sales Shipment"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOCMRSalesShipment.rdl';
    Caption = 'CMR - Sales Shipment';
    ApplicationArea = Warehouse;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(Sales_Shipment_Header_No_; "No.")
            {
            }
            column(UseNewLayout; "Sales Shipment Header"."Document Date" >= 20220926D)
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = CONST(Item));
                column(ACOAppSetup_NetGrossWeightFactorCaption; ACOAppSetup.FieldCaption("Net/Gross Weight Factor")) { }
                column(ACOAppSetup_NetGrossWeightFactor; ACOAppSetup."Net/Gross Weight Factor") { }
                column(Name_CompanyInfo; CompanyInfo.Name) { }
                column(Address_CompanyInfo; CompanyInfo.Address) { }
                column(PostCode_CompanyInfo; CompanyInfo."Post Code") { }
                column(City_CompanyInfo; CompanyInfo.City) { }
                column(CountryRegionCode_CompanyInfo; CompanyInfo."Country/Region Code") { }
                column(SelltoCustomerNo_SalesShipmentHeader; "Sales Shipment Header"."Sell-to Customer No.") { }
                column(ShiptoName_SalesShipmentHeader; "Sales Shipment Header"."Ship-to Name") { }
                column(ShiptoAddress_SalesShipmentHeader; "Sales Shipment Header"."Ship-to Address") { }
                column(ShiptoCity_SalesShipmentHeader; "Sales Shipment Header"."Ship-to City") { }
                column(ShipmentDate_SalesShipmentHeader; "Sales Shipment Header"."Shipment Date") { }
                column(ShiptoPostCode_SalesShipmentHeader; "Sales Shipment Header"."Ship-to Post Code") { }

                column(SenderAddr_1_; SenderAddr[1])
                {
                }
                column(SenderAddr_2_; SenderAddr[2])
                {
                }
                column(SenderAddr_3_; SenderAddr[3])
                {
                }
                column(SenderAddr_4_; SenderAddr[4])
                {
                }
                column(SenderAddr_5_; SenderAddr[5])
                {
                }
                column(ShipToAddr_5_; ShipToAddr[5])
                {
                }
                column(ShipToAddr_4_; ShipToAddr[4])
                {
                }
                column(ShipToAddr_3_; ShipToAddr[3])
                {
                }
                column(ShipToAddr_2_; ShipToAddr[2])
                {
                }
                column(ShipToAddr_1_; ShipToAddr[1])
                {
                }
                column(ShipTo; ShipTo)
                {
                }
                column(ShipFrom; ShipFrom)
                {
                }
                column(Sales_Shipment_Header___Shipment_Date_; Format("Sales Shipment Header"."Shipment Date"))
                {
                }
                column(ShippingAgent_Name; ShippingAgent.Name)
                {
                }
                column(Sales_Shipment_Line__No__; "No.")
                {
                }
                column(Sales_Shipment_Line__Units_per_Parcel_; "Units per Parcel")
                {
                }
                column(Sales_Shipment_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Sales_Shipment_Line_Description; Description)
                {
                }
                column(Item__Tariff_No__; Item."Tariff No.")
                {
                }
                column(Sales_Shipment_Line__Gross_Weight_; "Gross Weight")
                {
                }
                column(Sales_Shipment_Line__Unit_Volume_; "Unit Volume")
                {
                }
                column(SenderAddr_5__Control1000023; SenderAddr[5])
                {
                }
                column(SenderAddr_4__Control1000024; SenderAddr[4])
                {
                }
                column(SenderAddr_3__Control1000025; SenderAddr[3])
                {
                }
                column(SenderAddr_2__Control1000026; SenderAddr[2])
                {
                }
                column(SenderAddr_1__Control1000027; SenderAddr[1])
                {
                }
                column(EstdIn; EstdIn)
                {
                }
                column(WORKDATE; Format(WorkDate))
                {
                }
                column(Sales_Shipment_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Shipment_Line_Line_No_; "Line No.")
                {
                }

                column(ACOProfileCode_SalesShipmentLineCaption; FieldCaption("ACO Profile Code")) { }
                column(ACOProfileDescription_SalesShipmentLineCaption; FieldCaption("ACO Profile Description")) { }
                column(ACOCustomerItemNo_SalesShipmentLineCaption; FieldCaption("ACO Customer Item No.")) { }
                column(ACOProfileCustDescription_SalesShipmentLineCaption; FieldCaption("ACO Profile Cust. Description")) { }
                column(ACONumberofUnits_SalesInvLineCaption; FieldCaption("ACO Number of Units")) { }
                column(ACONumberofMeters_ItemVariantCaption; ItemVariant.FieldCaption("ACO Number of Meters")) { }
                column(Weightpermeter_ACOProfileCaption; ACOProfile.FieldCaption("Weight per meter")) { }
                column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
                column(ACOSawing_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("ACO Sawing")) { }
                column(DocumentNo_SalesShptLineCaption; "Sales Shipment Line".FieldCaption("Document No.")) { }
                column(ACOProfileCode_SalesShipmentLine; "ACO Profile Code") { }
                column(ACOProfileDescription_SalesShipmentLine; "ACO Profile Description") { }
                column(ACOCustomerItemNo_SalesShipmentLine; "ACO Customer Item No.") { }
                column(ACOProfileCustDescription_SalesShipmentLine; "ACO Profile Cust. Description") { }
                column(ACONumberofMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                column(Weightpermeter_ACOProfile; ACOProfile."Weight per meter") { }
                column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                column(ACOSawing_SalesShptLine; "Sales Shipment Line"."ACO Sawing") { }
                column(DocumentNo_SalesShptLine; "Sales Shipment Line"."Document No.") { }
                column(ProfileCircumference_SalesShptLine; "Sales Shipment Line"."ACO Profile Circumference") { }
                column(ACOCustomerItemReference_SalesShptLine; "Sales Shipment Line"."ACO Customer Item Reference") { }
                column(ACOProfileLength_SalesShptLine; "Sales Shipment Line"."ACO Profile Length") { }
                column(ACOWeightpermeter_ItemUnitofMeasure; ItemUnitofMeasure."ACO Weight per meter") { }

                trigger OnAfterGetRecord()
                begin
                    if "Units per Parcel" <> 0 then begin
                        "Units per Parcel" := Round(Quantity / "Units per Parcel", 1, '>');
                        "Unit of Measure" := ParcelTxt;
                    end else
                        "Units per Parcel" := Quantity;

                    Item.Get("No.");

                    "Gross Weight" := Quantity * "Gross Weight";
                    "Unit Volume" := Quantity * "Unit Volume";

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    if not ACOProfile.Get("ACO Profile Code") then
                        Clear(ACOProfile);

                    if not ItemUnitofMeasure.Get("Sales Shipment Line"."No.", "Sales Shipment Line"."Unit of Measure Code") then
                        Clear(ItemUnitofMeasure);
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
            var
                CompanyInfo: Record "Company Information";
            begin
                SalesShipmentLine.Reset();
                SalesShipmentLine.SetRange("Document No.", "No.");
                SalesShipmentLine.SetRange(Type, SalesShipmentLine.Type::Item);
                if not SalesShipmentLine.FindFirst() then
                    CurrReport.Skip();

                if "Location Code" <> '' then begin
                    Location.Get("Location Code");
                    FormatAddr.FormatAddr(
                      SenderAddr, Location.Name, Location."Name 2", '', Location.Address, Location."Address 2",
                      Location.City, Location."Post Code", Location.County, Location."Country/Region Code");
                    if not Country.Get(Location."Country/Region Code") then
                        Country.Init();
                    ShipFrom := DelChr(Location.City + Country.Name, '>', ', ');
                    EstdIn := Location.City;
                end else begin
                    CompanyInfo.Get();
                    FormatAddr.FormatAddr(
                      SenderAddr, CompanyInfo.Name, CompanyInfo."Name 2", '', CompanyInfo.Address, CompanyInfo."Address 2",
                      CompanyInfo.City, CompanyInfo."Post Code", CompanyInfo.County, CompanyInfo."Country/Region Code");
                    if not Country.Get(CompanyInfo."Country/Region Code") then
                        Country.Init();
                    ShipFrom := DelChr(CompanyInfo.City + Country.Name, '>', ', ');
                    EstdIn := CompanyInfo.City;
                end;

                FormatAddr.FormatAddr(
                  ShipToAddr, "Ship-to Name", "Ship-to Name 2", '', "Ship-to Address", "Ship-to Address 2",
                  "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country/Region Code");

                if not ShippingAgent.Get("Shipping Agent Code") then
                    ShippingAgent.Init();

                if not Country.Get("Ship-to Country/Region Code") then
                    Country.Init();

                ShipTo := DelChr("Ship-to City" + Country.Name, '>', ', ');
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Item: Record Item;
        SalesShipmentLine: Record "Sales Shipment Line";
        Location: Record Location;
        CompanyInfo: Record "Company Information";
        ShippingAgent: Record "Shipping Agent";
        Country: Record "Country/Region";
        FormatAddr: Codeunit "Format Address";
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        RejectReasonCode: Record "Reason Code";
        ItemUnitofMeasure: Record "Item Unit of Measure";
        SenderAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        ShipTo: Text[80];
        ShipFrom: Text[80];
        EstdIn: Text[50];

        NetWeight: Decimal;
        GrossWeight: Decimal;
        ParcelTxt: Label 'parcel(s)';

    trigger OnInitReport()
    begin
        ACOAppSetup.Get();
        CompanyInfo.Get();
    end;

    [Scope('OnPrem')]
    procedure AddText(Text: Text[249]): Text[250]
    begin
        if Text <> '' then
            exit(Text + ', ');
    end;
}

