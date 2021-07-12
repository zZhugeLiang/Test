pageextension 50002 "ACO Sales Order Extension" extends "Sales Order"
{
    layout
    {
        addbefore(Status)
        {
            field("ACO Order Complete"; "ACO Order Complete")
            {
                ApplicationArea = All;
                ToolTip = 'Order Complete';
            }
        }

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
            action("Pick Instruction Customer")
            {
                ApplicationArea = Warehouse;
                Caption = 'Pick Instruction Customer';
                Image = Print;
                ToolTip = ' ';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    ACOPickInstruction2: Report "ACO Pick Instruction 2";
                begin
                    Clear(SalesHeader);
                    SalesHeader.SetRange("Document Type", Rec."Document Type"::Order);
                    SalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
                    ACOPickInstruction2.SetTableView(SalesHeader);
                    ACOPickInstruction2.RunModal();
                end;
            }

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
            action("ACO Create Production Order(s)")
            {
                ApplicationArea = All;
                Caption = 'Create Production Order(s)';
                Image = Production;
                trigger OnAction()
                var
                    ACOManagement: Codeunit "ACO Management";
                begin
                    ACOManagement.CreateOrders(Rec);
                end;
            }

            action(ACOSelectPackageForShipment)
            {
                Caption = 'Select Package for Shipment';
                Image = Bin;
                ApplicationArea = All;
                ToolTip = 'Select Package for Shipment';

                trigger OnAction()
                var
                    ACOManagement: Codeunit "ACO Management";
                    UpdateCurrPage: Boolean;
                begin
                    ACOManagement.SelectPackageForShipment(Rec, UpdateCurrPage);
                    if UpdateCurrPage then
                        CurrPage.Update(false);
                end;
            }
        }
    }
}