report 50006 "ACO Sawing Notice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOSawingNotice.rdl';
    Caption = 'Sawing Notice';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(SawingNoteCaption; SawingNoteCaptionlbl) { }
            column(Picture_CompanyInfo; CompanyInfo.Picture) { }

            column(SalesOrderNoCaption; SalesOrderNoCaptionLbl) { }
            column(No_; "No.") { }
            column(CustomerNameCaption; CustomerCaptionLbl) { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(PrintingDateCaption; PrintingDateCaptionLbl) { }
            column(PrintingDate; CurrentDateTime()) { }
            column(CreatedbyCaption; CreatedbyCaptioNLbl) { }
            column(CreatedbyUser; User."User Name") { }
            column(TotalQuantityCaption; TotalQuantityCaptionLbl) { }
            column(TotalQuantity; TotalQuantity) { }

            column(PackagingInstructionsCaption; PackagingInstructionsCaptionLbl) { }
            column(PackagingCaption; PackagingCaptionLbl) { }
            // column(PackageTypeCaption; PackageTypeCaptionLbl) { }
            column(KindCaption; KindCaptionLbl) { }
            column(TypeCaption; TypeCaptionLbl) { }
            column(InsideCaption; InsideCaptionLbl) { }
            column(ProfilesCaption; ProfilesCaptionLbl) { }
            column(QuantityCaption; QuantityCaptionLbl) { }
            column(UOMCaption; UOMCaptionLbl) { }
            column(InsideUOMCaption; InsideUOMCaptionLbl) { }
            column(BuildupLayerCaption; BuildupLayerCaptionLbl) { }
            column(PackagingStructureCaption; PackagingStructureCaptionLbl) { }
            column(QuantityPerLayerCaption; QuantityPerLayerCaptionLbl) { }
            column(NumberOfLayersCaption; NumberOfLayersCaptionLbl) { }
            column(MaxWidthCaption; MaxWidthCaptionLbl) { }
            column(MaxHeightCaption; MaxHeightCaptionLbl) { }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                DataItemLinkReference = "Sales Header";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(SalesOrderLineNoCaption; SalesOrderLineNoCaptionLbl) { }
                column(Line_No_; "Line No.") { }
                column(ItemCaption; ItemCaptionLbl) { }
                column(ACO_Profile_Code; "ACO Profile Code") { }

                column(LengthCaption; LengthCaptionLbl) { }
                column(ACO_Start_Length; "ACO Start Length") { }
                column(DateCaption; DateCaptionLbl) { }
                column(WorkDate; WorkDate()) { }
                column(DeliveryDateCaption; DeliveryDateCaptionLbl) { }
                column(Shipment_Date; "Shipment Date") { }
                column(ACO_Return_RemainingCaption; FieldCaption("ACO Return Remaining")) { }
                column(ACO_Return_Remaining; Format("ACO Return Remaining")) { }
                column(ACO_Head_CutCaption; FieldCaption("ACO Head Cut")) { }
                column(ACO_Head_Cut; Format("ACO Head Cut")) { }
                column(ACO_Lower_AccuracyCaption; FieldCaption("ACO Lower Accuracy")) { }
                column(ACO_Lower_Accuracy; "ACO Lower Accuracy") { }
                column(ACO_Upper_AccuracyCaption; FieldCaption("ACO Upper Accuracy")) { }
                column(ACO_Upper_Accuracy; "ACO Upper Accuracy") { }
                column(QuantityAfterSawingCaption; QuantityAfterSawingCaptionLbl) { }
                column(QuantityAfterSawing; QuantityAfterSawing) { }
                column(LengthAfterSawingCaption; LengthAfterSawingCaptionLbl) { }
                column(LengthAfterSawing; LengthAfterSawing) { }
                column(LengthProfileCaption; LengthProfileCaptionLbl) { }
                column(RemCaption; RemCaptionLbl) { }
                column(Remaining; Remaining) { }

                trigger OnAfterGetRecord()
                begin
                    ACOProfileCustomer.SetRange("Profile Code", "Sales Line"."ACO Profile Code");
                    ACOProfileCustomer.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                    // ACOProfileCustomer.SetRange("Ship-to Code", "Sales Header"."Ship-to Code");
                    if not ACOProfileCustomer.FindFirst() then
                        Clear(ACOProfileCustomer);

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    if not ACOProfile.Get("ACO Profile Code") then
                        Clear(ACOProfile);

                    // NumberOfMeters := Round(ItemVariant."ACO Number of Meters", 1) * 1000;
                    LengthAfterSawing := ItemVariant."ACO Number of Meters" * 1000;
                    QuantityAfterSawing := Round(("ACO Start Length" - ACOAppSetup."Min. Residue Saw") / LengthAfterSawing, 1, '<');
                    TotalQuantity := "ACO Number of Units" / QuantityAfterSawing;
                    Remaining := "ACO Start Length" - (QuantityAfterSawing * LengthAfterSawing);
                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Type, Type::Item);
                    SetRange("ACO Sawing", true);
                end;
            }
            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.FindSet() then
                    repeat
                        BagDescriptionsText += SalesLine."ACO Receipt Bag" + '/';
                    // TotalQuantity += SalesLine."ACO Number of Units" / Round((SalesLine."ACO Start Length" - ACOAppSetup."Min. Residue Saw") / (ItemVariant."ACO Number of Meters" * 1000), 1, '<');
                    until SalesLine.Next() = 0;

                if StrLen(BagDescriptionsText) > 1 then
                    BagDescriptionsText := CopyStr(BagDescriptionsText, 1, StrLen(BagDescriptionsText) - 1);
            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        ACOAppSetup.Get();
    end;

    var
        User: Record User;
        CompanyInfo: Record "Company Information";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOAppSetup: Record "ACO App Setup";
        BagDescriptionsText: Text;
        //TotalNumberOfUnits: Decimal;
        //NumberOfMeters: Decimal;
        TotalQuantity: Decimal;
        QuantityAfterSawing: Decimal;
        LengthAfterSawing: Decimal;
        Remaining: Decimal;
        SawingNoteCaptionLbl: Label 'Sawing Notice';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        SalesOrderLineNoCaptionLbl: Label 'Sales Order Line No.';
        CustomerCaptionLbl: Label 'Customer';
        TotalQuantityCaptionLbl: Label 'Total Quantity';
        ItemCaptionLbl: Label 'Item';
        LengthCaptionLbl: Label 'Length';
        DateCaptionLbl: Label 'Date';
        DeliveryDateCaptionLbl: Label 'Delivery Date';
        // ItemNoCustomerCaptionLbl: Label 'Item No. Customer';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
        QuantityAfterSawingCaptionLbl: Label 'Quantity (after sawing)';
        LengthAfterSawingCaptionLbl: Label 'Length (after sawing)';
        LengthProfileCaptionLbl: Label 'Length Profile';
        RemCaptionLbl: Label 'Rem.';
        // New 
        PackagingInstructionsCaptionLbl: Label 'Packaging Instructions';
        PackagingCaptionLbl: Label 'Packaging';
        KindCaptionLbl: Label 'Kind';
        TypeCaptionLbl: Label 'Type';
        InsideCaptionLbl: Label 'Inside';
        ProfilesCaptionLbl: Label 'Profiles';
        QuantityCaptionLbl: Label 'Quantity';
        UOMCaptionLbl: Label 'Unit of Measure';
        InsideUOMCaptionLbl: Label 'Inside Unit of Measure';
        BuildupLayerCaptionLbl: Label 'Build-up Layer';
        PackagingStructureCaptionLbl: Label 'Packaging Structure';
        QuantityPerLayerCaptionLbl: Label '# per Layer';
        NumberOfLayersCaptionLbl: Label '# Layers';
        MaxWidthCaptionLbl: Label 'Max Width';
        MaxHeightCaptionLbl: Label 'Max Height';
}
