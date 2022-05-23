page 50055 "ACO Rej. Label Select Lines"
{

    Caption = 'Label Select Lines';
    PageType = List;
    SourceTable = "ACO Package Line";
    SourceTableTemporary = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                repeater(Lines)
                {
                    field("Reject Reason Code"; Rec."Reject Reason Code")
                    {
                        Visible = IsReject;
                        Editable = IsReject;
                        ApplicationArea = All;
                    }
                    field(Quantity; Rec.Quantity)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GenerateLabel)
            {
                Caption = 'Generate Label';
                ApplicationArea = All;
                Promoted = true;
                // PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if not Rec.IsTemporary() then exit;

                    GeneratePackageLabel();
                end;
            }
        }
    }


    local procedure GeneratePackageLabel()
    var
        AppSetup: Record "ACO App Setup";
        Customer: Record "Customer";
        PackageHeader: Record "ACO Package Header";
        PackageLine: Record "ACO Package Line";
        SalesOrder: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesLineGet: Record "Sales Line";
        BathLineTempRecord: Record "ACO Bath Sheet Line" temporary;
        ItemVariant: Record "Item Variant";
        GenPackage: Page "ACO Generate Package Dialog";
        NumberSeriesManagement: Codeunit NoSeriesManagement;
        ACOManagement: Codeunit "ACO Management";
        SingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
        tempCustomerNo: Code[20];
        LineNumber: Integer;
        RemainingQuantityToDeduct: Decimal;
        TotalRejectionQuantity: Decimal;
        lblCustomerErr: Label 'Customer is not the same for all selected bathsheet lines.';
        lblNoNumberSeriesErr: Label 'The number series was not set in both the Customer and App Settings.';
    begin
        if not (GenPackage.RunModal() = Action::OK) then Error('');
        Commit();

        RemainingQuantityToDeduct := 0;

        if Rec.FindSet() then
            repeat
                BathLineTempRecord.SetRecFilter();
                /// TODO Issue
                BathLineTempRecord.Init();

                if ACOBathSheetLine."Bath Sheet No." <> '' then
                    BathLineTempRecord := ACOBathSheetLine
                else
                    if ProdOrderLine."Prod. Order No." <> '' then begin
                        BathLineTempRecord."Sales Order No." := ProdOrderLine."ACO Source No.";
                        BathLineTempRecord."Sales Order Line No." := ProdOrderLine."ACO Source Line No.";
                        BathLineTempRecord."Production Order No." := ProdOrderLine."Prod. Order No.";
                        BathLineTempRecord."Production Order Status" := ProdOrderLine.Status.AsInteger();
                        ACOBathSheetLine."Production Order Line No." := ProdOrderLine."Line No.";
                        BathLineTempRecord."Profile Code" := ProdOrderLine."ACO Profile Code";
                        // BathLineTempRecord."Profile Description" := ProdOrderLine.Profil desc; is this field ever filled?
                        if ItemVariant.Get(ProdOrderLine."Item No.", ProdOrderLine."Variant Code") then
                            BathLineTempRecord.Length := Round(ItemVariant."ACO Number of Meters" * 1000, 1);
                        if SalesLineGet.Get(SalesLineGet."Document Type"::Order, ProdOrderLine."ACO Source No.", ProdOrderLine."ACO Source Line No.") then
                            if SalesLineGet.Type = SalesLineGet.Type::Item then
                                BathLineTempRecord.Treatment := SalesLine."No.";
                    end;

                BathLineTempRecord."Qty in Package" := Rec.Quantity;
                BathLineTempRecord."Charge No." := Rec."Reject Reason Code";
                BathLineTempRecord."Production Order Line No." := Rec."Line No.";
                BathLineTempRecord.Insert();
                RemainingQuantityToDeduct += Rec.Quantity;
            until Rec.Next() = 0;

        AppSetup.Reset();
        AppSetup.Get();
        BathLineTempRecord.Reset();
        if BathLineTempRecord.FindSet() then
            repeat
                SalesOrder.Reset();
                SalesOrder.Get(SalesOrder."Document Type"::Order, BathLineTempRecord."Sales Order No.");
                if (BathLineTempRecord."Qty in Package" > 0) and (tempCustomerNo <> '') and (SalesOrder."Sell-to Customer No." <> tempCustomerNo) then
                    Error(lblCustomerErr);
                tempCustomerNo := SalesOrder."Sell-to Customer No.";
            until BathLineTempRecord.Next() = 0;

        if Customer.Get(tempCustomerNo) then begin
            GenPackage.setRackNoVisible(Customer."ACO Rack No. Mand. on Package");

            Commit();///

            // Create PackageHeader;
            PackageHeader.Init();
            If (Customer."ACO Package Label Nos." <> '') then begin
                PackageHeader."No. Series" := Customer."ACO Package Label Nos.";
                PackageHeader."No." := NumberSeriesManagement.GetNextNo(Customer."ACO Package Label Nos.", Today(), true)
            end else
                if (AppSetup."Default Package Label Nos." <> '') then begin
                    PackageHeader."No. Series" := AppSetup."Default Package Label Nos.";
                    PackageHeader."No." := NumberSeriesManagement.GetNextNo(AppSetup."Default Package Label Nos.", Today(), true);
                end else
                    Error(lblNoNumberseriesErr);

            PackageHeader."Resource No." := GenPackage.getResource();
            PackageHeader."Customer No." := Customer."No.";
            PackageHeader."Customer Name" := Customer.Name;
            PackageHeader.Address1 := Customer.Address;
            PackageHeader.Address2 := Customer."Address 2";
            PackageHeader."Packing Type" := GenPackage.getPackageType();
            PackageHeader."Rack No. Customer" := GenPackage.getRackNo();

            if (Customer."ACO Rack No. Mand. on Package") and (PackageHeader."Rack No. Customer" = '') then
                PackageHeader.TestField("Rack No. Customer");

            PackageHeader.Remark := GenPackage.GetRemark();
            PackageHeader."Date-Time" := CurrentDateTime();
            PackageHeader.Reject := IsReject;
            PackageHeader.City := Customer.City;
            PackageHeader."Post Code" := Customer."Post Code";
            PackageHeader.Insert();
            // Create PackageLines;
            BathLineTempRecord.Reset();

            if ACOBathSheetLine."Bath Sheet No." <> '' then begin
                ACOBathSheetLine."Remaining Quantity" -= RemainingQuantityToDeduct;
                ACOBathSheetLine.Modify();
            end else
                if ProdOrderLine."Prod. Order No." <> '' then begin
                    ProdOrderLine."ACO Quantity to Bath Sheet" := 0;
                    ProdOrderLine."ACO Remaining Quantity" -= RemainingQuantityToDeduct;
                    ProdOrderLine.Modify();
                end;
            //BathLineTempRecord.SetFilter("Qty in Package", '<>0');
            if BathLineTempRecord.FindSet() then
                repeat
                    LineNumber := LineNumber + 10000;

                    PackageLine.Init();
                    PackageLine."Package No." := PackageHeader."No.";
                    PackageLine."Line No." := LineNumber;
                    PackageLine."Sales Order No." := BathLineTempRecord."Sales Order No.";
                    PackageLine."Sales Line No" := BathLineTempRecord."Sales Order Line No.";
                    PackageLine."Bathsheet No." := BathLineTempRecord."Bath Sheet No.";
                    PackageLine."Production Order No." := BathLineTempRecord."Production Order No.";
                    PackageLine."Production Order Status" := BathLineTempRecord."Production Order Status";
                    PackageLine."Production Order Line No." := ACOBathSheetLine."Production Order Line No.";
                    PackageLine."Profile No." := BathLineTempRecord."Profile Code";
                    PackageLine."Profile Description" := BathLineTempRecord."Profile Description";
                    PackageLine.Length := BathLineTempRecord.Length;
                    PackageLine.Treatment := BathLineTempRecord.Treatment;
                    PackageLine.Quantity := BathLineTempRecord."Qty in Package";
                    PackageLine."Layer Thickness" := BathLineTempRecord."Layer Thickness";
                    PackageLine.Pretreatment := BathLineTempRecord.Pretreatment;
                    PackageLine.Posttreatment := BathLineTempRecord.Posttreatment;
                    PackageLine.Particularity := BathLineTempRecord.Particularity;
                    PackageLine."Profile Length" := BathLineTempRecord."Profile Length";
                    PackageLine."Profile Circumference" := BathLineTempRecord."Profile Circumference";
                    PackageLine."Customer Item Reference" := BathLineTempRecord."Customer Item Reference";
                    PackageLine.Color := BathLineTempRecord.Color;
                    if SalesOrder.Get(SalesOrder."Document Type"::Order, BathLineTempRecord."Sales Order No.") then begin
                        PackageLine."Your Reference" := SalesOrder."Your Reference";
                        PackageLine."External Document No." := SalesOrder."External Document No.";
                        if SalesLine.Get(SalesLine."Document Type"::Order, BathLineTempRecord."Sales Order No.", BathLineTempRecord."Sales Order Line No.") then begin
                            PackageLine."Variant Code" := SalesLine."Variant Code";
                            PackageLine."Number of Units" := SalesLine."ACO Number of Units";
                            PackageLine."Customer Item No." := SalesLine."ACO Customer Item No.";
                            PackageLine."Profile Cust. Description" := SalesLine."ACO Profile Cust. Description";
                        end;
                    end;
                    PackageLine."Reject Reason Code" := BathLineTempRecord."Charge No.";
                    PackageLine.Insert();
                    TotalRejectionQuantity += BathLineTempRecord."Qty in Package";
                until BathLineTempRecord.Next() = 0;

            Commit();
            // TODO Create Production Journal <<
            SingleInstanceMgt.SetTotalRejectionQuantity(TotalRejectionQuantity);
            ACOManagement.PostProductionJournal(PackageHeader."No.", ProdOrderLine);
            SingleInstanceMgt.SetTotalRejectionQuantity(0);
            // TODO Create Production Journal >>

            PrintPackageLabel(PackageHeader);
        end;

        BathLineTempRecord.DeleteAll();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LineNo += 10000;
        Rec."Line No." := LineNo;
    end;

    var
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ProdOrderLine: Record "Prod. Order Line";
        LineNo: Integer;
        IsReject: Boolean;

    local procedure PrintPackageLabel(var
                                          PackageHeader: Record "ACO Package Header")
    var
        ACOPackageLabel: Report "ACO Package Label";
    begin
        PackageHeader.SetRecFilter();
        ACOPackageLabel.SetTableView(PackageHeader);
        ACOPackageLabel.UseRequestPage := false;
        ACOPackageLabel.Run();
    end;


    procedure SetBathSheetLine(NewACOBathSheetLine: Record "ACO Bath Sheet Line")
    begin
        ACOBathSheetLine.Get(NewACOBathSheetLine."Bath Sheet No.", NewACOBathSheetLine."Production Order No.", NewACOBathSheetLine."Production Order Status", NewACOBathSheetLine."Production Order Line No.");
    end;

    procedure SetProdOrderLine(NewProdOrderLine: Record "Prod. Order Line")
    begin
        ProdOrderLine.Get(NewProdOrderLine.Status, NewProdOrderLine."Prod. Order No.", NewProdOrderLine."Line No.");
    end;

    procedure SetIsReject(NewIsReject: Boolean)
    begin
        IsReject := NewIsReject;
    end;
}
