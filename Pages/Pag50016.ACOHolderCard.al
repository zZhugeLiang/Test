page 50016 "ACO Holder Card"
{
    Caption = 'Holder Card';
    PageType = Card;
    SourceTable = "ACO Holder";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Profile Code"; "Profile Code")
                {
                    ApplicationArea = All;
                }
                field(Length; Length)
                {
                    ApplicationArea = All;
                }
                field("Color Group Code"; "Color Group Code")
                {
                    ApplicationArea = All;
                }
                field("Holder Code"; "Holder Code")
                {
                    ApplicationArea = All;
                }
                field("Support Holder Code"; "Support Holder Code")
                {
                    ApplicationArea = All;
                }
                field("Distance Holder Code"; "Distance Holder Code")
                {
                    ApplicationArea = All;
                }
                field("Attach Method Code"; "Attach Method Code")
                {
                    ApplicationArea = All;
                }
                field("Type of Clamp"; "Type of Clamp")
                {
                    ApplicationArea = All;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = All;
                }
                field(Method; Method)
                {
                    ApplicationArea = All;
                }
                field(Space; Space)
                {
                    ApplicationArea = All;
                }
                field(Helix; Helix)
                {
                    ApplicationArea = All;
                }
                field("Helix Start"; "Helix Start")
                {
                    ApplicationArea = All;
                }
                field("Helix End"; "Helix End")
                {
                    ApplicationArea = All;
                }
            }

            // group(ProductionParameters)
            // {
            //     Caption = 'Production Parameters';

            // }
        }
    }

}