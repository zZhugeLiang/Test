page 50021 "ACO Bath Sheet Subpage"
{
    PageType = ListPart;
    SourceTable = "ACO Bath Sheet Line";
    Caption = 'ACO Bath Sheet Subpage';
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(Wrapped; Wrapped)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
