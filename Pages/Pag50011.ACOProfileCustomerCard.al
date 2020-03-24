page 50011 "ACO Profile Customer Card"
{
    Caption = 'Profile Customer Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ACO Profile Customer";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
            }

            group(AddressInformation)
            {
                Caption = 'Address';

                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    ApplicationArea = All;
                }
            }
            group(ProductionParameters)
            {
                Caption = 'Production Parameters';

                field("Packaging Instructions"; "Packaging Instructions")
                {
                    ApplicationArea = All;
                }
                field(Euras; Euras)
                {
                    ApplicationArea = All;
                }
                field("Extra to Enumerate"; "Extra to Enumerate")
                {
                    ApplicationArea = All;
                }
                field("Thick Staining Time"; "Thick Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Thin Staining Time"; "Thin Staining Time")
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
                // RunPageLink = "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code");
                ApplicationArea = All;
            }

            action("ACO Packaging List")
            {
                Caption = 'Packaging List';
                Image = CopyItem;
                RunObject = Page "ACO Packaging List";
                RunPageLink = "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code");
                ApplicationArea = All;
            }
        }
    }
}