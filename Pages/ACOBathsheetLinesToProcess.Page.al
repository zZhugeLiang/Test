page 50032 "ACO Bathsheet Lines To Process"
{
    Caption = 'Bathsheet Lines To Process';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "ACO Bath Sheet Line";
    //SourceTableTemporary = true;
    SourceTableView = sorting("Bath Sheet No.", "Production Order No.", "Production Order Status", "Production Order Line No.") where(Packed = Filter(FALSE), Completed = Filter(TRUE), Rerun = const(false));
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Bath Sheet No."; "Bath Sheet No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Production Order No."; "Production Order No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Production Order Status"; "Production Order Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Production Order Line No."; "Production Order Line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Profile Code"; "Profile Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Profile Description"; "Profile Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Length"; "Length")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Circumference"; "Circumference")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Treatment"; "Treatment")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Rerun"; "Rerun")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Rerun Reason"; "Rerun Reason")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Color"; "Color")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("High End"; "High End")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Reject Quantity"; "Reject Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Charge No."; "Charge No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Minimum Current Density"; "Minimum Current Density")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Maximum Current Density"; "Maximum Current Density")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Surface"; "Surface")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Quantity"; "Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Remaining Quantity"; "Remaining Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Quantity Processed"; "Quantity Processed")
                {
                    ApplicationArea = All;
                }

                field("Qty in Package"; "Qty in Package")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
            }


        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Generate Package Label")
            {
                ApplicationArea = All;
                Caption = 'Generate Package Label';
                ToolTip = 'Generate Package Label';
                Image = ShowInventoryPeriods;

                trigger OnAction();
                var
                    AppSetup: Record "ACO App Setup";
                    Customer: Record "Customer";
                    PackageHeader: Record "ACO Package Header";
                    PackageLine: Record "ACO Package Line";
                    SalesOrder: Record "Sales Header";
                    SalesLine: Record "Sales Line";
                    ACOBathSheetLine: Record "ACO Bath Sheet Line";
                    ACOBathSheetLinesToProcess: Record "ACO Bath Sheet Line";
                    GenPackage: Report "ACO Generate Package";
                    PrintPackageLabel: Report "ACO Package Label";
                    NumberSeriesManagement: Codeunit NoSeriesManagement;
                    tempCustomerNo: Code[20];
                    temptext: Text;
                    LineNumber: Integer;
                    QtyTooLargeErr: Label 'Quantity in Package cannot be larger than Quantity minus Quantity Processed.';
                    LabelsAlreadyPrintedErr: Label 'Labels have already been printed. Please print them from the Packages list.';
                begin
                    BathLineTempRecord.DeleteAll();
                    CurrPage.SetSelectionFilter(ACOBathSheetLinesToProcess);

                    if ACOBathSheetLinesToProcess.FindSet() then
                        repeat
                            CalcFields("Quantity Processed");
                            if ("Qty in Package" > (Quantity - "Quantity Processed")) then
                                Error(QtyTooLargeErr);

                            if ACOBathSheetLinesToProcess."Remaining Quantity" = 0 then
                                Error(LabelsAlreadyPrintedErr);

                            BathLineTempRecord.SetRecFilter();

                            if BathLineTempRecord.Get(ACOBathSheetLinesToProcess."Bath Sheet No.", ACOBathSheetLinesToProcess."Production Order No.", ACOBathSheetLinesToProcess."Production Order Status", ACOBathSheetLinesToProcess."Production Order Line No.") then begin
                                BathLineTempRecord := ACOBathSheetLinesToProcess;
                                BathLineTempRecord.Modify();
                            end else begin
                                BathLineTempRecord.Init();
                                BathLineTempRecord := ACOBathSheetLinesToProcess;
                                BathLineTempRecord.Insert();
                            end;
                        until ACOBathSheetLinesToProcess.Next() = 0;

                    AppSetup.Reset();
                    AppSetup.Get();
                    BathLineTempRecord.Reset();
                    if BathLineTempRecord.FindSet() then
                        repeat
                            SalesOrder.Reset();
                            SalesOrder.Get(SalesOrder."Document Type"::Order, "Sales Order No.");
                            IF (BathLineTempRecord."Qty in Package" > 0) and (tempCustomerNo <> '') and (SalesOrder."Sell-to Customer No." <> tempCustomerNo) then
                                Error(lblCustomerErr);
                            tempCustomerNo := SalesOrder."Sell-to Customer No.";
                        until BathLineTempRecord.Next() = 0;

                    if Customer.Get(tempCustomerNo) then begin
                        GenPackage.setRackNoVisible(Customer."ACO Rack No. Mand. on Package");
                        Commit();///
                        temptext := GenPackage.RunRequestPage();
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
                        PackageHeader.Insert();
                        // Create PackageLines;
                        BathLineTempRecord.Reset();
                        BathLineTempRecord.SetFilter("Qty in Package", '<>0');
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
                                PackageLine."Production Order Line No." := BathLineTempRecord."Production Order Line No.";
                                PackageLine."Profile No." := BathLineTempRecord."Profile Code";
                                PackageLine."Profile Description" := BathLineTempRecord."Profile Description";
                                PackageLine.Length := BathLineTempRecord.Length;
                                PackageLine.Treatment := BathLineTempRecord.Treatment;
                                PackageLine.Quantity := BathLineTempRecord."Qty in Package";
                                if SalesOrder.Get(SalesOrder."Document Type"::Order, "Sales Order No.") then begin
                                    PackageLine."Your Reference" := SalesOrder."Your Reference";
                                    PackageLine."External Document No." := SalesOrder."External Document No.";
                                    if SalesLine.Get(SalesLine."Document Type"::Order, BathLineTempRecord."Sales Order No.", BathLineTempRecord."Sales Order Line No.") then begin
                                        PackageLine."Variant Code" := SalesLine."Variant Code";
                                        PackageLine."Number of Units" := SalesLine."ACO Number of Units";
                                        PackageLine."Customer Item No." := SalesLine."ACO Customer Item No.";
                                        PackageLine."Profile Cust. Description" := SalesLine."ACO Profile Cust. Description";
                                    end;
                                end;
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
                                if ACOBathSheetLine.Get(BathLineTempRecord."Bath Sheet No.", BathLineTempRecord."Production Order No.", BathLineTempRecord."Production Order Status", BathLineTempRecord."Production Order Line No.") then begin
                                    ACOBathSheetLine.CalcFields("Quantity Processed");
                                    ACOBathSheetLine."Remaining Quantity" := ACOBathSheetLine.Quantity - ACOBathSheetLine."Quantity Processed";
                                    ACOBathSheetLine."Qty in Package" := ACOBathSheetLine."Remaining Quantity";
                                    ACOBathSheetLine.Modify();
                                end;
                            until BathLineTempRecord.Next() = 0;
                    end;
                end;
            }
        }
    }

    var
        BathLineTempRecord: Record "ACO Bath Sheet Line" temporary;
        lblCustomerErr: Label 'Customer is not the same for all selected bathsheet lines.';
        lblNoNumberSeriesErr: Label 'The number series was not set in both the Customer and App Settings.';
}