page 50008 "ACO Profiles"
{
    Caption = 'Profiles';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = "ACO Profile Card";
    RefreshOnActivate = true;
    SourceTable = "ACO Profile";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Profiles)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Circumference"; Rec."Circumference")
                {
                    ApplicationArea = All;
                }

                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Area"; Rec."Area")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Weight per meter"; Rec."Weight per meter")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Category"; Rec."Category")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Correction Factor"; Rec."Correction Factor")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Height Level"; Rec."Height Level")
                {
                    ApplicationArea = All;
                    Visible = false;
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
                Visible = false;
                RunObject = Page "ACO Profile Customers";
                RunPageLink = "Profile Code" = field("Code");
            }
        }
    }
}