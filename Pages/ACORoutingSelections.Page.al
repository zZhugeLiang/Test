page 50063 "ACO Routing Selections"
{
    ApplicationArea = All;
    Caption = 'Routing Selections';
    PageType = List;
    SourceTable = "ACO Routing Selection";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Pretreatment; Rec.Pretreatment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Pretreatment field.';
                }
                field("Layer Thickness Code"; Rec."Layer Thickness Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Layer Thickness field.';
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Color field.';
                }
                field(Posttreatment; Rec.Posttreatment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posttreatment field.';
                }
                field(Particularity; Rec.Particularity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Particularity field.';
                }
                field("Routing No."; Rec."Routing No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Routing No. field.';
                }
            }
        }
    }
}
