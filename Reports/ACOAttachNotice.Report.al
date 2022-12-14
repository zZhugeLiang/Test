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
            // Totals <<
            column(FillClampedTotalsHereCaption; FillClampedTotalsHereCaptionLbl) { }
            column(QuantityOKCaption; QuantityOKCaptionLbl) { }
            column(QuantityRejectedWithReasonsCaption; QuantityRejectedWithReasonsCaptionLbl) { }
            column(TotalsCaption; TotalsCaptionLbl) { }
            column(NumberOfUnitsCaption; NumberOfUnitsCaptionLbl) { }
            column(AreaLineCaption; AreaLineCaptionLbl) { }
            column(TotalNumberOfBaths; TotalNumberOfBaths) { }
            column(AreaIncHollow; AreaIncHollow) { }
            column(AreaWorknoteCaption; AreaWorknoteCaptionLbl) { }
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
            column(Requested_Delivery_DateCaption; FieldCaption("Requested Delivery Date")) { }
            column(Requested_Delivery_Date; "Requested Delivery Date") { }
            column(Promised_Delivery_DateCaption; FieldCaption("Promised Delivery Date")) { }
            column(Promised_Delivery_Date; "Promised Delivery Date") { }

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
                column(CustomerItemNo; "ACO Customer Item No.") { }
                column(ItemDescrCustomerCaption; ItemDescrCustomerCaptionLbl) { }
                column(ProfileDescription_ProfileCustomer; ACOProfileCustomer."Profile Description") { }
                column(ColorNoteCaption; ColorNoteCaptionLbl) { }
                column(Name_ACOColorProjectHeader; ACOColorProjectHeader.Name) { }
                column(QuantityCaption; QuantityCaptionLbl) { }
                column(ACO_Number_of_Units; "ACO Number of Units") { }
                column(LengthCaption; LengthCaptionLbl) { }
                column(NumberOfMeters; NumberOfMeters) { }
                column(CircumferenceCaption; CircumferenceCaptionLbl) { }
                column(Circumference; Circumference) { }
                column(DefWghtCaption; DefWghtCaptionLbl) { }
                column(WeightPerMeter_ACOProfile; ACOProfile."Weight per meter" * ItemVariant."ACO Number of Meters") { }
                column(ExtraToEnumerateCaption; ExtraToEnumerateCaptionLbl) { }
                column(ACO_Extra_to_Enumerate_Profile; "ACO Extra to Enumerate Profile") { }
                column(FoilCaption; FoilCaptionLbl) { }
                column(IsFoil; Format(IsFoil)) { }
                column(RemoveFoilCaption; RemoveFoilCaptionLbl) { }
                column(RemoveFoil; Format(RemoveFoil)) { }
                column(NetWeightCaption; NetWeightCaptionLbl) { }
                column(NetWeight; NetWeight) { }
                column(GrossWeightCaption; GrossWeightCaptionLbl) { }
                column(GrossWeight; GrossWeight) { }
                column(ChargesPerBathCaption; ChargesPerBathCaptionLbl) { }
                column(QuantityPerBathCaption; QuantityPerBathCaptionLbl) { }
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
                column(CustomerofCustomer_ACOProfileCustomer; ACOProfileCustomer."Customer of Customer")
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
                column(MeasureReportCaption; MeasureReportCaptionLbl) { }
                column(ACO_Measure_Report; Format("ACO Measure Report")) { }
                column(KundentourCaption; KundentourCaptionLbl) { }
                column(ACO_Kundentour_HUECK; "ACO Kundentour HUECK") { }
                // Done >>
                // Holders <<
                column(HolderDataCaption; HolderDataCaptionLbl) { }
                column(HelixStart_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption("Helix Start")) { }
                column(HelixStart_ACOLinkedHolder; ACOLinkedHolder."Helix Start") { }
                column(HelixEnd_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption("Helix End")) { }
                column(HelixEnd_ACOLinkedHolder; ACOLinkedHolder."Helix End") { }
                column(Helix_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption("Helix")) { }
                column(Helix_ACOLinkedHolder; ACOLinkedHolder."Helix") { }
                column(Space_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption(Space)) { }
                column(Space_ACOLinkedHolder; ACOLinkedHolder.Space) { }
                column(AttachMethodCode_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption("Attach Method Code")) { }
                column(Description_ACOAttachmethod; ACOAttachMethod.Description) { }
                column(Comment_ACOLinkedHolderCaption; ACOLinkedHolder.FieldCaption(Comment)) { }
                column(Comment_ACOLinkedHolder; ACOLinkedHolder.Comment) { }
                column(ACOLinkedHolderCaption; ACOLinkedHolderType.TableCaption()) { }
                column(MoldCaption; MoldCaptionLbl) { }
                column(Code_ACOLinkedHolderType1; ACOLinkedHolderType1."Holder Type Code") { }
                column(Code_ACOLinkedHolderType2; ACOLinkedHolderType2."Holder Type Code") { }
                column(Code_ACOLinkedHolderType3; ACOLinkedHolderType3."Holder Type Code") { }
                column(Code_ACOLinkedHolderType4; ACOLinkedHolderType4."Holder Type Code") { }
                column(NameCaption; NameCaptionLbl) { }
                column(Description_ACOLinkedHolderType1; ACOLinkedHolderType1.Description) { }
                column(Description_ACOLinkedHolderType2; ACOLinkedHolderType2.Description) { }
                column(Description_ACOLinkedHolderType3; ACOLinkedHolderType3.Description) { }
                column(Description_ACOLinkedHolderType4; ACOLinkedHolderType4.Description) { }
                column(Quantity_ACOLinkedHolderType1; ACOLinkedHolderType1.Quantity) { }
                column(Quantity_ACOLinkedHolderType2; ACOLinkedHolderType2.Quantity) { }
                column(Quantity_ACOLinkedHolderType3; ACOLinkedHolderType3.Quantity) { }
                column(Quantity_ACOLinkedHolderType4; ACOLinkedHolderType4.Quantity) { }
                column(PositionCaption; PositionCaptionLbl) { }
                column(Position_ACOLinkedHolderType1; Format(ACOLinkedHolderType1.Position)) { }
                column(Position_ACOLinkedHolderType2; Format(ACOLinkedHolderType2.Position)) { }
                column(Position_ACOLinkedHolderType3; Format(ACOLinkedHolderType3.Position)) { }
                column(Position_ACOLinkedHolderType4; Format(ACOLinkedHolderType4.Position)) { }
                column(ACOLinkedSupportHolderCaption; ACOLinkedSupportHolder.TableCaption()) { }
                column(Code_ACOLinkedSupportHolder1; ACOLinkedSupportHolder1."Support Holder Code") { }
                column(Code_ACOLinkedSupportHolder2; ACOLinkedSupportHolder2."Support Holder Code") { }
                column(Code_ACOLinkedSupportHolder3; ACOLinkedSupportHolder3."Support Holder Code") { }
                column(Code_ACOLinkedSupportHolder4; ACOLinkedSupportHolder4."Support Holder Code") { }
                column(Description_ACOLinkedSupportHolder1; ACOLinkedSupportHolder1.Description) { }
                column(Description_ACOLinkedSupportHolder2; ACOLinkedSupportHolder2.Description) { }
                column(Description_ACOLinkedSupportHolder3; ACOLinkedSupportHolder3.Description) { }
                column(Description_ACOLinkedSupportHolder4; ACOLinkedSupportHolder4.Description) { }
                column(Distance_ACOLinkedSupportHolderCaption; ACOLinkedSupportHolder.FieldCaption(Distance)) { }
                column(Distance_ACOLinkedSupportHolder1; ACOLinkedSupportHolder1.Distance) { }
                column(Distance_ACOLinkedSupportHolder2; ACOLinkedSupportHolder2.Distance) { }
                column(Distance_ACOLinkedSupportHolder3; ACOLinkedSupportHolder3.Distance) { }
                column(Distance_ACOLinkedSupportHolder4; ACOLinkedSupportHolder4.Distance) { }
                column(ACOLinkedDistanceHolderCaption; ACOLinkedDistanceHolder.TableCaption()) { }
                column(HolderCaption; HolderCaptionLbl) { }
                column(Description_ACOLinkedDistanceHolder1; ACOLinkedDistanceHolder1."Description") { }
                column(Description_ACOLinkedDistanceHolder2; ACOLinkedDistanceHolder2."Description") { }
                column(Description_ACOLinkedDistanceHolder3; ACOLinkedDistanceHolder3."Description") { }
                column(Description_ACOLinkedDistanceHolder4; ACOLinkedDistanceHolder4."Description") { }
                column(Position_ACOLinkedDistanceHolderCaption; ACOLinkedDistanceHolder.FieldCaption(Position)) { }
                column(Position_ACOLinkedDistanceHolder1; ACOLinkedDistanceHolder1.Position) { }
                column(Position_ACOLinkedDistanceHolder2; ACOLinkedDistanceHolder2.Position) { }
                column(Position_ACOLinkedDistanceHolder3; ACOLinkedDistanceHolder3.Position) { }
                column(Position_ACOLinkedDistanceHolder4; ACOLinkedDistanceHolder4.Position) { }
                column(SalesLineAreaIncHollow; "Sales Line"."ACO Area" * "Sales Line"."ACO Correction Factor Profile") { }
                // Holders >>
                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    RoutingLine: Record "Routing Line";
                    Customer: Record Customer;
                    ACOBathSheetMgt: Codeunit "ACO Bath Sheet Mgt.";
                begin
                    if not ACOProfileCustomer.Get("Sales Line"."ACO Profile Code", "Sales Header"."Sell-to Customer No.", "Sales Line"."ACO Customer Item No.") then
                        Clear(ACOProfileCustomer);

                    Clear(Item);
                    NumberOfBaths := 0;

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    if Type = Type::Item then
                        if Item.Get("No.") then begin
                            if Item."ACO Color" = '' then
                                CurrReport.Skip();

                            if Item."ACO Charges per Bath Profile" <> 0 then
                                NumberOfBaths := "Sales Line"."ACO Number of Units" / Item."ACO Charges per Bath Profile"
                        end;

                    ThinStainingTime := 99999;
                    ThickStainingTime := -1;

                    if not Customer.Get("Sales Line"."Sell-to Customer No.") then
                        Clear(Customer);

                    ACOBathSheetMgt.DetermineStainingTimes("Sales Line", ThinStainingTime, ThickStainingTime, Customer);

                    GetHolders();

                    if ACOProfile.Get("ACO Profile Code") then
                        ACOProfile.CalcFields("Picture File")
                    else
                        Clear(ACOProfile);

                    if not ACOCategory.Get(ACOProfile.Category) then
                        Clear(ACOCategory);

                    if not ACOColorProjectHeader.Get("ACO Project Color Code") then
                        Clear(ACOColorProjectHeader);

                    IsFoil := false;
                    RemoveFoil := false;

                    NumberOfMeters := Round(ItemVariant."ACO Number of Meters" * 1000, 1);

                    Circumference := "Sales Line"."ACO Profile Circumference";
                    NetWeight := ACOProfile."Weight per meter" * "Sales Line"."ACO Number of Units" * ItemVariant."ACO Number of Meters";
                    GrossWeight := NetWeight * ACOAppSetup."Net/Gross Weight Factor";

                    if (ACOAppSetup."Foil Routing No." <> '') and (ACOAppSetup."Wrap Routing No." <> '') and (ACOAppSetup."VEC Routing No." <> '') then begin
                        RoutingLine.SetRange("Routing No.", Item."Routing No.");
                        if RoutingLine.FindSet() then
                            repeat
                                if (ACOAppSetup."Foil Routing No." <> '') and not IsFoil then
                                    IsFoil := RoutingLine."No." = ACOAPPSetup."Foil Routing No.";
                                if (ACOAppSetup."Remove Foil Routing No." <> '') and not RemoveFoil then
                                    RemoveFoil := RoutingLine."No." = ACOAPPSetup."Remove Foil Routing No.";
                                if (ACOAppSetup."Wrap Routing No." <> '') and not IsWrap then
                                    IsWrap := RoutingLine."No." = ACOAPPSetup."Wrap Routing No.";
                                if (ACOAppSetup."VEC Routing No." <> '') and not IsVEC then
                                    IsVEC := RoutingLine."No." = ACOAPPSetup."VEC Routing No.";
                            until (RoutingLine.Next() = 0);
                    end;

                    MinCurrentDensity := 0;
                    MaxCurrentDensity := 1000;
                    ACOBathSheetMgt.DetermineCurrentDensities("Sales Line", MinCurrentDensity, MaxCurrentDensity);
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
                ItemVariant: Record "Item Variant";
                Customer: Record Customer;
                Item: Record Item;
                NumberOfMiliMeters: Decimal;
            begin
                MaxLength := 0;
                NumberOfMiliMeters := 0;
                TotalNumberOfUnits := 0;
                TotalNumberOfBaths := 0;
                TotalArea := 0;
                AreaExcHollow := 0;
                AreaIncHollow := 0;
                ThinStainingTime := 0;
                ThickStainingTime := 0;
                MinCurrentDensity := 0;
                MaxCurrentDensity := 1000;

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
                        if SalesLine.Type = SalesLine.Type::Item then
                            if Item.Get(SalesLine."No.") and (Item."ACO Charges per Bath Profile" <> 0) then
                                TotalNumberOfBaths += SalesLine."ACO Number of Units" / Item."ACO Charges per Bath Profile";

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
        ACOColorProjectHeader: Record "ACO Project Color Header";//New
        ACOCategory: Record "ACO Category";//New
        ACOAppSetup: Record "ACO App Setup";//New
        ACOLinkedHolder: Record "ACO Linked Holder";//New
        ACOLinkedHolderType: Record "ACO Linked Holder Type";//New
        ACOLinkedHolderType1: Record "ACO Linked Holder Type";//New
        ACOLinkedHolderType2: Record "ACO Linked Holder Type";//New

        ACOLinkedHolderType3: Record "ACO Linked Holder Type";//New
        ACOLinkedHolderType4: Record "ACO Linked Holder Type";//New
        ACOLinkedDistanceHolder: Record "ACO Linked Distance Holder";//New
        ACOLinkedDistanceHolder1: Record "ACO Linked Distance Holder";//New
        ACOLinkedDistanceHolder2: Record "ACO Linked Distance Holder";//New
        ACOLinkedDistanceHolder3: Record "ACO Linked Distance Holder";//New
        ACOLinkedDistanceHolder4: Record "ACO Linked Distance Holder";//New
        ACOLinkedSupportHolder: Record "ACO Linked Support Holder";//New
        ACOLinkedSupportHolder1: Record "ACO Linked Support Holder";//New

        ACOLinkedSupportHolder2: Record "ACO Linked Support Holder";//New

        ACOLinkedSupportHolder3: Record "ACO Linked Support Holder";//New

        ACOLinkedSupportHolder4: Record "ACO Linked Support Holder";//New

        ACOAttachMethod: Record "ACO Attach Method";
        BagDescriptionsText: Text;
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
        TotalNumberOfBaths: Decimal;//New
        TotalNumberOfUnits: Decimal; // New
        AreaIncHollow: Decimal; // New
        AreaExcHollow: Decimal; // New
        NumberOfMeters: Decimal; // New
        IsFoil: Boolean;//New
        RemoveFoil: Boolean;
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
        ExtraToEnumerateCaptionLbl: Label 'Extra to Enumerate (mm)';
        FoilCaptionLbl: Label 'Add Foil';
        RemoveFoilCaptionLbl: Label 'Remove Foil';
        GrossWeightCaptionLbl: Label 'Gross Weight';
        NetWeightCaptionLbl: Label 'Net Weight';
        ChargesPerBathCaptionLbl: Label 'Charge per Bath';
        QuantityPerBathCaptionLbl: Label 'Quantity per Bath';
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
        MeasureReportCaptionLbl: Label 'Measure Report';
        KundentourCaptionLbl: Label 'Kundentour';
        HolderDataCaptionLbl: Label 'Holder Data';
        HolderCaptionLbl: Label 'Holder';
        MoldCaptionLbl: Label 'Mold';
        NameCaptionLbl: Label 'Name';
        PositionCaptionLbl: Label 'Position';
        // Totals
        FillClampedTotalsHereCaptionLbl: Label 'Fill in the clamped totals here (OK + Rejected)';
        QuantityOKCaptionLbl: Label 'Quantity OK';
        QuantityRejectedWithReasonsCaptionLbl: Label 'Quantity rejected with reason(s)';
        TotalsCaptionLbl: Label 'Totals';
        NumberOfUnitsCaptionLbl: Label 'Number of Units';
        AreaLineCaptionLbl: Label 'Area Line';
        AreaWorknoteCaptionLbl: Label 'Area Worknote';
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
        ClearHolderVariables();

        ACOLinkedHolder.SetRange(Code, "Sales Line"."ACO Linked Holder");
        ACOLinkedHolder.SetRange("Customer No.", ACOProfileCustomer."Customer No.");
        ACOLinkedHolder.SetRange("Item No.", ACOProfileCustomer."Profile Code");
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOLinkedHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);
        if ACOLinkedHolder.FindFirst() then begin
            if ACOLinkedHolder."Attach Method Code" <> '' then
                ACOAttachMethod.Get(ACOLinkedHolder."Attach Method Code");

            ACOLinkedHolderType.SetRange("Holder Code", ACOLinkedHolder.Code);
            ACOLinkedHolderType.SetRange("Customer No.", ACOProfileCustomer."Customer No.");
            ACOLinkedHolderType.SetRange("Item No.", ACOProfileCustomer."Profile Code");
            if ItemVariant."ACO Number of Meters" <> 0 then
                ACOLinkedHolderType.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

            if ACOLinkedHolderType.FindSet() then
                repeat
                    Counter += 1;
                    case Counter of
                        1:
                            ACOLinkedHolderType1 := ACOLinkedHolderType;
                        2:
                            ACOLinkedHolderType2 := ACOLinkedHolderType;
                        3:
                            ACOLinkedHolderType3 := ACOLinkedHolderType;
                        4:
                            ACOLinkedHolderType4 := ACOLinkedHolderType;
                    end;
                until ACOLinkedHolderType.Next() = 0;

            Counter := 0;
            ACOLinkedDistanceHolder.SetRange("Holder Code", ACOLinkedHolder.Code);
            ACOLinkedDistanceHolder.SetRange("Customer No.", ACOProfileCustomer."Customer No.");
            ACOLinkedDistanceHolder.SetRange("Item No.", ACOProfileCustomer."Profile Code");
            if ItemVariant."ACO Number of Meters" <> 0 then
                ACOLinkedDistanceHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

            if ACOLinkedDistanceHolder.FindSet() then
                repeat
                    Counter += 1;
                    case Counter of
                        1:
                            ACOLinkedDistanceHolder1 := ACOLinkedDistanceHolder;
                        2:
                            ACOLinkedDistanceHolder2 := ACOLinkedDistanceHolder;
                        3:
                            ACOLinkedDistanceHolder3 := ACOLinkedDistanceHolder;
                        4:
                            ACOLinkedDistanceHolder4 := ACOLinkedDistanceHolder;
                    end;
                until ACOLinkedDistanceHolder.Next() = 0;

            Counter := 0;
            ACOLinkedSupportHolder.SetRange("Holder Code", ACOLinkedHolder.Code);
            ACOLinkedSupportHolder.SetRange("Customer No.", ACOProfileCustomer."Customer No.");
            ACOLinkedSupportHolder.SetRange("Item No.", ACOProfileCustomer."Profile Code");
            if ItemVariant."ACO Number of Meters" <> 0 then
                ACOLinkedSupportHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

            if ACOLinkedSupportHolder.FindSet() then
                repeat
                    Counter += 1;
                    case Counter of
                        1:
                            ACOLinkedSupportHolder1 := ACOLinkedSupportHolder;
                        2:
                            ACOLinkedSupportHolder2 := ACOLinkedSupportHolder;
                        3:
                            ACOLinkedSupportHolder3 := ACOLinkedSupportHolder;
                        4:
                            ACOLinkedSupportHolder4 := ACOLinkedSupportHolder;
                    end;
                until ACOLinkedSupportHolder.Next() = 0;
        end;
    end;

    local procedure ClearHolderVariables()
    begin
        Clear(ACOLinkedHolder);
        Clear(ACOLinkedHolderType);
        Clear(ACOLinkedHolderType1);
        Clear(ACOLinkedHolderType2);
        Clear(ACOLinkedHolderType3);
        Clear(ACOLinkedHolderType4);
        Clear(ACOLinkedDistanceHolder);
        Clear(ACOLinkedDistanceHolder1);
        Clear(ACOLinkedDistanceHolder2);
        Clear(ACOLinkedDistanceHolder3);
        Clear(ACOLinkedDistanceHolder4);
        Clear(ACOLinkedSupportHolder);
        Clear(ACOLinkedSupportHolder1);
        Clear(ACOLinkedSupportHolder2);
        Clear(ACOLinkedSupportHolder3);
        Clear(ACOLinkedSupportHolder4);
    end;
}
