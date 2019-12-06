page 50008 "ACO Profiles"
{
    Caption = 'Profiles';
    PageType = List;

    UsageCategory = Lists;
    CardPageId = "ACO Profile Card";
    SourceTable = "ACO Profile";
    ApplicationArea = All;

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