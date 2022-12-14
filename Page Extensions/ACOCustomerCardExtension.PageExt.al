pageextension 50000 "ACO Customer Card Extension" extends "Customer Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("ACO Production")
            {
                Caption = 'Production';
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

                field("ACO Package Label Nos."; "ACO Package Label Nos.")
                {
                    ApplicationArea = All;
                }
                field("ACO Rack No. Mand. on Package"; "ACO Rack No. Mand. on Package")
                {
                    ApplicationArea = All;
                }

            }

            group("ACO Other")
            {
                Caption = 'Other';


                field("ACO Comment Sales Order"; "ACO Comment Sales Order")
                {
                    ApplicationArea = All;
                }

                field("ACO Package Label Report ID"; "ACO Package Label Report ID")
                {
                    ApplicationArea = All;
                }

                field("ACO Package Label Layout Code"; "ACO Package Label Layout Code")
                {
                    ApplicationArea = All;
                }

                field("ACO Shelf No. Mand. on Package"; "ACO Shelf No. Mand. on Package")
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