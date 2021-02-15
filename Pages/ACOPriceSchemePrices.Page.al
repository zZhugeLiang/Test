page 50002 "ACO Price Scheme Prices"
{
    Caption = 'Price Scheme Prices';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Price Scheme Price";

    layout
    {
        area(Content)
        {
            repeater(PriceSchemes)
            {
                field("Price Scheme Code"; "Price Scheme Code")
                {
                    ApplicationArea = All;
                }

                field("Type"; "Type")
                {
                    ApplicationArea = All;
                }

                field("Minimum Quantity"; "Minimum Quantity")
                {
                    ApplicationArea = All;
                }

                field("Unit Price"; "Unit Price")
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

        }
    }
}