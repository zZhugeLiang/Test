page 50030 "ACO Package Card"
{
    PageType = Card;
    SourceTable = "ACO Package Header";
    Caption = 'Package Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
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
                field(City; City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;
                }
                field("Packing Type"; "Packing Type")
                {
                    ApplicationArea = All;
                }
                field("Rack No. Customer"; "Rack No. Customer")
                {
                    ApplicationArea = All;
                }
                field("Sales Shipment No."; "Sales Shipment No.")
                {
                    ApplicationArea = All;
                }
                field(Remark; Remark)
                {
                    ApplicationArea = All;
                }
                field("Date-Time"; "Date-Time")
                {
                    ApplicationArea = All;
                }
                field(Reject; Reject)
                {
                    ApplicationArea = All;
                }
            }

            Part("Package Lines"; "ACO Package Card SubPage")
            {
                Editable = false;
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