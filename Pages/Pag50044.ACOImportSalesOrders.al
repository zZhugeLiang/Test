page 50044 "ACO Import Sales Orders"
{
    PageType = List;
    SourceTable = "ACO Imported Sales Order Line";
    Caption = 'Import Sales Orders';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Order No."; "Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer Name"; "Bill-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Profile Code"; "Profile Code")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Number of Units"; "Number of Units")
                {
                    ApplicationArea = All;
                }
                field("Quote No."; "Quote No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Error Message"; "Error Message")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Set Status to New")
            {
                Caption = 'Set Status to New';
                Image = Action;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line";
                begin
                    // ACOImportedSalesOrderLine := Rec;
                    CurrPage.SetSelectionFilter(ACOImportedSalesOrderLine);
                    // ACOImportedSalesOrderLine.SetRecFilter();
                    ACOImportedSalesOrderLine.SetRange(Status, Status::Error);
                    ACOImportedSalesOrderLine.ModifyAll(Status, Status::New);
                end;
            }
        }
        area(Navigation)
        {
            // action("ACO Bath Sheet Resources")
            // {
            //     Caption = 'Bath Sheet Resources';
            //     Image = Category;
            //     RunObject = Page "ACO Bath Sheet Resources";
            //     RunPageLink = "Bath Sheet No." = field("No.");
            //     ApplicationArea = All;
            // }

        }
    }
}
