codeunit 50003 "ACO Management"
{

    procedure CheckHolderAndPackaging(var Salesline: Record "Sales Line"; CustomerNo: Code[20])
    var
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
            Salesline."ACO Holder" := ACOHolder2.Code;
        end;

        ACOPackaging.SetRange("Profile Code", Salesline."ACO Profile Code");
        ACOPackaging.SetRange("Customer No.", CustomerNo);
        if ItemVariant."ACO Number of Meters" <> 0 then
            ACOPackaging.SetRange(Length, ItemVariant."ACO Number of Meters");

        if ACOPackaging.Count() = 1 then begin
            ACOPackaging.FindFirst();
            Salesline."ACO Packaging" := ACOPackaging.Code;
        end;
    end;
}