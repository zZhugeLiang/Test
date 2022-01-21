page 50015 "ACO Bath Sheet Lines"
{
    PageType = List;
    SourceTable = "ACO Bath Sheet Line";
    Caption = 'Bath Sheet Lines';
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bath Sheet No."; "Bath Sheet No.")
                {
                    ApplicationArea = All;
                }
                field("Production Order No."; "Production Order No.")
                {
                    ApplicationArea = All;
                }
                field("Production Order Status"; "Production Order Status")
                {
                    ApplicationArea = All;
                }
                field("Production Order Line No."; "Production Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order Line No."; "Sales Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Profile Code"; "Profile Code")
                {
                    ApplicationArea = All;
                }
                field("Profile Description"; "Profile Description")
                {
                    ApplicationArea = All;
                }
                field(Length; Length)
                {
                    ApplicationArea = All;
                }
                field(Circumference; Circumference)
                {
                    ApplicationArea = All;
                }
                field(Treatment; Treatment)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Rerun; Rerun)
                {
                    ApplicationArea = All;
                }
                field("Rerun Reason"; "Rerun Reason")
                {
                    ApplicationArea = All;
                }
                field(Color; Color)
                {
                    ApplicationArea = All;
                }
                field("High End"; "High End")
                {
                    ApplicationArea = All;
                }
                field("Reject Quantity"; "Reject Quantity")
                {
                    ApplicationArea = All;
                }
                field("Charge No."; "Charge No.")
                {
                    ApplicationArea = All;
                }
                field("Minimum Current Density"; "Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; "Maximum Current Density")
                {
                    ApplicationArea = All;
                }
                field(Surface; Surface)
                {
                    ApplicationArea = All;
                }
                field("Bathsheet Complete"; "Bathsheet Complete")
                {
                    ApplicationArea = All;
                }
                field(NumberOfUnits; GetNumberOfUnits())
                {
                    Caption = 'Number of Units';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ShowDocument)
            {
                Caption = 'Show Document';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = page "ACO Bath Sheet";
                RunPageLink = "No." = field("Bath Sheet No.");
            }
        }
    }

    local procedure GetNumberOfUnits(): Decimal
    var
        SalesLine: Record "Sales Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        if SalesLine.Get(SalesLine."Document Type"::Order, Rec."Sales Order No.", Rec."Sales Order Line No.") then
            exit(SalesLine."ACO Number of Units")
        else begin
            Clear(SalesLine);
            SalesShipmentLine.SetRange("Order No.", Rec."Sales Order No.");
            SalesShipmentLine.SetRange("Order Line No.", Rec."Sales Order Line No.");
            SalesShipmentLine.CalcSums("ACO Number of Units");
            exit(SalesShipmentLine."ACO Number of Units");
        end;
    end;
}
