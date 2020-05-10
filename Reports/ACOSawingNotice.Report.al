report 50006 "ACO Sawing Notice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOSawingNotice.rdl';
    Caption = 'Sawing Notice';

    dataset
    {

        dataitem("Sales Line"; "Sales Line")
        {
            column(SawingNoteCaption; SawingNoteCaptionlbl) { }
            column(Picture_CompanyInfo; CompanyInfo.Picture) { }

            column(SalesOrderNoCaption; SalesOrderNoCaptionLbl) { }
            column(No_; SalesHeader."No.") { }
            column(CustomerNameCaption; CustomerCaptionLbl) { }
            column(Sell_to_Customer_Name; SalesHeader."Sell-to Customer Name") { }
            column(PrintingDateCaption; PrintingDateCaptionLbl) { }
            column(PrintingDate; CurrentDateTime()) { }
            column(CreatedbyCaption; CreatedbyCaptioNLbl) { }
            column(CreatedbyUser; User."User Name") { }
            column(SalesOrderLineNoCaption; SalesOrderLineNoCaptionLbl) { }
            column(Line_No_; "Line No.") { }
            column(ItemCaption; ItemCaptionLbl) { }
            column(ACO_Profile_Code; "ACO Profile Code") { }
            column(TotalQuantityCaption; TotalQuantityCaptionLbl) { }
            column(ACO_Number_of_Units; "ACO Number of Units") { }
            column(LengthCaption; LengthCaptionLbl) { }
            column(NumberOfMeters; Round(ItemVariant."ACO Number of Meters" * 1000, 1)) { }
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
            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesHeader.Get("Document Type", "Document No.");
                ACOProfileCustomer.SetRange("Profile Code", "Sales Line"."ACO Profile Code");
                ACOProfileCustomer.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                ACOProfileCustomer.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
                if not ACOProfileCustomer.FindFirst() then
                    Clear(ACOProfileCustomer);

                if not ItemVariant.Get("No.", "Variant Code") then
                    Clear(ItemVariant);

                if not ACOProfile.Get("ACO Profile Code") then
                    Clear(ACOProfile);

                SalesLine.Reset();
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "Document No.");
                if SalesLine.FindSet() then
                    repeat
                        BagDescriptionsText += SalesLine."ACO Receipt Bag" + '/';
                        TotalNumberOfUnits += SalesLine."ACO Number of Units";
                    until SalesLine.Next() = 0;

                if StrLen(BagDescriptionsText) > 1 then
                    BagDescriptionsText := CopyStr(BagDescriptionsText, 1, StrLen(BagDescriptionsText) - 1);
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Type, Type::Item);
            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        User: Record User;
        CompanyInfo: Record "Company Information";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        SalesHeader: Record "Sales Header";
        BagDescriptionsText: Text;
        TotalNumberOfUnits: Decimal;
        SawingNoteCaptionLbl: Label 'Sawing Notice';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        SalesOrderLineNoCaptionLbl: Label 'Sales Order Line No.';
        CustomerCaptionLbl: Label 'Customer';
        TotalQuantityCaptionLbl: Label 'Total Quantity';
        ItemCaptionLbl: Label 'Item';
        LengthCaptionLbl: Label 'Length';
        DateCaptionLbl: Label 'Date';
        DeliveryDateCaptionLbl: Label 'Delivery Date';
        ItemNoCustomerCaptionLbl: Label 'Item No. Customer';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
}
