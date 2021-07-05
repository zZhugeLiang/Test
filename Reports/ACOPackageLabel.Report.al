report 50001 "ACO Package Label"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOPackageLabel.rdl';
    dataset
    {
        dataitem(ACOPackageHeader; "ACO Package Header")
        {

            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyCountry_Region_Code; CompanyInfo."Country/Region Code") { }
            column(CompanyPost_Code; CompanyInfo."Post Code") { }

            column(No; "No.")
            {
            }
            column(Customer_No_; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(ResourceNo; "Resource No.")
            {
            }
            column(Name_Resource; Resource.Name)
            {
            }
            column(AmountLbl; AmountLbl)
            {
            }
            column(ItemLbl; ItemLbl)
            {
            }
            column(LengthLbl; LengthLbl)
            {
            }
            column(ReferenceLbl; ReferenceLbl)
            {
            }
            column(TreatmentLbl; TreatmentLbl)
            {
            }

            column(Address1Caption; FieldCaption(Address1)) { }
            column(Address2Caption; FieldCaption(Address2)) { }
            column(RemarkCaption; FieldCaption(Remark)) { }
            column(Date_TimeCaption; FieldCaption("Date-Time")) { }
            column(NetGrossWeighFactorACOAppSetupCaption; ACOAppSetup.FieldCaption("Net/Gross Weight Factor")) { }
            column(Address1; Address1) { }
            column(Address2; Address2) { }
            column(City; City) { }
            column(Post_Code; "Post Code") { }
            column(Remark; Remark) { }
            column(Date_Time; "Date-Time") { }
            column(NetGrossWeightFactor_ACOAppSetup; ACOAppSetup."Net/Gross Weight Factor") { }
            column(Customer_Item_No_Caption; ACOPackageLine.FieldCaption("Customer Item No.")) { }
            column(Profile_Cust__DescriptionCaption; ACOPackageLine.FieldCaption("Profile Cust. Description")) { }
            column(Number_of_UnitsCaption; ACOPackageLine.FieldCaption("Number of Units")) { }
            column(NumberOfMeters_ItemVariantCaption; ItemVariant.FieldCaption("ACO Number of Meters")) { }
            column(ACOKundentourHUECK_SalesLineCaption; SalesLine.FieldCaption("ACO Kundentour HUECK")) { }
            column(Weightpermeter_ACOProfileCaption; ACOProfile.FieldCaption("Weight per meter")) { }
            column(PictureFile_ACOProfileCaption; ACOProfile.FieldCaption("Picture File")) { }
            column(Circumference_ACOProfileCaption; ACOProfile.FieldCaption(Circumference)) { }
            column(Reject; Reject) { }
            dataitem(ACOPackageLine; "ACO Package Line")
            {
                DataItemLinkReference = ACOPackageHeader;
                DataItemLink = "Package No." = field("No.");

                column(Profile_no_; "Profile no.") { }
                column(Profile_description; "Profile description") { }
                column(CustomerItemNo_ACOProfileCustomer; ACOProfileCustomer."Customer Item No.") { }
                column(ProfileDescription_ACOProfileCustomer; ACOProfileCustomer."Profile Description") { }
                column(Quantity; Quantity) { }
                column(Length; Length) { }
                column(External_Document_No_; "External Document No.") { }
                column(Your_Reference; "Your Reference") { }
                column(Sales_Order_No_; "Sales Order No.") { }
                column(Treatment_Description; "Treatment Description") { }
                column(Customer_Item_No_; "Customer Item No.") { }
                column(Profile_Cust__Description; "Profile Cust. Description") { }
                column(Number_of_Units; "Number of Units") { }
                column(NumberOfMeters_ItemVariant; ItemVariant."ACO Number of Meters") { }
                column(ACOKundentourHUECK_SalesLine; SalesLine."ACO Kundentour HUECK") { }
                column(Weightpermeter_ACOProfile; ACOProfile."Weight per meter") { }
                column(PictureFile_ACOProfile; ACOProfile."Picture File") { }
                column(Reject_Reason_Code; "Reject Reason Code") { }
                column(DescriptionRejectReasonCode; RejectReasonCode.Description) { }
                column(Circumference_ACOProfile; ACOProfile.Circumference) { }
                column(ShiptoCode_SalesHeader; SalesHeader."Ship-to Code") { }
                column(ShiptoName_SalesHeader; SalesHeader."Ship-to Name") { }
                column(ShiptoAddress_SalesHeader; SalesHeader."Ship-to Address") { }
                column(ShiptoCity_SalesHeader; SalesHeader."Ship-to City") { }
                column(ShiptoPostCode_SalesHeader; SalesHeader."Ship-to Post Code") { }
                column(ShiptoCountryRegionCode_SalesHeader; SalesHeader."Ship-to Country/Region Code") { }
                column(EntryNo_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Entry No.") { }
                column(SalesOrderNo_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Sales Order No") { }
                column(SalesOrderLineNoACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Sales Order Line No.") { }
                column(EndcustomerName_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Endcustomer Name") { }
                column(EndcustomerAddress1_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Endcustomer Adress 1") { }
                column(EndcustomerAddress2_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Endcustomer Adress 2") { }
                column(EndcustomerAddress3_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Endcustomer Adress 3") { }
                column(EndcustomerAddress4_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Endcustomer Adress 4") { }
                column(CustomerItemNo_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Customer Item No") { }
                column(CustomerItemDescription_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Customer Item Description") { }
                column(Alloy_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer.Alloy) { }
                column(LocName_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Loc Name") { }
                column(LocZipCode_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Loc ZipCode") { }
                column(LocCityACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Loc City") { }
                column(LocCountry_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Loc Country") { }
                column(ZIN_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer.ZIN) { }
                column(CustomerOrderNo_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Customer Order No") { }
                column(Language_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer.Language) { }
                column(SawingLength_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."Sawing Length") { }
                column(ExternalLineNo_ACOAddEDIInfoCustomer; ACOAddEDIInfoCustomer."External Line No.") { }

                trigger OnAfterGetRecord()
                begin
                    if not Resource.Get(ACOPackageHeader."Resource No.") then
                        Clear(Resource);

                    if not ACOProfileCustomer.Get(ACOPackageLine."Profile no.", ACOPackageHeader."Customer No.", ACOPackageLine."Customer Item No.") then
                        Clear(ACOProfileCustomer);

                    if not ItemVariant.Get("Item No.", "Variant Code") then
                        Clear(ItemVariant);

                    //TODO
                    if not SalesHeader.Get(SalesHeader."Document Type"::Order, "Sales Order No.") then
                        Clear(SalesHeader);

                    if not SalesLine.Get(SalesLine."Document Type"::Order, "Sales Order No.", "Sales Line No") then
                        Clear(SalesLine);

                    if not ACOProfile.Get("Profile no.") then
                        Clear(ACOProfile);

                    if not RejectReasonCode.Get("Reject Reason Code") then
                        Clear(RejectReasonCode);

                    ACOAddEDIInfoCustomer.SetRange("Sales Order No", ACOPackageLine."Sales Order No.");
                    ACOAddEDIInfoCustomer.SetRange("Sales Order Line No.", Format(ACOPackageLine."Sales Line No"));
                    if not ACOAddEDIInfoCustomer.FindFirst() then
                        Clear(ACOAddEDIInfoCustomer);
                end;
            }
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

                    field("Resource No."; "Generating Resource"."No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Resource';
                        ToolTip = '';

                    }
                    field("Package Type"; "filter Package Type")
                    {
                        ApplicationArea = All;
                        Caption = 'Package Type';
                        OptionCaption = 'Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack';
                        ToolTip = '';
                    }
                    field("RackNumber"; "Rack Number")
                    {
                        ApplicationArea = All;
                        Caption = 'Rack Number';
                        ToolTip = '';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        ACOAppSetup.Get();
    end;

    var
        CompanyInfo: Record "Company Information";
        "Generating Resource": record Resource;
        ACOProfileCustomer: Record "ACO Profile Customer";
        Resource: Record Resource;
        ItemVariant: Record "Item Variant";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        RejectReasonCode: Record "Reason Code";
        ACOAddEDIInfoCustomer: Record "ACO Add EDI Info Customer";
        ItemLbl: Label 'Item';
        AmountLbl: Label 'Amount';
        LengthLbl: Label 'Length';
        ReferenceLbl: Label 'Reference';
        TreatmentLbl: Label 'Treatment';
        "filter Package Type": Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
        "Rack Number": Integer;
}
