page 50021 "ACO Bath Sheet Subpage"
{
    PageType = ListPart;
    SourceTable = "ACO Bath Sheet Line";
    Caption = 'Bath Sheet Subpage';
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Production Order No."; Rec."Production Order No.")
                {
                    ApplicationArea = All;
                }
                field("Production Order Status"; Rec."Production Order Status")
                {
                    ApplicationArea = All;
                }
                field("Production Order Line No."; Rec."Production Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order Line No."; Rec."Sales Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Profile Code"; Rec."Profile Code")
                {
                    ApplicationArea = All;
                }
                field("Profile Description"; Rec."Profile Description")
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
                field("Rerun Reason"; Rec."Rerun Reason")
                {
                    ApplicationArea = All;
                }
                field(Color; Color)
                {
                    ApplicationArea = All;
                }
                field("High End"; Rec."High End")
                {
                    ApplicationArea = All;
                }
                field("Reject Quantity"; Rec."Reject Quantity")
                {
                    ApplicationArea = All;
                }
                field("Charge No."; Rec."Charge No.")
                {
                    ApplicationArea = All;
                }
                field("Minimum Current Density"; Rec."Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; Rec."Maximum Current Density")
                {
                    ApplicationArea = All;
                }
                field(Surface; Surface)
                {
                    ApplicationArea = All;
                }
                field("Layer Thickness"; Rec."Layer Thickness")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Profile Circumference"; Rec."Profile Circumference")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Pretreatment"; Rec."Pretreatment")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Posttreatment"; Rec."Posttreatment")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Particularity"; Rec."Particularity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Profile Length"; Rec."Profile Length")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Item Reference"; Rec."Customer Item Reference")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

}
