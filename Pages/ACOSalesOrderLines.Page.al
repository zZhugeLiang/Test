Page 50058 "ACO Sales Order Lines"
{

    ApplicationArea = All;
    Caption = 'Sales Order Lines';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const(Order), Type = filter('<>'''''));
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Line No."; Rec."Line No.")
                { ApplicationArea = All; Tooltip = ' '; }
                field("ACO Profile Code";
                "ACO Profile Code")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Profile Description"; Rec."ACO Profile Description")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Customer Item No."; Rec."ACO Customer Item No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Profile Cust. Description"; Rec."ACO Profile Cust. Description")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Variant Code"; Rec."Variant Code")
                { ApplicationArea = All; Tooltip = ' '; }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Number of Units"; Rec."ACO Number of Units")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }

                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Planned Delivery Date"; Rec."Planned Delivery Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Planned Shipment Date"; Rec."Planned Shipment Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Attach Method Code Profile"; Rec."ACO Attach Method Code Profile")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Linked Holder"; Rec."ACO Linked Holder")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Receipt Bag"; Rec."ACO Receipt Bag")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Receipt Shelf"; Rec."ACO Receipt Shelf")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Shipping Bag"; Rec."ACO Shipping Bag")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Shipping Shelf"; Rec."ACO Shipping Shelf")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Kundentour HUECK"; Rec."ACO Kundentour HUECK")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Project Color Code"; Rec."ACO Project Color Code")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Blanket Order Line No."; Rec."Blanket Order Line No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Sawing"; Rec."ACO Sawing")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Start Length"; Rec."ACO Start Length")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Head Cut"; Rec."ACO Head Cut")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Return Remaining"; Rec."ACO Return Remaining")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Lower Accuracy"; Rec."ACO Lower Accuracy")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Upper Accuracy"; Rec."ACO Upper Accuracy")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO British Standard"; Rec."ACO British Standard")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Layer Thickness"; Rec."ACO Layer Thickness")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Color"; Rec."ACO Color")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Pretreatment"; Rec."ACO Pretreatment")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("ACO Posttreatment"; Rec."ACO Posttreatment")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Particularity"; Rec."ACO Particularity")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("ACO Customer Item Reference"; Rec."ACO Customer Item Reference")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("ACO Profile Length"; Rec."ACO Profile Length")
                {
                    ApplicationArea = ALl;
                    ToolTip = ' ';
                }
                field("ACO Profile Circumference"; Rec."ACO Profile Circumference")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Not Measurable"; Rec."ACO Not Measurable")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Extra Flushing"; Rec."ACO Extra Flushing")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Area Profile"; Rec."ACO Area Profile")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO High End"; Rec."ACO High End")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Measure Report"; Rec."ACO Measure Report")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Area"; Rec."ACO Area")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Reject Billable"; Rec."ACO Reject Billable")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Reject Not Billable"; Rec."ACO Reject Not Billable")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Reject Billable Shipped"; Rec."ACO Reject Billable Shipped")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Rej. Not Billable Shipped"; Rec."ACO Rej. Not Billable Shipped")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
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
                RunObject = page "Sales Order";
                RunPageLink = "No." = field("Document No.");
                RunPageView = where("Document Type" = const(Order));
            }
        }
    }
}