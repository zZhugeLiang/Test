page 50059 "ACO Posted Sales Invoice Lines"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Invoice Lines';
    PageType = List;
    SourceTable = "Sales Invoice Line";
    SourceTableView = where(Type = filter('<>'''''));
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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Profile Code"; Rec."ACO Profile Code")
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
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Number of Units"; Rec."ACO Number of Units")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
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
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
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
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("VAT Base Amount"; Rec."VAT Base Amount")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("ACO Sawing"; Rec."ACO Sawing")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Shipment Line No."; Rec."Shipment Line No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Order Line No."; Rec."Order Line No.")
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
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
            }
        }
    }
}
