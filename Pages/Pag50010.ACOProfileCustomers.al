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
}