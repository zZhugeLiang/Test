page 50046 "ACO Linked Holder Card"
{
    Caption = 'Linked Holder Card';
    PageType = Card;
    SourceTable = "ACO Linked Holder";

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
        }
    }
    actions
    {
        area(Navigation)
        {
            action("ACO Linked Holders Types")
            {
                Caption = 'Linked Holders Types';
                Image = Bin;
                RunObject = Page "ACO Linked Holder Types";
                RunPageLink = "Holder Code" = field("Code"), "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code"), Length = field(Length);
                ApplicationArea = All;
            }
            action("ACO Linked Support Holders")
            {
                Caption = 'Linked Support Holders';
                Image = CreateMovement;
                RunObject = Page "ACO Linked Support Holders";
                RunPageLink = "Holder Code" = field("Code"), "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code"), Length = field(Length);
                ApplicationArea = All;
            }
            action("ACO Linked Distance Holders")
            {
                Caption = 'Linked Distance Holders';
                Image = CreateBins;
                RunObject = Page "ACO Linked Distance Holders";
                RunPageLink = "Holder Code" = field("Code"), "Customer No." = field("Customer No."), "Profile Code" = field("Profile Code"), Length = field(Length);
                ApplicationArea = All;
            }
        }
    }
}