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
                field("No."; "No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Resource No."; "Resource No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Address1; Address1)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Address2; Address2)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Packing Type"; "Packing Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Rack No. Customer"; "Rack No. Customer")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Sales Shipment No."; "Sales Shipment No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Remark; Remark)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Date-Time"; "Date-Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Reject; Reject)
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