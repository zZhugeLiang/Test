reportextension 50000 "ACO Order" extends "Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(Expected_Receipt_Date; "Expected Receipt Date") { }
        }

        add(RoundLoop)
        {
            column(ProdOrderNo; "Purchase Line"."Prod. Order No.") { }
            column(ProdOrderLineNo; "Purchase Line"."Prod. Order Line No.") { }
            column(DocumentNo_SalesLine; ACOSalesLine."Document No.") { }
            column(LineNo_SalesLine; ACOSalesLine."Line No.") { }
            column(ACOProfileCode_SalesLine; ACOSalesLine."ACO Profile Code") { }
            column(Description_ACOProfile; ACOProfile."Description") { }
            column(CustomerItemNo_SalesLine; ACOSalesLine."ACO Customer Item No.") { }
            column(ProfileDescription_ProfileCustomer; ACOProfileCustomer."Profile Description") { }
            column(ACO_Number_of_Units_SalesLine; ACOSalesLine."ACO Number of Units") { }
            column(NumberOfMeters_SalesLine; ACOItemVariant."ACO Number of Meters") { }
            column(Circumference_SalesLine; ACOSalesLine."ACO Profile Circumference") { }
            column(WeightPerMeter_ACOProfile; ACOProfile."Weight per meter") { }
            column(ACO_Sawing_SalesLine; Format(ACOSalesLine."ACO Sawing")) { }
            column(ACO_Head_Cut_SalesLine; ACOSalesLine."ACO Head Cut") { }
            column(ACO_Return_Remaining_SalesLine; ACOSalesLine."ACO Return Remaining") { }
            column(ACOLowerAccuracy_SalesLine; ACOSalesLine."ACO Lower Accuracy") { }
            column(ACOUpperAccuracy_SalesLine; ACOSalesLine."ACO Upper Accuracy") { }
            column(Picture_FileACOProfile; ACOProfile."Picture File") { }
            column(ACOReceiptBag_ACOSalesLine; ACOSalesLine."ACO Receipt Bag") { }
            column(Description_ACOPretreatment; ACOPretreatment.Description) { }
        }
        modify(RoundLoop)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(ACOProdOrderLine);
                Clear(ACOSalesLine);
                Clear(ACOProfile);
                Clear(ACOProfileCustomer);
                Clear(ACOItemVariant);
                Clear(ACOItem);
                Clear(ACOPretreatment);
                if ACOProdOrderLine.Get(ACOProdOrderLine.Status::Released, "Purchase Line"."Prod. Order No.", "Purchase Line"."Prod. Order Line No.") then
                    if ACOSalesLine.Get(ACOSalesLine."Document Type"::Order, ACOProdOrderLine."ACO Source No.", ACOProdOrderLine."ACO Source Line No.") then begin
                        if ACOProfile.Get(ACOSalesLine."ACO Profile Code") then
                            ACOProfile.CalcFields("Picture File");
                        if ACOProfileCustomer.Get(ACOSalesLine."ACO Profile Code", ACOSalesLine."Sell-to Customer No.", ACOSalesLine."ACO Customer Item No.") then;
                        if ACOItemVariant.Get(ACOSalesLine."No.", ACOSalesLine."Variant Code") then;
                        if ACOItem.Get(ACOSalesLine."No.") then
                            if ACOPretreatment.Get(ACOItem."ACO Pretreatment") then;
                    end;
            end;
        }
    }

    var
        ACOSalesLine: Record "Sales Line";
        ACOProdOrderLine: Record "Prod. Order Line";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOItemVariant: Record "Item Variant";
        ACOItem: Record Item;
        ACOPretreatment: Record "ACO Pretreatment";
}