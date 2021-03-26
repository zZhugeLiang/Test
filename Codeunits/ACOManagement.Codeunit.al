codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var Salesline: Record "Sales Line"; CustomerNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ACOLinkedHolder: Record "ACO Linked Holder";
        ACOLinkedPackaging: Record "ACO Linked Packaging";
        ItemVariant: Record "Item Variant";
    begin
        if not ItemVariant.Get(Salesline."No.", Salesline."Variant Code") then
            Clear(ItemVariant);

        ACOLinkedHolder.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOLinkedHolder.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOLinkedHolder.SetRange(Length, ItemVariant."ACO Number of Meters" * 1000);

        if ACOLinkedHolder.FindFirst() then begin
            SalesHeader.Get(Salesline."Document Type", SalesLine."Document No.");
            if CheckStatusLinkedHolders(ACOLinkedHolder.Code, SalesHeader."Sell-to Customer No.", Salesline."ACO Profile Code", false) then
                Salesline."ACO Linked Holder" := ACOLinkedHolder.Code;
        end else
            Salesline."ACO Linked Holder" := '';

        ACOLinkedPackaging.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOLinkedPackaging.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOLinkedPackaging.SetRange("Length", ItemVariant."ACO Number of Meters" * 1000);

        if ACOLinkedPackaging.Count() = 1 then begin
            ACOLinkedPackaging.FindFirst();
            Salesline."ACO Packaging" := ACOLinkedPackaging.Code;
        end else
            Salesline."ACO Packaging" := '';
    end;

    procedure CheckStatusLinkedHolders(HolderCode: Code[30]; CustomerNo: Code[20]; ProfileCode: Code[30]; ShowError: Boolean): Boolean
    var
        ACOLinkedHolderType: Record "ACO Linked Holder Type";
        ACOLinkedSupportHolder: Record "ACO Linked Support Holder";
        ACOLinkedDistanceHolder: Record "ACO Linked Distance Holder";
        InactiveHolderErr: Label 'An inactive holder cannot be selected.';
        InactiveHolderMsg: Label 'A Holder has been found, but it is inactive, the value of Holder has not changed.';
    begin
        ACOLinkedHolderType.SetRange("Holder Code", HolderCode);
        ACOLinkedHolderType.SetRange("Customer No.", CustomerNo);
        ACOLinkedHolderType.SetRange("Profile Code", ProfileCode);
        ACOLinkedHolderType.SetRange(Status, ACOLinkedHolderType.Status::Inactive);
        if not ACOLinkedHolderType.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        ACOLinkedSupportHolder.SetRange("Holder Code", HolderCode);
        ACOLinkedSupportHolder.SetRange("Customer No.", CustomerNo);
        ACOLinkedSupportHolder.SetRange("Profile Code", ProfileCode);
        ACOLinkedSupportHolder.SetRange(Status, ACOLinkedSupportHolder.Status::Inactive);
        if not ACOLinkedSupportHolder.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        ACOLinkedDistanceHolder.SetRange("Holder Code", HolderCode);
        ACOLinkedDistanceHolder.SetRange("Customer No.", CustomerNo);
        ACOLinkedDistanceHolder.SetRange("Profile Code", ProfileCode);
        ACOLinkedDistanceHolder.SetRange(Status, ACOLinkedDistanceHolder.Status::Inactive);
        if not ACOLinkedDistanceHolder.IsEmpty() then begin
            if ShowError then
                Error(InactiveHolderErr)
            else
                Message(InactiveHolderMsg);
            exit(false)
        end;

        exit(true);
    end;

    procedure InsertExtraSalesLineFromSalesShptLine(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; LineNoIncrement: Integer; NewDescription: Text)
    var
        NewSalesLine: Record "Sales Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        NewSalesLine := SalesLine;
        NewSalesLine."Line No." += LineNoIncrement;
        NewSalesLine.Description := CopyStr(NewDescription, 1, MaxStrLen(NewSalesLine.Description));
        NewSalesLine.Insert();
    end;
}