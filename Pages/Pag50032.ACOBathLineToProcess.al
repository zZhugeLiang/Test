page 50032 "ACO Bathsheet Lines To Process"
{
    Caption = 'Bathsheet Lines To Process';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "ACO Bath Sheet Line";
    //SourceTableTemporary = true;
    SourceTableView = sorting("Bath Sheet No.", "Production Order No.", "Production Order Status", "Production Order Line No.") where(Packed = Filter(FALSE), Completed = Filter(TRUE));
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

                field("Quantity"; "Quantity")
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

                field("Qty in Package"; "Qty in Package")
                {
                    Editable = true;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        BathLineTempRecord.SetRecFilter();
                        if BathLineTempRecord.Get() then begin
                            BathLineTempRecord := Rec;
                            BathLineTempRecord.Modify();
                        end else begin
                            BathLineTempRecord.Init();
                            BathLineTempRecord := Rec;
                            BathLineTempRecord.Insert();
                        end;

                    end;
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
                Image = ShowInventoryPeriods;

                trigger OnAction();
                var
                    AppSetup: Record "ACO App Setup";
                    Customer: Record "Customer";
                    PackageHeader: Record "ACO Package Header";
                    PackageLine: Record "ACO Package Line";
                    SalesOrder: Record "Sales Header";
                    GenPackage: Report "ACO Generate Package";
                    PrintPackageLabel: Report "ACO Package Label";
                    NumberSeriesManagement: Codeunit NoSeriesManagement;
                    tempCustomerNo: Code[20];
                    temptext: Text;
                    LineNumber: Integer;
                begin
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
                                if SalesOrder.Get(SalesOrder."Document Type"::Order, "Sales Order No.") then begin
                                    PackageLine."Your Reference" := SalesOrder."Your Reference";
                                    PackageLine."External Document No." := SalesOrder."External Document No.";
                                end;
                                PackageLine.Insert();
                            until BathLineTempRecord.Next() = 0;

                        PackageHeader.SetRecFilter();
                        PrintPackageLabel.SetTableView(PackageHeader);
                        PrintPackageLabel.UseRequestPage := false;
                        PrintPackageLabel.Run();
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