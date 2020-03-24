codeunit 50004 "ACO Create Sales Quote Mgt."
{
    TableNo = "ACO Imported Sales Order Line";
    trigger OnRun()
    begin
        FindOrCreateSalesQuote(Rec);
    end;

    local procedure FindOrCreateSalesQuote(var ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line")
    var
        SalesHeader: Record "Sales Header";
        RequestedDeliveryDate: Date;
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
        SalesHeader.Validate("Sell-to Customer No.", CopyStr(ACOImportedSalesOrderLine."Sell-to Customer No.", 1, MaxStrLen(SalesHeader."Sell-to Customer No.")));
        SalesHeader."Sell-to Customer Name" := CopyStr(ACOImportedSalesOrderLine."Sell-to Customer Name", 1, MaxStrLen(SalesHeader."Sell-to Customer Name"));
        SalesHeader.Validate("Bill-to Customer No.", CopyStr(ACOImportedSalesOrderLine."Bill-to Customer No.", 1, MaxStrLen(SalesHeader."Bill-to Customer No.")));
        SalesHeader."Bill-to Name" := CopyStr(ACOImportedSalesOrderLine."Bill-to Customer Name", 1, MaxStrLen(SalesHeader."Bill-to Name"));
        SalesHeader.Validate("Ship-to Code", CopyStr(ACOImportedSalesOrderLine."Ship-to Code", 1, MaxStrLen(SalesHeader."Ship-to Code")));
        if Evaluate(RequestedDeliveryDate, ACOImportedSalesOrderLine."Requested Delivery Date") then
            SalesHeader.Validate("Requested Delivery Date", RequestedDeliveryDate);

        SalesHeader."External Document No." := CopyStr(ACOImportedSalesOrderLine."External Document No.", 1, MaxStrLen(SalesHeader."External Document No."));
        SalesHeader.Insert(true);

        ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
        ACOImportedSalesOrderLine.Modify();

        CreateSalesQuoteLine(ACOImportedSalesOrderLine, SalesHeader);
    end;

    local procedure CreateSalesQuoteLine(var ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line"; SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        LastSalesLine: Record "Sales Line";
        LineNo: Integer;
        NumberOfUnits: Decimal;
    begin
        LastSalesLine.SetRange("Document Type", SalesHeader."Document Type");
        LastSalesLine.SetRange("Document No.", SalesHeader."No.");
        if LastSalesLine.FindLast() then
            LineNo := LastSalesLine."Line No." + 10000
        else
            LineNo := 10000;

        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := LineNo;
        SalesLine.Insert(true);

        SalesLine.Type := SalesLine.Type::Item;
        SalesLine.Validate("No.", CopyStr(ACOImportedSalesOrderLine."Item No.", 1, MaxStrLen(SalesLine."No.")));
        SalesLine.Validate("ACO Profile Code", CopyStr(ACOImportedSalesOrderLine."Profile Code", 1, MaxStrLen(SalesLine."ACO Profile Code")));
        SalesLine.Validate("Variant Code", CopyStr(ACOImportedSalesOrderLine."Variant Code", 1, MaxStrLen(SalesLine."Variant Code")));

        if Evaluate(NumberOfUnits, ACOImportedSalesOrderLine."Number of Units") then
            SalesLine.Validate("ACO Number of Units", NumberOfUnits);

        SalesLine.Modify(true);
    end;

}