codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var Salesline: Record "Sales Line"; CustomerNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ACOHolder2: Record "ACO Holder 2"; // DEPRECATED, Rename to ACO Holder
        ACOPackaging: Record "ACO Packaging";
        ItemVariant: Record "Item Variant";
    begin
        if not ItemVariant.Get(Salesline."No.", Salesline."Variant Code") then
            Clear(ItemVariant);

        ACOHolder2.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOHolder2.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOHolder2.SetRange(Length, ItemVariant."ACO Number of Meters");

        if ACOHolder2.Count() = 1 then begin
            ACOHolder2.FindFirst();
            SalesHeader.Get(Salesline."Document Type", SalesLine."Document No.");
            if CheckStatusLinkedHolders(ACOHolder2.Code, SalesHeader."Sell-to Customer No.", Salesline."ACO Profile Code", false) then
                Salesline."ACO Holder" := ACOHolder2.Code;
        end;

        ACOPackaging.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOPackaging.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOPackaging.SetRange("Length 2", ItemVariant."ACO Number of Meters");

        if ACOPackaging.Count() = 1 then begin
            ACOPackaging.FindFirst();
            Salesline."ACO Packaging" := ACOPackaging.Code;
        end;
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
}