page 50037 "ACO Insides"
{

    PageType = List;
    SourceTable = "ACO Inside";
    Caption = 'Insides';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Rack; Rack)
                {
                    ApplicationArea = All;
                }
                field(Package; Package)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
