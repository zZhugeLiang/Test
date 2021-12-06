page 50030 "ACO Package Card"
{
    PageType = Card;
    SourceTable = "ACO Package Header";
    Caption = 'Package Card';
    ModifyAllowed = true;
    Editable = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Address1; Rec.Address1)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Address2; Rec.Address2)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Packing Type"; Rec."Packing Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Rack No. Customer"; Rec."Rack No. Customer")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Sales Shipment No."; Rec."Sales Shipment No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Remark; REc.Remark)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Date-Time"; Rec."Date-Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Reject; Rec.Reject)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }

            Part("Package Lines"; "ACO Package Card SubPage")
            {
                Editable = true;
                SubPageLink = "Package No." = field("No.");
                UpdatePropagation = Both;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print Label")
            {
                ApplicationArea = All;
                Caption = 'Print Label';
                Image = ShowInventoryPeriods;

                trigger OnAction();
                var
                    PackageHeader: Record "ACO Package Header";
                    PrintPackageLabel: Report "ACO Package Label";
                begin
                    PackageHeader := Rec;
                    PackageHeader.SetRecFilter();
                    PrintPackageLabel.SetTableView(PackageHeader);
                    PrintPackageLabel.UseRequestPage := false;
                    PrintPackageLabel.Run();
                end;
            }
        }
    }
}