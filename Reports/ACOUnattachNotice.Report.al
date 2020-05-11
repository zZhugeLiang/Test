report 50007 "ACO Unattach Notice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOUnattachNotice.rdl';
    Caption = 'Unattach Notice';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            // Header Data <<
            column(UnattachNoticeCaption; UnattachNoticeCaptionLbl) { }
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
            // Totals <<
            column(FillClampedTotalsHereCaption; FillClampedTotalsHereCaptionLbl) { }
            column(QuantityOKCaption; QuantityOKCaptionLbl) { }
            column(QuantityRejectedWithReasonsCaption; QuantityRejectedWithReasonsCaptionLbl) { }
            column(TotalsCaption; TotalsCaptionLbl) { }
            column(NumberOfUnitsCaption; NumberOfUnitsCaptionLbl) { }
            column(AreaIncHollowCaption; AreaIncHollowCaptionLbl) { }
            column(TotalNumberOfBaths; TotalNumberOfBaths) { }
            column(AreaIncHollow; AreaIncHollow) { }
            column(AreaExcHollowCaption; AreaExcHollowCaptionLbl) { }
            column(AreaExcHollow; AreaExcHollow) { }
            // Totals >>            
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
                column(NumberOfMeters; Round(ItemVariant."ACO Number of Meters", 1) * 1000) { }
                column(CircumferenceCaption; CircumferenceCaptionLbl) { }
                column(Circumference; Circumference) { }
                column(DefWghtCaption; DefWghtCaptionLbl) { }
                column(WeightPerMeter_ACOProfile; ACOProfile."Weight per meter") { }
                column(ExtraToEnumerateCaption; ExtraToEnumerateCaptionLbl) { }
                column(ACO_Extra_to_Enumerate_Profile; "ACO Extra to Enumerate Profile") { }
                column(FoilCaption; FoilCaptionLbl) { }
                column(IsFoil; Format(IsFoil)) { }
                column(EurasCaption; EurasCaptionLbl) { }
                column(Euras_ACOProfileCustomer; Format(ACOProfileCustomer.Euras)) { }
                column(NetWeightCaption; NetWeightCaptionLbl) { }
                column(NetWeight; NetWeight) { }
                column(GrossWeightCaption; GrossWeightCaptionLbl) { }
                column(GrossWeight; GrossWeight) { }
                column(ChargesPerBathCaption; ChargesPerBathCaptionLbl) { }
                column(ACO_Charges_per_Bath_Profile; "ACO Charges per Bath Profile") { }
                column(NumberOfBathsCaption; NumberOfBathsCaptionLbl) { }
                column(NumberOfBaths; NumberOfBaths) { }
                column(SawingCaption; SawingCaptionLbl) { }
                column(ACO_Sawing; Format("ACO Sawing")) { }
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
                column(ACO_Height_Level_Profile; Format("ACO Height Level Profile")) { }

                column(ExtraFlushingCaption; ExtraFlushingCaptionLbl) { }
                column(ACO_Extra_Flushing; Format("ACO Extra Flushing")) { }

                column(MuNotMeasurableCaption; MuNotMeasurableCaptionLbl) { }
                column(ACO_Not_Measurable; Format("ACO Not Measurable")) { }

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
                column(IsVEC; Format(IsVEC)) { }
                column(BSCaptionLbl; BSCaptionLbl) { }
                column(ACO_British_Standard; Format("ACO British Standard")) { }
                column(WrapCaption; WrapCaptionLbl) { }
                column(IsWrap; Format(IsWrap)) { }
                column(HighEndCaption; HighEndCaptionLbl) { }
                column(ACO_High_End; Format("ACO High End")) { }
                column(MeasureReportCaption; MeasureReportCaptionLbl) { }
                column(ACO_Measure_Report; Format("ACO Measure Report")) { }
                column(KundentourCaption; KundentourCaptionLbl) { }
                column(ACO_Kundentour_HUECK; "ACO Kundentour HUECK") { }
                // Done >>
                // Packaging <<
                column(PackagingInstructionsCaption; PackagingInstructionsCaptionLbl) { }
                column(PackagingCaption; PackagingCaptionLbl) { }
                column(PackageTypeCaption; PackageTypeCaptionLbl) { }
                column(ACO_Packaging; "ACO Packaging") { }
                column(WidthCaption; WidthCaptionLbl) { }
                column(Width_ACOLinkedPackaging; Format(ACOLinkedPackaging.Width)) { }
                column(TypeCaption; TypeCaptionLbl) { }
                column(PackageTypeCode_ACOLinkedPackaging; ACOLinkedPackaging."Packaging Type Code") { }
                column(InsideCaption; InsideCaptionLbl) { }
                column(InsideCode_ACOLinkedPackaging; ACOLinkedPackaging."Inside Code") { }
                column(ProfilesCaption; ProfilesCaptionLbl) { }
                column(UOMCaption; UOMCaptionLbl) { }
                column(PackagingUOMCode_ACOLinkedPackaging; ACOLinkedPackaging."Packaging Unit of Measure Code") { }
                column(Quantity_ACOLinkedPackaging; Format(ACOLinkedPackaging.Quantity)) { }
                column(InsideUOMCaption; InsideUOMCaptionLbl) { }
                column(InsideUOMCode_ACOLinkedPackaging; ACOLinkedPackaging."Inside Unit of Measure Code") { }
                column(BuildupLayerCaption; BuildupLayerCaptionLbl) { }
                column(BuildupLayerCode_ACOLinkedPackaging; ACOLinkedPackaging."Build-up Layer Code") { }
                column(PackagingStructureCaption; PackagingStructureCaptionLbl) { }
                column(QuantityPerLayerCaption; QuantityPerLayerCaptionLbl) { }
                column(BuildupQuantityPerLayer_ACOLinkedPackaging; Format(ACOLinkedPackaging."Build-up Quantity per Layer")) { }
                column(NumberOfLayersCaption; NumberOfLayersCaptionLbl) { }
                column(BuildupNumberOfLayers_ACOLinkedPackaging; Format(ACOLinkedPackaging."Build-up Number of Layers")) { }
                column(MaxWidthCaption; MaxWidthCaptionLbl) { }
                column(BuildupMaximumWidth_ACOLinkedPackaging; Format(ACOLinkedPackaging."Build-up Maximum Width")) { }
                column(MaxHeightCaption; MaxHeightCaptionLbl) { }
                column(BuildupMaximumHeight_ACOLinkedPackaging; Format(ACOLinkedPackaging."Build-up Maximum Height")) { }
                column(RemarkCaptionLb; RemarkCaptionLbl) { }
                column(Remark_ACOLinkedPackaging; ACOLinkedPackaging.Remark) { }
                // Packaging >>
                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    Customer: Record Customer;
                    RoutingLine: Record "Routing Line";
                    ACOBathSheetMgt: Codeunit "ACO Bath Sheet Mgt.";
                begin
                    ACOProfileCustomer.SetRange("Profile Code", "Sales Line"."ACO Profile Code");
                    ACOProfileCustomer.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                    ACOProfileCustomer.SetRange("Ship-to Code", "Sales Header"."Ship-to Code");
                    if not ACOProfileCustomer.FindFirst() then
                        Clear(ACOProfileCustomer);

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    GetHolders();

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
                TotalNumberOfUnits := 0;
                TotalNumberOfBaths := 0;
                TotalArea := 0;
                AreaExcHollow := 0;
                AreaIncHollow := 0;

                Customer.Get("Sell-to Customer No.");
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.FindSet() then
                    repeat
                        BagDescriptionsText += SalesLine."ACO Receipt Bag" + '/';
                        TotalNumberOfUnits += SalesLine."ACO Number of Units";
                        TotalArea += SalesLine."ACO Area";
                        AreaExcHollow += SalesLine."ACO Area";
                        AreaIncHollow += SalesLine."ACO Area" * SalesLine."ACO Correction Factor Profile";

                        if ItemVariant.Get(SalesLine."No.", SalesLine."Variant Code") then begin
                            NumberOfMiliMeters := ItemVariant."ACO Number of Meters" * 1000;
                            if NumberOfMiliMeters > MaxLength then
                                MaxLength := NumberOfMiliMeters;
                        end;
                        TotalNumberOfUnits += "Sales Line"."ACO Number of Units";
                        if ACOProfile.Get(SalesLine."ACO Profile Code") and (ACOProfile."Charges per Bath Profile" <> 0) then
                            TotalNumberOfBaths += SalesLine."ACO Number of Units" / ACOProfile."Charges per Bath Profile"
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
        // CurrReport.Language(1043);
    end;

    var
        User: Record User;
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOColorProjectHeader: Record "ACO Project Color Header";
        ACOCategory: Record "ACO Category";
        ACOAppSetup: Record "ACO App Setup";
        ACOLinkedPackaging: Record "ACO Linked Packaging";
        BagDescriptionsText: Text;
        TotalArea: Decimal;
        MaxLength: Decimal;
        MaxCurrentDensity: Decimal;
        MinCurrentDensity: Decimal;
        ThickStainingTime: Decimal;
        ThinStainingTime: Decimal;
        Circumference: Decimal;
        NetWeight: Decimal;
        GrossWeight: Decimal;
        NumberOfBaths: Decimal;
        TotalNumberOfBaths: Decimal;
        TotalNumberOfUnits: Decimal; // New
        AreaIncHollow: Decimal; // New
        AreaExcHollow: Decimal; // New
        IsFoil: Boolean;
        IsVEC: Boolean;
        IsWrap: Boolean;

        // Captions Header Done <<
        UnattachNoticeCaptionLbl: Label 'Unattach Notice';
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
        ExtraToEnumerateCaptionLbl: Label 'Extra to Enumerate (mm)';
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
        PackagingInstructionsCaptionLbl: Label 'Packaging Instructions';
        PackagingCaptionLbl: Label 'Packaging';
        PackageTypeCaptionLbl: Label 'Package Type';
        WidthCaptionLbl: Label 'Width';
        TypeCaptionLbl: Label 'Type';
        InsideCaptionLbl: Label 'Inside';
        ProfilesCaptionLbl: Label 'Profiles';
        UOMCaptionLbl: Label 'Unit of Measure';
        InsideUOMCaptionLbl: Label 'Inside Unit of Measure';
        BuildupLayerCaptionLbl: Label 'Build-up Layer';
        PackagingStructureCaptionLbl: Label 'Packaging Structure';
        QuantityPerLayerCaptionLbl: Label '# per Layer';
        NumberOfLayersCaptionLbl: Label '# Layers';
        MaxWidthCaptionLbl: Label 'Max Width';
        MaxHeightCaptionLbl: Label 'Max Height';
        RemarkCaptionLbl: Label 'Remark';
        NameCaptionLbl: Label 'Name';
        // Totals
        FillClampedTotalsHereCaptionLbl: Label 'Fill in the clamped totals here (OK + Rejected)';
        QuantityOKCaptionLbl: Label 'Quantity OK';
        QuantityRejectedWithReasonsCaptionLbl: Label 'Quantity rejected with reason(s)';
        TotalsCaptionLbl: Label 'Totals';
        NumberOfUnitsCaptionLbl: Label 'Number of Units';
        AreaIncHollowCaptionLbl: Label 'Area incl. Hollow';
        AreaExcHollowCaptionLbl: Label 'Area excl. Hollow';
        // Footer
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
        ///
        NoteCaptionLbl: Label 'Note';
        SupplierCaptionLbl: Label 'Supplier';
        TotalNumberOfUnitsCaptionLbl: Label 'Total Number of Units';
        DeliveryDateCaptionLbl: Label 'Delivery Date';
        QuantityCaptionLbl: Label 'Quantity';
        LengthCaptionLbl: Label 'Length';
        LocationCaptionLbl: Label 'Location';

    local procedure GetHolders()
    var
        Counter: Integer;
    begin
        if not ACOLinkedPackaging.Get("Sales Line"."ACO Packaging") then
            Clear(ACOLinkedPackaging);
    end;
}
