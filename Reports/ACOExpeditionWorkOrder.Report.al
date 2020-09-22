report 50004 "ACO Expedition Work Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOExpeditionWorkOrder.rdl';
    Caption = 'Expedition Work Order';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(ExpeditionWorkOrderCaption; ExpeditionWorkOrderCaptionLbl) { }
            column(CustomerNameCaption; CustomerCaptionLbl) { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }

            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(YourReferenceCaption; YourReferenceCaptionLbl) { }
            column(Your_Reference; "Your Reference")
            {
            }

            column(NoteCaption; NoteCaptionLbl) { }
            column(ACO_Customer_Comment; "ACO Customer Comment")
            {
            }
            column(SalesOrderNoCaption; SalesOrderNoCaptionLbl) { }
            column(No_; "No.")
            {
            }
            column(OverviewVendorsAndBinsCaption; OverviewVendorsAndBinsCaptionLbl) { }
            column(SupplierCaption; SupplierCaptionLbl) { }
            column(ACO_Supplier; "ACO Supplier")
            {

            }
            column(BagDescriptionCaption; BagDescriptionCaptionLbl) { }
            column(BagDescriptionsText; BagDescriptionsText)
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
            column(DeliveryIDCaption; DeliveryIDCaptionLbl) { }
            column(External_Document_No_; "External Document No.")
            {
            }
            column(PrintingDateCaption; PrintingDateCaptionLbl) { }
            column(PrintingDate; CurrentDateTime())
            {
            }
            column(CreatedbyCaption; CreatedbyCaptioNLbl) { }
            column(CreatedbyUser; User."User Name")
            {
            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");

                column(Line_No_; "Line No.")
                {
                }

                column(ACO_Receipt_Bag; "ACO Receipt Bag")
                {
                }

                column(ItemNoAlucolCaption; ItemNoAlucolCaptionLbl) { }

                column(ACO_Profile_Code; "ACO Profile Code")
                {
                }

                column(ItemNoCustomerCaption; ItemNoCustomerCaptionLbl) { }
                column(CustomerItemNo; ACOProfileCustomer."Customer Item No.")
                {
                }

                column(QuantityCaption; QuantityCaptionLbl) { }
                column(ACO_Number_of_Units; "ACO Number of Units")
                {
                }

                column(LengthCaption; LengthCaptionLbl) { }
                column(NumberOfMeters; NumberOfMeters)
                {
                }

                column(LocationCaption; LocationCaptionLbl) { }
                column(ACO_Receipt_Shelf; "ACO Receipt Shelf")
                {
                }
                column(PictureFile_ACOProfile; ACOProfile."Picture File")
                {
                }

                column(ProfileDescription_ACOProfileCustomerCaption; ACOProfileCustomer.FieldCaption("Profile Description"))
                {
                }
                column(ProfileDescription_ACOProfileCustomer; ACOProfileCustomer."Profile Description")
                {
                }
                column(CustomerofCustomer_ACOProfileCustomerCaption; ACOProfileCustomer.FieldCaption("Customer of Customer"))
                {
                }
                column(CustomerofCustomer_ACOProfileCustomer; ACOProfileCustomer."Customer of Customer")
                {
                }
                trigger OnAfterGetRecord()

                begin
                    ACOProfileCustomer.SetRange("Profile Code", "Sales Line"."ACO Profile Code");
                    ACOProfileCustomer.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                    if not ACOProfileCustomer.FindFirst() then
                        Clear(ACOProfileCustomer);

                    if not ItemVariant.Get("No.", "Variant Code") then
                        Clear(ItemVariant);

                    if ACOProfile.Get("ACO Profile Code") then
                        ACOProfile.CalcFields("Picture File")
                    else
                        Clear(ACOProfile);

                    if "ACO Sawing" and ("ACO Final Length" <> 0) then
                        NumberOfMeters := "ACO Final Length"
                    else
                        NumberOfMeters := Round(ItemVariant."ACO Number of Meters" * 1000, 1);
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
                ACOProfile: Record "ACO Profile";
                Item: Record Item;
            begin
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                if SalesLine.FindSet() then
                    repeat
                        BagDescriptionsText += SalesLine."ACO Receipt Bag" + '/';
                        TotalNumberOfUnits += SalesLine."ACO Number of Units";
                    until SalesLine.Next() = 0;

                if StrLen(BagDescriptionsText) > 1 then
                    BagDescriptionsText := CopyStr(BagDescriptionsText, 1, StrLen(BagDescriptionsText) - 1);

            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
    end;

    var
        User: Record User;
        ACOProfileCustomer: Record "ACO Profile Customer";
        ItemVariant: Record "Item Variant";
        ACOColor: Record "ACO Color";
        ACOProfile: Record "ACO Profile";
        CustomerName: Text[100];
        ItemDescription: Text[100];
        MeasureText: Text;
        BagDescriptionsText: Text;
        TotalNumberOfUnits: Decimal;
        NumberOfMeters: Decimal;
        CustomerCaptionLbl: Label 'Customer';
        YourReferenceCaptionLbl: Label 'Your Reference';
        NoteCaptionLbl: Label 'Note';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        ExpeditionWorkOrderCaptionLbl: Label 'Expedition Work Order';
        WorkOrderNoCaptionLbl: Label 'Work Order No.';
        OverviewVendorsAndBinsCaptionLbl: Label 'Overview Vendors and Bins';
        SupplierCaptionLbl: Label 'Supplier';
        BagDescriptionCaptionLbl: Label 'Bag Description';
        TotalNumberOfUnitsCaptionLbl: Label 'Total Number of Units';
        DeliveryDateCaptionLbl: Label 'Delivery Date';
        DeliveryIDCaptionLbl: Label 'DeliveryID';
        ThinStainingCaptionLbl: Label 'Thin Staining';
        ItemNoAlucolCaptionLbl: Label 'Item No. Alucol';
        ItemNoCustomerCaptionLbl: Label 'Item No. Customer';
        QuantityCaptionLbl: Label 'Quantity';
        LengthCaptionLbl: Label 'Length';
        LocationCaptionLbl: Label 'Location';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
}
