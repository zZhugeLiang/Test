page 50055 "ACO Rej. Label Select Lines"
{

    Caption = 'Rejection Label Select Lines';
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
        PrintPackageLabel: Report "ACO Package Label";
        NumberSeriesManagement: Codeunit NoSeriesManagement;
        tempCustomerNo: Code[20];
        LineNumber: Integer;
        RemainingQuantityToDeduct: Decimal;
        QtyTooLargeErr: Label 'Quantity in Package cannot be larger than Quantity minus Quantity Processed.';
        LabelsAlreadyPrintedErr: Label 'Labels have already been printed. Please print them from the Packages list.';
        lblCustomerErr: Label 'Customer is not the same for all selected bathsheet lines.';
        lblNoNumberSeriesErr: Label 'The number series was not set in both the Customer and App Settings.';
    begin
        if not (GenPackage.RunModal() = Action::OK) then Error('');
        Commit();

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

        if ACOBathSheetLine."Bath Sheet No." <> '' then begin
            ACOBathSheetLine."Remaining Quantity" -= RemainingQuantityToDeduct;
            ACOBathSheetLine.Modify();
        end else
            if ProdOrderLine."Prod. Order No." <> '' then begin
                ProdOrderLine."ACO Remaining Quantity" -= RemainingQuantityToDeduct;
                ProdOrderLine.Modify();
            end;

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
            PackageHeader.Reject := true;
            PackageHeader.City := Customer.City;
            PackageHeader."Post Code" := Customer."Post Code";
            PackageHeader.Insert();
            // Create PackageLines;
            BathLineTempRecord.Reset();
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
                until BathLineTempRecord.Next() = 0;

            Commit();

            // // TODO Create Production Journal GIVES ERROR LATER ON IN PROCES ON EMPTY JOURNAL LINE IN EVENT TRIGGER see tag TODO Create Production Journal
            // ACOSingleInstanceMgt.SetPostProductionJournal(true);

            // PackageLineToProductionJournal.SetRange("Package No.", PackageHeader."No.");
            // if PackageLineToProductionJournal.FindSet() then
            //     repeat
            //         if ProductionOrder.Get(PackageLineToProductionJournal."Production Order Status", PackageLineToProductionJournal."Production Order No.") then
            //             if ProdOrderLine.Get(ProductionOrder."Status", ProductionOrder."No.", PackageLineToProductionJournal."Production Order Line No.") then begin
            //                 ProductionJrnlMgt.Handling(ProductionOrder, ProdOrderLine."Line No.");
            //             end;
            //     until PackageLineToProductionJournal.Next() = 0;

            // ACOSingleInstanceMgt.SetPostProductionJournal(false);

            // Commit();
            // // TODO Create Production Journal

            PackageHeader.SetRecFilter();
            PrintPackageLabel.SetTableView(PackageHeader);
            PrintPackageLabel.UseRequestPage := false;
            PrintPackageLabel.Run();

            // Commit();

            // if BathLineTempRecord.FindSet() then
            //     repeat
            //         ACOBathSheetLine."Reject Quantity" += BathLineTempRecord."Qty in Package";
            //         ACOBathSheetLine."Qty in Package" := 0;
            //         ACOBathSheetLine.Modify();
            //     until BathLineTempRecord.Next() = 0;
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
        ResourceNo: Code[20];
        Resource: Record Resource;
        LineNo: Integer;

    procedure SetBathSheetLine(NewACOBathSheetLine: Record "ACO Bath Sheet Line")
    begin
        ACOBathSheetLine.Get(NewACOBathSheetLine."Bath Sheet No.", NewACOBathSheetLine."Production Order No.", NewACOBathSheetLine."Production Order Status", NewACOBathSheetLine."Production Order Line No.");
    end;

    procedure SetProdOrderLine(NewProdOrderLine: Record "Prod. Order Line")
    begin
        ProdOrderLine.Get(NewProdOrderLine.Status, NewProdOrderLine."Prod. Order No.", NewProdOrderLine."Line No.");
    end;
}
