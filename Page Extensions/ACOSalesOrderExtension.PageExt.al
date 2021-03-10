pageextension 50002 "ACO Sales Order Extension" extends "Sales Order"
{
    layout
    {
        addafter(General)
        {
            group(Production)
            {
                field("ACO Week Capacity"; "ACO Week Capacity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Week Capacity';
                }
                field("ACO Large Line"; "ACO Large Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Large Line';
                }
                field("ACO Quantity Charges"; "ACO Quantity Charges")
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantity Charges';
                }
                field("ACO Logged In"; "ACO Logged In")
                {
                    Editable = not "ACO Logged In";
                    ApplicationArea = All;
                    ToolTip = 'Logged In';

                    trigger OnValidate()
                    var
                        LoggedInQst: Label 'Are you sure you want to login this Sales Order?';
                    begin
                        if not Confirm(LoggedInQst) then
                            Error('');

                        Validate("ACO Logged In DateTime", CurrentDateTime());
                    end;
                }
                field("ACO Logged In Day"; "ACO Logged In Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Day';
                }
                field("ACO Logged In Week"; "ACO Logged In Week")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Week';
                }
                field("ACO Logged In Year"; "ACO Logged In Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Year';
                }
                field("ACO Customer Comment"; "ACO Customer Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Comment';
                }
            }
        }

        addafter("Document Date")
        {
            field("ACO Document Date Day"; "ACO Document Date Day")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Day';
            }
            field("ACO Document Date Week"; "ACO Document Date Week")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Week';
            }
            field("ACO Document Date Year"; "ACO Document Date Year")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Year';
            }
            field("ACO Supplier"; "ACO Supplier")
            {
                ApplicationArea = All;
                ToolTip = 'Supplier';
            }
        }
        addafter("Shipping Agent Service Code")
        {
            field("ACO Own Shipping Agent"; "ACO Own Shipping Agent")
            {
                ApplicationArea = All;
                ToolTip = 'Own Shipping Agent';
            }
        }
        addfirst(factboxes)
        {
            part(ProfilePicture; "ACO Profile Picture")
            {
                ApplicationArea = All;
                Provider = SalesLines;
                UpdatePropagation = Both;
                Caption = 'Picture';
                SubPageLink = "Code" = field("ACO Profile Code");
            }
        }
    }

    actions
    {
        addlast("&Print")
        {
            action("ACO Expedition Work Order")
            {
                Caption = 'Expedition Work Order';
                Image = Print;
                ApplicationArea = All;
                ToolTip = 'Expedition Work Order';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader := Rec;
                    SalesHeader.SetRecFilter();
                    Report.Run(Report::"ACO Expedition Work Order", true, false, SalesHeader);

                    CurrPage.Update(true);
                end;
            }

            action("ACO Attach Notice")
            {
                Caption = 'Attach Notice';
                Image = Print;
                ApplicationArea = All;
                ToolTip = 'Attach Notice';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader := Rec;
                    SalesHeader.SetRecFilter();
                    Report.Run(Report::"ACO Attach Notice", true, false, SalesHeader);

                    CurrPage.Update(true);
                end;
            }

            action("ACO Unattach Notice")
            {
                Caption = 'Unattach Notice';
                Image = Print;
                ApplicationArea = All;
                ToolTip = 'Unattach Notice';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader := Rec;
                    SalesHeader.SetRecFilter();
                    Report.Run(Report::"ACO Unattach Notice", true, false, SalesHeader);

                    CurrPage.Update(true);
                end;
            }

            action("ACO Sawing Notice")
            {
                Caption = 'Sawing Notice';
                Image = Print;
                ApplicationArea = All;
                ToolTip = 'Sawing Notice';

                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                begin
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    SalesLine.SetRange("Document No.", Rec."No.");
                    Report.Run(Report::"ACO Sawing Notice", true, false, SalesLine);

                    CurrPage.Update(true);
                end;
            }
        }

        addfirst(processing)
        {
            action(ACOSelectPackageForShipment)
            {
                Caption = 'Select Package for Shipment';
                Image = Bin;
                ApplicationArea = All;
                ToolTip = 'Select Package for Shipment';

                trigger OnAction()
                var
                    ACOPackageHeader: Record "ACO Package Header";
                    ACOPackageLine: Record "ACO Package Line";
                    SalesLine: Record "Sales Line";
                    TempSalesLine: Record "Sales Line" temporary;
                    ACOSelectionPackageLines: Page "ACO Selection Package Lines";
                    ShowMessage: Boolean;
                    PackageQuantityMsg: Label 'The package quantity is larger than the Sales Line quantity. A new Production Order has to be created before you can ship the package(s).';
                begin
                    //TODO 3
                    ACOPackageLine.SetFilter("Sales Order No.", Rec."No.");
                    if ACOPackageLine.FindSet() then
                        repeat
                            if ACOPackageHeader.Get(ACOPackageLine."Package No.") and (ACOPackageHeader."Sales Shipment No." = '') then
                                ACOPackageLine.Mark(true);
                        until ACOPackageLine.Next() = 0;

                    ACOPackageLine.MarkedOnly(true);
                    ACOSelectionPackageLines.SetTableView(ACOPackageLine);
                    ACOSelectionPackageLines.LookupMode(true);

                    if ACOSelectionPackageLines.RunModal() = Action::LookupOK then begin
                        ACOSelectionPackageLines.SetSelectionFilter(ACOPackageLine);
                        if ACOPackageLine.FindSet() then
                            repeat
                                if TempSalesLine.Get(TempSalesLine."Document Type"::Order, ACOPackageLine."Sales Order No.", ACOPackageLine."Sales Line No") then begin
                                    TempSalesLine.Quantity += ACOPackageLine.Quantity;
                                    TempSalesLine.Modify();
                                end else begin
                                    TempSalesLine."Document Type" := TempSalesLine."Document Type"::Order;
                                    TempSalesLine."Document No." := ACOPackageLine."Sales Order No.";
                                    TempSalesLine."Line No." := ACOPackageLine."Sales Line No";
                                    TempSalesLine.Quantity := ACOPackageLine.Quantity;
                                    TempSalesLine.Insert();
                                end;
                            until ACOPackageLine.Next() = 0;

                        if TempSalesLine.FindSet() then
                            repeat
                                if SalesLine.Get(TempSalesLine."Document Type", TempSalesLine."Document No.", TempSalesLine."Line No.") then begin
                                    if TempSalesLine.Quantity > SalesLine."ACO Number of Units" then begin
                                        SalesLine.Validate("ACO Number of Units", TempSalesLine.Quantity);
                                        ShowMessage := true;
                                    end;
                                    SalesLine.Validate("ACO Number of Units to Ship", TempSalesLine.Quantity);
                                    SalesLine.Validate("ACO Number of Units to Invoice", TempSalesLine.Quantity);
                                    SalesLine.Modify();
                                end;
                            until TempSalesLine.Next() < 1;

                        TempSalesLine.DeleteAll();
                        if ShowMessage then
                            Message(PackageQuantityMsg);
                        CurrPage.Update(false);
                    end;
                end;
            }
        }
    }
}