report 50003 "ACO Process Import Sales Lines"
{
    ProcessingOnly = true;
    dataset
    {
        dataitem("ACO Imported Sales Order Line"; "ACO Imported Sales Order Line")
        {
            trigger OnAfterGetRecord()
            begin
                if CheckLine("ACO Imported Sales Order Line") then
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
        ACOCreateSalesQuoteMgt: Codeunit "ACO Create Sales Quote Mgt.";
    begin
        if ACOCreateSalesQuoteMgt.Run(ACOImportedSalesOrderLine) then begin
            ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Checked;
            ACOImportedSalesOrderLine."Error Message" := CopyStr(GetLastErrorText(), 1, StrLen(ACOImportedSalesOrderLine."Error Message"));
        end else begin
            ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Error;
            ACOImportedSalesOrderLine."Error Message" := CopyStr(GetLastErrorText(), 1, StrLen(ACOImportedSalesOrderLine."Error Message"));
        end;

        ACOImportedSalesOrderLine.Modify();

        CheckSetStatusToProcessed(CopyStr(ACOImportedSalesOrderLine."Order No.", 1, 20));


        // ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
    end;

    local procedure CheckLine(ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line"): Boolean
    var
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
        Item: Record Item;
        ItemVariant: Record "Item Variant";
        ACOProfile: Record "ACO Profile";
        ACOProfileCustomer: Record "ACO Profile Customer";
        NumberOfUnits: Decimal;
        CustomerDoesNotExistLbl: Label 'Customer %1 does not exist as Customer in the database or as EDI Customer.';
        ItemDoesNotExistLbl: Label 'Item %1 does not exist.';
        ItemVariantDoesNotExistLbl: Label 'Item Variant with Item No. %1 and Variant Code %2 does not exist.';
        InvalidValueForNumberofUnitsLbl: Label 'Invalid value %1 for field Number of Units.';
        NumberOfUnitsNotLargerThanZeroLbl: Label 'Number of Units is not larger than 0.';
        ProfileCodeDoesNotExistLbl: Label 'Profile Code %1 does not exist.';
        ProfileCustomerDoesNotExistLbl: Label 'Profile Code %1 does not exist as a Profile Customer.';
        CategoryProfileNotIdenticalToCategoryItemLbl: Label 'The Category of the Profile is not identical to the Category of the Item';
    begin
        //
        // if an error occurs for the Job Queue, the Error Message wont be filled, so no errors
        //
        SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;

        // Will the GETs give an error on the length of the field?
        if not Customer.Get(ACOImportedSalesOrderLine."Sell-to Customer No.") then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(CustomerDoesNotExistLbl, ACOImportedSalesOrderLine."Sell-to Customer No."));
            exit(false);
        end;

        if not Item.Get(ACOImportedSalesOrderLine."Item No.") then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(ItemDoesNotExistLbl, ACOImportedSalesOrderLine."Item No."));
            exit(false);
        end;

        if not ItemVariant.Get(ACOImportedSalesOrderLine."Item No.", "ACO Imported Sales Order Line"."Variant Code") then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(ItemVariantDoesNotExistLbl, ACOImportedSalesOrderLine."Item No.", ACOImportedSalesOrderLine."Variant Code"));
            exit(false);
        end;

        if not Evaluate(NumberOfUnits, ACOImportedSalesOrderLine."Number of Units") then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(InvalidValueForNumberofUnitsLbl, ACOImportedSalesOrderLine."Number of Units"));
            exit(false);
        end;

        if NumberOfUnits <= 0 then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, NumberOfUnitsNotLargerThanZeroLbl);
            exit(false);
        end;

        if not ACOProfile.Get(ACOImportedSalesOrderLine."Profile Code") then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(ProfileCodeDoesNotExistLbl, ACOImportedSalesOrderLine."Profile Code"));
            exit(false);
        end;

        ACOProfileCustomer.SetRange("Profile Code", ACOImportedSalesOrderLine."Profile Code");
        ACOProfileCustomer.SetRange("Customer No.", Customer."No.");
        if ACOProfileCustomer.IsEmpty() then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, StrSubstNo(ProfileCustomerDoesNotExistLbl, ACOImportedSalesOrderLine."Profile Code"));
            exit(false);
        end;

        if ACOProfile.Category <> Item."ACO Category Code" then begin
            ChangeErrorMessage(ACOImportedSalesOrderLine, CategoryProfileNotIdenticalToCategoryItemLbl);
            exit(false);
        end;
    end;

    local procedure ChangeErrorMessage(var ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line"; ErrorMessage: Text)
    begin
        ACOImportedSalesOrderLine.Status := ACOImportedSalesOrderLine.Status::Error;
        ACOImportedSalesOrderLine."Error Message" := CopyStr(ErrorMessage, 1, MaxStrLen(ACOImportedSalesOrderLine."Error Message"));
        ACOImportedSalesOrderLine.Modify();
    end;

    local procedure CheckSetStatusToProcessed(OrderNo: Code[20])
    var
        ACOImportedSalesOrderLine2: Record "ACO Imported Sales Order Line";
        ACOImportedSalesOrderLine3: Record "ACO Imported Sales Order Line";
    begin
        ACOImportedSalesOrderLine2.SetCurrentKey("Order No.");
        ACOImportedSalesOrderLine3.SetCurrentKey("Order No.", Status);

        ACOImportedSalesOrderLine2.SetRange("Order No.", OrderNo);
        ACOImportedSalesOrderLine3.SetRange("Order No.", OrderNo);
        ACOImportedSalesOrderLine3.SetRange(Status, ACOImportedSalesOrderLine3.Status::Checked);

        if ACOImportedSalesOrderLine2.Count() = ACOImportedSalesOrderLine3.Count() then
            ACOImportedSalesOrderLine2.ModifyAll(Status, ACOImportedSalesOrderLine2.Status::Processed);

    end;
}