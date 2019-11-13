pageextension 50000 "ACO Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("ACO Production")
            {
                Caption = 'Production';
                field("ACO Euras"; "ACO Euras")
                {
                    ApplicationArea = All;
                }

                field("ACO Extra to Enumerate"; "ACO Extra to Enumerate")
                {
                    ApplicationArea = All;
                }

                field("ACO Thin Staining Time"; "ACO Thin Staining Time")
                {
                    ApplicationArea = All;
                }

                field("ACO Thick Staining Time"; "ACO Thick Staining Time")
                {
                    ApplicationArea = All;
                }

                field("ACO Week Capacity"; "ACO Week Capacity")
                {
                    ApplicationArea = All;
                }

                field("ACO Price Scheme Code"; "ACO Price Scheme Code")
                {
                    ApplicationArea = All;
                }

                field("ACO Comment Bath Card"; "ACO Comment Bath Card")
                {
                    ApplicationArea = All;
                }
            }

            group("ACO Other")
            {
                Caption = 'Other';
                field("ACO Package Label Nos."; "ACO Package Label Nos.")
                {
                    ApplicationArea = All;
                }

                field("ACO Comment Sales Order"; "ACO Comment Sales Order")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action("ACO Price Schemes")
            {
                Caption = 'Price Schemes';
                Image = PriceWorksheet;
                RunObject = Page "ACO Price Schemes";
                ApplicationArea = All;
            }
        }
    }
}