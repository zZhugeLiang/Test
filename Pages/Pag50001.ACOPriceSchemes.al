page 50001 "ACO Price Schemes"
{
    Caption = 'Price Schemes';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Price Scheme";

    layout
    {
        area(Content)
        {
            repeater(PriceSchemes)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field("British Standard"; "British Standard")
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
            action(PriceSchemePrices)
            {
                Caption = 'Prices';
                Image = Price;
                RunObject = Page "ACO Price Scheme Prices";
                RunPageLink = "Price Scheme Code" = field("Code");
                ApplicationArea = All;
            }
        }
    }
}