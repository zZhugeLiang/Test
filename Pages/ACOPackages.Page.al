page 50029 "ACO Packages"
{

    PageType = List;
    SourceTable = "ACO Package Header";
    Caption = 'Packages';
    CardPageId = "ACO Package Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field(Address1; Address1)
                {
                    ApplicationArea = All;
                }
                field(Address2; Address2)
                {
                    ApplicationArea = All;
                }
                field("Packing Type"; Rec."Packing Type")
                {
                    ApplicationArea = All;
                }
                field("Rack No. Customer"; Rec."Rack No. Customer")
                {
                    ApplicationArea = All;
                }
                field(Remark; Remark)
                {
                    ApplicationArea = All;
                }
                field("Date-Time"; Rec."Date-Time")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Sales Shipment No."; Rec."Sales Shipment No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Reject; Rec.Reject)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetAscending("No.", true);
    end;
}
