report 50005 "ACO Attach Notice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOAttachNotice.rdl';
    Caption = 'Attach Notice';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            // Header Data <<
            column(AttachNoticeCaption; AttachNoticeCaptionLbl) { }
            column(SalesOrderNoCaption; SalesOrderNoCaptionLbl) { }
            column(No_; "No.") { }
            column(CustomerNameCaption; CustomerCaptionLbl) { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(LoggedInDateCaption; LoggedInDateCaptionLbl) { }
            column(ACO_Logged_In_DateTime; DT2Date("ACO Logged In DateTime")) { }
            column(TotalAreaCaption; TotalAreaCaptionLbl) { }
            column(TotalArea; TotalArea) { }
            column(MaxLengthCaption; MaxLengthCaptionLbl) { }
            column(MaxLength; MaxLength) { }
            column(NoteCaption; NoteCaptionLbl) { }
            column(ACO_Customer_Comment; "ACO Customer Comment") { }
            column(YourReferenceCaption; YourReferenceCaptionLbl) { }
            column(Your_Reference; "Your Reference") { }
            column(CustomerOfCustomerCaption; CustomerOfCustomerCaptionLbl) { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(DeliveryIDCaption; DeliveryIDCaptionLbl) { }
            column(External_Document_No_; "External Document No.") { }
            column(ShippingAgentCaption; ShippingAgentCaptionLbl) { }
            column(ACO_Own_Shipping_Agent; "ACO Own Shipping Agent") { }
            // Header Data >>


            column(SupplierCaption; SupplierCaptionLbl) { }
            column(ACO_Supplier; "ACO Supplier")
            {
            }

            column(TotalNumberOfUnitsCaption; TotalNumberOfUnitsCaptionLbl) { }
            column(TotalNumberOfUnits; TotalNumberOfUnits)
            {
            }
            column(DeliveryDateCaption; DeliveryDateCaptionLbl) { }
            column(ACO_Delivery_Date; "ACO Delivery Date")
            {
            }
            // Footer <<
            column(PrintingDateCaption; PrintingDateCaptionLbl) { }
            column(PrintingDate; CurrentDateTime())
            {
            }
            column(CreatedbyCaption; CreatedbyCaptioNLbl) { }
            column(CreatedbyUser; User."User Name")
            {
            }
            // Footer >>
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");

                column(SalesOrderLineNoCaption; SalesOrderLineNoCaptionLbl) { }
                column(Line_No_; "Line No.") { }
                column(TreatmentCaption; TreatmentCaptionLbl) { }
                column(Description; Description) { }
                column(ItemNoAlucolCaption; ItemNoAlucolCaptionLbl) { }
                column(ACO_Profile_Code; "ACO Profile Code") { }
                column(ItemDescriptionAlucolCaption; ItemDescriptionAlucolCaptionLbl) { }
                column(Description_ACOProfile; ACOProfile."Description") { }
                column(ACO_Profile_Description; "ACO Profile Description") { }
                column(ItemNoCustomerCaption; ItemNoCustomerCaptionLbl) { }
                column(CustomerItemNo; ACOProfileCustomer."Customer Item No.") { }
                column(ItemDescrCustomerCaption; ItemDescrCustomerCaptionLbl) { }
                column(ProfileDescription_ProfileCustomer; ACOProfileCustomer."Profile Description") { }
                column(ColorNoteCaption; ColorNoteCaptionLbl) { }
                column(Name_ACOColorProjectHeader; ACOColorProjectHeader.Name) { }
                column(QuantityCaption; QuantityCaptionLbl) { }
                column(ACO_Number_of_Units; "ACO Number of Units") { }
                column(LengthCaption; LengthCaptionLbl) { }
                column(NumberOfMeters; Round(ItemVariant."ACO Number of Meters", 1)) { }
                column(CircumferenceCaption; CircumferenceCaptionLbl) { }
                column(Circumference; Circumference) { }
                column(DefWghtCaption; DefWghtCaptionLbl) { }
                column(WeightPerMeter_ACOProfile; ACOProfile."Weight per meter") { }
                column(ExtraToEnumerateCaption; ExtraToEnumerateCaptionLbl) { }
                column(ACO_Extra_to_Enumerate_Profile; "ACO Extra to Enumerate Profile") { }
                column(FoilCaption; FoilCaptionLbl) { }
                column(IsFoil; IsFoil) { }
                column(EurasCaption; EurasCaptionLbl) { }
                column(Euras_ACOProfileCustomer; ACOProfileCustomer.Euras) { }
                column(NetWeightCaption; NetWeightCaptionLbl) { }
                column(NetWeight; NetWeight) { }
                column(GrossWeightCaption; GrossWeightCaptionLbl) { }
                column(GrossWeight; GrossWeight) { }
                column(ChargesPerBathCaption; ChargesPerBathCaptionLbl) { }
                column(ACO_Charges_per_Bath_Profile; "ACO Charges per Bath Profile") { }
                column(NumberOfBathsCaption; NumberOfBathsCaptionLbl) { }
                column(NumberOfBaths; NumberOfBaths) { }
                column(SawingCaption; SawingCaptionLbl) { }
                column(ACO_Sawing; "ACO Sawing") { }
                // Done

                column(BagDescriptionCaption; BagDescriptionCaptionLbl) { }
                column(BagDescriptionsText; BagDescriptionsText) { }
                column(CategoryCaption; CategoryCaptionLbl) { }
                column(Description_ACOCategory; ACOCategory.Description) { }
                column(ItemNoteForWorkOrderCaption; ItemNoteForWorkOrderCaptionLbl) { }
                column(CommentWorkNote_ACOProfile; ACOProfile."Comment Work Note") { }
                column(ItemNoteForBathSheetCaption; ItemNoteForBathSheetCaptionLbl) { }
                column(CommentBathCard_ACOProfile; ACOProfile."Comment Bath Card") { }
                column(HollowFactorCaption; HollowFactorCaptionLbl) { }
                column(CorrectionFactor_ACOProfile; ACOProfile."Correction Factor") { }
                column(HeightLevelCaption; HeightLevelCaptionLbl) { }
                column(ACO_Height_Level_Profile; "ACO Height Level Profile") { }

                column(ExtraFlushingCaption; ExtraFlushingCaptionLbl) { }
                column(ACO_Extra_Flushing; "ACO Extra Flushing") { }

                column(MuNotMeasurableCaption; MuNotMeasurableCaptionLbl) { }
                column(ACO_Not_Measurable; "ACO Not Measurable") { }

                column(LocationCaption; LocationCaptionLbl) { }
                column(ACO_Receipt_Bag; "ACO Receipt Bag")
                {
                }
                column(ACO_Receipt_Shelf; "ACO Receipt Shelf")
                {
                }
                column(PictureFile_ACOProfile; ACOProfile."Picture File")
                {
                }

                // Done <<
                column(MaxCurrentDensityCaption; MaxCurrentDensityCaptionLbl) { }
                column(MaxCurrentDensity; MaxCurrentDensity) { }
                column(MinCurrentDensityCaption; MinCurrentDensityCaptionLbl) { }
                column(MinCurrentDensity; MinCurrentDensity) { }
                column(ThickStainingTimeCaption; ThickStainingTimeCaptionLbl) { }
                column(ThickStainingTime; ThickStainingTime) { }
                column(ThinStainingTimeCaption; ThinStainingTimeCaptionLbl) { }
                column(ThinStainingTime; ThinStainingTime) { }
                column(VECCaption; VECCaptionLbl) { }
                column(IsVEC; IsVEC) { }
                column(BSCaptionLbl; BSCaptionLbl) { }
                column(ACO_British_Standard; "ACO British Standard") { }
                column(WrapCaption; WrapCaptionLbl) { }
                column(IsWrap; IsWrap) { }
                column(HighEndCaption; HighEndCaptionLbl) { }
                column(ACO_High_End; "ACO High End") { }
                column(MeasureReportCaption; MeasureReportCaptionLbl) { }
                column(ACO_Measure_Report; "ACO Measure Report") { }
                column(KundentourCaption; KundentourCaptionLbl) { }
                column(ACO_Kundentour_HUECK; "ACO Kundentour HUECK") { }


                // Done >>

                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    Customer: Record Customer;
                    RoutingLine: Record "Routing Line";
                    ACOBathSheetMgt: Codeunit "ACO Bath Sheet Mgt.";
                begin
                    if not ACOProfileCustomer.Get("ACO Profile Code", "Sell-to Customer No.") then
                        Clear(ACOProfileCustomer);

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    // ACOLinkedHolder.Setr(ACOProfileCustomer.)
                    // ACOLinkedHolderType
                    // ACOLinkedDistanceHolder
                    // ACOLinkedSupportHolder

                    if ACOProfile.Get("ACO Profile Code") then
                        ACOProfile.CalcFields("Picture File")
                    else
                        Clear(ACOProfile);

                    if not ACOCategory.Get(ACOProfile.Category) then
                        Clear(ACOCategory);

                    IsFoil := false;

                    Circumference := "ACO Profile Circumference" * "ACO Number of Units";
                    NetWeight := ACOProfile."Weight per meter" * "ACO Number of Units";
                    GrossWeight := NetWeight * ACOAppSetup."Net/Gross Weight Factor";
                    if ACOProfile."Charges per Bath Profile" <> 0 then
                        NumberOfBaths := "ACO Number of Units" / ACOProfile."Charges per Bath Profile"
                    else
                        NumberOfBaths := 0;

                    if (ACOAppSetup."Foil Routing No." <> '') and (ACOAppSetup."Wrap Routing No." <> '') and (ACOAppSetup."VEC Routing No." <> '') then begin
                        RoutingLine.SetRange("Routing No.", Item."Routing No.");
                        if RoutingLine.FindSet() then
                            repeat
                                if (ACOAppSetup."Foil Routing No." <> '') and not IsFoil then
                                    IsFoil := RoutingLine."No." = ACOAPPSetup."Foil Routing No.";
                                if (ACOAppSetup."Wrap Routing No." <> '') and not IsWrap then
                                    IsWrap := RoutingLine."No." = ACOAPPSetup."Wrap Routing No.";
                                if (ACOAppSetup."VEC Routing No." <> '') and not IsVEC then
                                    IsVEC := RoutingLine."No." = ACOAPPSetup."VEC Routing No.";
                            until (RoutingLine.Next() = 0);
                    end;

                    ACOBathSheetMgt.DetermineStainingTimes("Sales Line", ThinStainingTime, ThickStainingTime, Customer);
                    ACOBathSheetMgt.DetermineCurrentDensities("Sales Line", MinCurrentDensity, MaxCurrentDensity);
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
                //ACOProfile: Record "ACO Profile";
                //Item: Record Item;
                ItemVariant: Record "Item Variant";
                Customer: Record Customer;
                NumberOfMiliMeters: Decimal;
            begin
                MaxLength := 0;
                NumberOfMiliMeters := 0;

                Customer.Get("Sell-to Customer No.");
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.FindSet() then
                    repeat
                        BagDescriptionsText += SalesLine."ACO Receipt Bag" + '/';
                        TotalNumberOfUnits += SalesLine."ACO Number of Units";
                        TotalArea += SalesLine."ACO Area";
                        if ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then begin
                            NumberOfMiliMeters := ItemVariant."ACO Number of Meters" * 1000;
                            if NumberOfMiliMeters > MaxLength then
                                MaxLength := NumberOfMiliMeters;

                            // ACOBathSheetMgt.DetermineStainingTimes(SalesLine, ThinStainingTime, ThickStainingTime, Customer);
                            // ACOBathSheetMgt.DetermineCurrentDensities(SalesLine, MinCurrentDensity, MaxCurrentDensity);
                        end;
                    until SalesLine.Next() = 0;

                if StrLen(BagDescriptionsText) > 1 then
                    BagDescriptionsText := CopyStr(BagDescriptionsText, 1, StrLen(BagDescriptionsText) - 1);
            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
        ACOAppSetup.Get();
    end;

    var
        User: Record User;
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOColor: Record "ACO Color";
        ACOProfile: Record "ACO Profile";
        ACOColorProjectHeader: Record "ACO Project Color Header";//New
        ACOCategory: Record "ACO Category";//New
        ACOAppSetup: Record "ACO App Setup";//New
        ACOLinkedHolder: Record "ACO Linked Holder";//New
        ACOLinkedHolderType: Record "ACO Linked Holder Type";//New
        ACOLinkedDistanceHolder: Record "ACO Linked Distance Holder";//New
        ACOLinkedSupportHolder: Record "ACO Linked Support Holder";//New
        CustomerName: Text[100];
        ItemDescription: Text[100];
        MeasureText: Text;
        BagDescriptionsText: Text;
        TotalNumberOfUnits: Decimal;
        TotalArea: Decimal; //New
        MaxLength: Decimal; //New
        MaxCurrentDensity: Decimal; //New
        MinCurrentDensity: Decimal; //New
        ThickStainingTime: Decimal;//New
        ThinStainingTime: Decimal;//New
        Circumference: Decimal; //New
        NetWeight: Decimal;//New
        GrossWeight: Decimal;//New
        NumberOfBaths: Decimal;//New
        IsFoil: Boolean;//New
        IsVEC: Boolean;//New
        IsWrap: Boolean;//New

        // Captions Header Done <<
        AttachNoticeCaptionLbl: Label 'Attach Notice';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';

        CustomerCaptionLbl: Label 'Customer';
        LoggedInDateCaptionLbl: Label 'Logged In Date';
        TotalAreaCaptionLbl: Label 'Total Area';
        MaxLengthCaptionLbl: Label 'Max. Length';
        DeliveryIDCaptionLbl: Label 'DeliveryID';
        ShippingAgentCaptionLbl: Label 'Shipping Agent';
        ColorNoteCaptionLbl: Label 'Color Note';
        // Captions Header Done >>
        // Captions Line Done <<
        SalesOrderLineNoCaptionLbl: Label 'Sales Order Line No.';
        TreatmentCaptionLbl: Label 'Treatment';
        YourReferenceCaptionLbl: Label 'Your Reference';
        CustomerOfCustomerCaptionLbl: Label 'Customer of Customer';
        MaxCurrentDensityCaptionLbl: Label 'Max. Current Density';
        MinCurrentDensityCaptionLbl: Label 'Min. Current Density';
        ThickStainingTimeCaptionLbl: Label 'Thick Staining Time';
        ThinStainingTimeCaptionLbl: Label 'Thin Staining Time';
        ItemNoAlucolCaptionLbl: Label 'Item No. Alucol';
        ItemDescriptionAlucolCaptionLbl: Label 'Item Description Alucol';
        ItemNoCustomerCaptionLbl: Label 'Item No. Customer';
        ItemDescrCustomerCaptionLbl: Label 'Item Descr. Customer';
        CircumferenceCaptionLbl: Label 'Circumference';
        DefWghtCaptionLbl: Label 'Def. Wght.';
        ExtraToEnumerateCaptionLbl: Label 'Extra to Enumerate';
        FoilCaptionLbl: Label 'Foil';
        EurasCaptionLbl: Label 'Euras';
        GrossWeightCaptionLbl: Label 'Gross Weight';
        NetWeightCaptionLbl: Label 'Net Weight';
        ChargesPerBathCaptionLbl: Label 'Charge per Bath';
        NumberOfBathsCaptionLbl: Label 'Number of Baths';
        SawingCaptionLbl: Label 'Sawing';
        BagDescriptionCaptionLbl: Label 'Bag Description';
        CategoryCaptionLbl: Label 'Category';
        // Captions Header Done >>

        ItemNoteForWorkOrderCaptionLbl: Label 'Item Note for Work Order';
        ItemNoteForBathSheetCaptionLbl: Label 'Item Note for Bath Sheet';
        HollowFactorCaptionLbl: Label 'Hollow Factor';
        HeightLevelCaptionLbl: Label 'Height Level';
        ExtraFlushingCaptionLbl: Label 'Extra Flushing';
        MuNotMeasurableCaptionLbl: Label 'Mu Not Measurable';
        BSCaptionLbl: Label 'BS';
        WrapCaptionLbl: Label 'Wrap';
        VECCaptionLbl: Label 'VEC';
        HighEndCaptionLbl: Label 'High End';
        MeasureReportCaptionLbl: Label 'Measure Report';
        KundentourCaptionLbl: Label 'Kundentour';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
        ///
        NoteCaptionLbl: Label 'Note';
        SupplierCaptionLbl: Label 'Supplier';
        TotalNumberOfUnitsCaptionLbl: Label 'Total Number of Units';
        DeliveryDateCaptionLbl: Label 'Delivery Date';

        ThinStainingCaptionLbl: Label 'Thin Staining';

        QuantityCaptionLbl: Label 'Quantity';
        LengthCaptionLbl: Label 'Length';
        LocationCaptionLbl: Label 'Location';

}
