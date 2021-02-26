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
        // ACOBathSheetLine: Record "ACO Bath Sheet Line";
        // ACOBathSheetLinesToProcess: Record "ACO Bath Sheet Line";
        BathLineTempRecord: Record "ACO Bath Sheet Line" temporary;
        // GenPackage: Report "ACO Generate Package";
        GenPackage: Page "ACO Generate Package Dialog";
        PrintPackageLabel: Report "ACO Package Label";
        NumberSeriesManagement: Codeunit NoSeriesManagement;
        tempCustomerNo: Code[20];
        temptext: Text;
        LineNumber: Integer;
        // QtyTooLargeErr: Label 'Quantity in Package cannot be larger than Quantity minus Quantity Processed.';
        LabelsAlreadyPrintedErr: Label 'Labels have already been printed. Please print them from the Packages list.';
        lblCustomerErr: Label 'Customer is not the same for all selected bathsheet lines.';
        lblNoNumberSeriesErr: Label 'The number series was not set in both the Customer and App Settings.';
    begin
        BathLineTempRecord.DeleteAll();
        // CurrPage.SetSelectionFilter(ACOBathSheetLinesToProcess);
        if not (GenPackage.RunModal() = Action::OK) then Error('');
        Commit();

        if Rec.FindSet() then
            repeat
                BathLineTempRecord.SetRecFilter();

                // if BathLineTempRecord.Get(ACOBathSheetLine."Bath Sheet No.", ACOBathSheetLine."Production Order No.", ACOBathSheetLine."Production Order Status", ACOBathSheetLine."Production Order Line No.") then begin
                //     BathLineTempRecord := ACOBathSheetLine;
                //     BathLineTempRecord.Quantity := Rec.Quantity;
                //     BathLineTempRecord."Charge No." := Rec."Reject Reason Code";
                //     BathLineTempRecord.Modify();
                // end else begin
                BathLineTempRecord.Init();
                BathLineTempRecord := ACOBathSheetLine;
                //BathLineTempRecord.Quantity := Rec.Quantity;
                BathLineTempRecord."Qty in Package" := Rec.Quantity;
                BathLineTempRecord."Charge No." := Rec."Reject Reason Code";
                BathLineTempRecord."Production Order Line No." := Rec."Line No.";
                BathLineTempRecord.Insert();
            // end;
            until Rec.Next() = 0;

        AppSetup.Reset();
        AppSetup.Get();
        BathLineTempRecord.Reset();
        if BathLineTempRecord.FindSet() then
            repeat
                SalesOrder.Reset();
                SalesOrder.Get(SalesOrder."Document Type"::Order, BathLineTempRecord."Sales Order No.");
                IF (BathLineTempRecord."Qty in Package" > 0) and (tempCustomerNo <> '') and (SalesOrder."Sell-to Customer No." <> tempCustomerNo) then
                    Error(lblCustomerErr);
                tempCustomerNo := SalesOrder."Sell-to Customer No.";
            until BathLineTempRecord.Next() = 0;

        if Customer.Get(tempCustomerNo) then begin
            GenPackage.setRackNoVisible(Customer."ACO Rack No. Mand. on Package");

            Commit();///
            // temptext := GenPackage.RunRequestPage();
            //GenPackage.

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
            PackageHeader."Rack No. Customer" := '';
            PackageHeader.Remark := '';
            PackageHeader."Date-Time" := CurrentDateTime();
            PackageHeader.Reject := true;
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

            PackageHeader.SetRecFilter();
            PrintPackageLabel.SetTableView(PackageHeader);
            PrintPackageLabel.UseRequestPage := false;
            PrintPackageLabel.Run();

            // Commit();

            if BathLineTempRecord.FindSet() then
                repeat
                    // if ACOBathSheetLine.Get(BathLineTempRecord."Bath Sheet No.", BathLineTempRecord."Production Order No.", BathLineTempRecord."Production Order Status", BathLineTempRecord."Production Order Line No.") then begin
                    ACOBathSheetLine."Reject Quantity" += BathLineTempRecord."Qty in Package";
                    ACOBathSheetLine.Modify();
                // end;
                until BathLineTempRecord.Next() = 0;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        myInt: Integer;
    begin
        LineNo += 10000;
        Rec."Line No." := LineNo;
    end;

    var
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ResourceNo: Code[20];
        Resource: Record Resource;
        LineNo: Integer;

    procedure SetBathSheetLine(NewACOBathSheetLine: Record "ACO Bath Sheet Line")
    begin
        ACOBathSheetLine.Get(NewACOBathSheetLine."Bath Sheet No.", NewACOBathSheetLine."Production Order No.", NewACOBathSheetLine."Production Order Status", NewACOBathSheetLine."Production Order Line No.");
    end;
}
