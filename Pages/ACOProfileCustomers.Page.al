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
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
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

                field("Customer Item No."; Rec."Customer Item No.")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Price Scheme Code"; Rec."Price Scheme Code")
                {
                    ApplicationArea = All;
                }
                field(Euras; Rec.Euras)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("High End"; Rec."High End")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Extra to Enumerate"; Rec."Extra to Enumerate")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Thick Staining Time"; Rec."Thick Staining Time")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Thin Staining Time"; Rec."Thin Staining Time")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Minimum Current Density"; Rec."Minimum Current Density")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Maximum Current Density"; Rec."Maximum Current Density")
                {
                    ApplicationArea = All;
                    Visible = false;
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
                Visible = false;
            }

            // action("ACO Holders")
            // {
            //     Caption = 'Holders';
            //     Image = Category;
            //     RunObject = Page "ACO Holders";
            //     ApplicationArea = All;
            //     Visible = false;
            // }
        }
    }

    trigger OnOpenPage()
    var
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
        CurrPage.GetRecord(ACOProfileCustomer);
        ACOSingleInstanceMgt.SetACOProfileCustomerPK(ACOProfileCustomer."Profile Code", ACOProfileCustomer."Customer No.", ACOProfileCustomer."Customer Item No.");
    end;
}