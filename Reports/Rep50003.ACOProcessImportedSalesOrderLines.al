report 50003 "ACO Process Import Sales Lines"
{
    ProcessingOnly = true;
    dataset
    {
        dataitem("ACO Imported Sales Order Line"; "ACO Imported Sales Order Line")
        {
            trigger OnAfterGetRecord()
            begin
                ProcessLine("ACO Imported Sales Order Line");
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Status, Status::New);
            end;
        }
    }

    local procedure ProcessLine(ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line")
    var
        ACOImportedSalesOrderLine2: Record "ACO Imported Sales Order Line";
        ACOImportedSalesOrderLine3: Record "ACO Imported Sales Order Line";
        ACOCreateSalesQuoteMgt: Codeunit "ACO Create Sales Quote Mgt.";
    begin
        CheckLine(ACOImportedSalesOrderLine);
        if ACOCreateSalesQuoteMgt.Run(ACOImportedSalesOrderLine) then begin
            ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Checked;
            ACOImportedSalesOrderLine."Error Message" := CopyStr(GetLastErrorText(), 1, StrLen(ACOImportedSalesOrderLine."Error Message"));
        end else begin
            ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Error;
            ACOImportedSalesOrderLine."Error Message" := CopyStr(GetLastErrorText(), 1, StrLen(ACOImportedSalesOrderLine."Error Message"));
        end;

        ACOImportedSalesOrderLine.Modify();

        ACOImportedSalesOrderLine2.SetCurrentKey("Order No.");
        ACOImportedSalesOrderLine3.SetCurrentKey("Order No.", Status);
        ACOImportedSalesOrderLine2.SetRange("Order No.", ACOImportedSalesOrderLine."Order No.");
        ACOImportedSalesOrderLine3.SetRange("Order No.", ACOImportedSalesOrderLine."Order No.");
        ACOImportedSalesOrderLine3.SetRange(Status, ACOImportedSalesOrderLine3.Status::Checked);

        if ACOImportedSalesOrderLine2.Count() = ACOImportedSalesOrderLine3.Count() then
            ACOImportedSalesOrderLine2.ModifyAll(Status, ACOImportedSalesOrderLine2.Status::Processed);

        // ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
    end;

    local procedure CheckLine(ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
        Item: Record Item;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOCategory: Record "ACO Category";
        SalesQuote: Record "Sales Header";
        CustomerDoesNotExistLbl: Label 'Customer does not exist as Customer in the database or as EDI Customer.';
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
        if not Customer.Get(ACOImportedSalesOrderLine."Sell-to Customer No.") then begin
            ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Error;
            ACOImportedSalesOrderLine."Error Message" := CustomerDoesNotExistLbl;
            exit;
        end;

        if SalesLine.Insert(true) then
            ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
    end;
}