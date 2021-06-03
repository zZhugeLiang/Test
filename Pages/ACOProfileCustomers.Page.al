page 50010 "ACO Profile Customers"
{
    Caption = 'Profile Customers';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = "ACO Profile Customer Card";
    RefreshOnActivate = true;
    SourceTable = "ACO Profile Customer";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(ProfileCustomers)
            {
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; "Customer Name")
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

                field("Customer Item No."; "Customer Item No.")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = All;
                }

                field(Status; Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("ACO Linked Holders")
            {
                Caption = 'Linked Holders';
                Image = Category;
                RunObject = Page "ACO Linked Holders";
                RunPageLink = "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code");
                ApplicationArea = All;
            }

            action("ACO Holders")
            {
                Caption = 'Holders';
                Image = Category;
                RunObject = Page "ACO Holders";
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    var
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        if ACOSingleInstanceMgt.GetCustomerNo() <> '' then
            Rec.SetFilter("Customer No.", ACOSingleInstanceMgt.GetCustomerNo());
    end;

    trigger OnClosePage()
    var
        ACOProfileCustomer: Record "ACO Profile Customer";
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        // CurrPage.SetSelectionFilter(ACOProfileCustomer);
        // CurrPage.GetRecord(ACOProfileCustomer);
        // CurrPage.SetSelectionFilter(Rec);
        CurrPage.GetRecord(ACOProfileCustomer);
        ACOSingleInstanceMgt.SetACOProfileCustomerPK(ACOProfileCustomer."Profile Code", ACOProfileCustomer."Customer No.", ACOProfileCustomer."Customer Item No.");
    end;
}