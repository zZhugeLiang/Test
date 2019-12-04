page 50008 "ACO Profiles"
{
    Caption = 'Profiles';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Profile";

    layout
    {
        area(Content)
        {
            repeater(Profiles)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field("Circumference"; "Circumference")
                {
                    ApplicationArea = All;
                }

                field("Area"; "Area")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ProfileCustomers)
            {
                Caption = 'Profile Customers';
                ApplicationArea = All;
                RunObject = Page "ACO Profile Customers";
                RunPageLink = "Profile Code" = field("Code");
            }
        }
    }
}