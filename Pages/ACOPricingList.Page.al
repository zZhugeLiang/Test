page 50016 "ACO Pricing List"
{
    ApplicationArea = All;
    Caption = 'Pricing List';
    PageType = List;
    SourceTable = "ACO Pricing";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ToolTip = 'Specifies the value of the Customer Price Group field.';
                    ApplicationArea = All;
                }
                field("Pretreatment Code"; Rec."Pretreatment Code")
                {
                    ToolTip = 'Specifies the value of the Pretreatment Code field.';
                    ApplicationArea = All;
                }
                field("Layer Thickness Code"; Rec."Layer Thickness Code")
                {
                    ToolTip = 'Specifies the value of the Layer Thickness Code field.';
                    ApplicationArea = All;
                }
                field("Color Code"; Rec."Color Code")
                {
                    ToolTip = 'Specifies the value of the Color Code field.';
                    ApplicationArea = All;
                }
                field("Posttreatment Code"; Rec."Posttreatment Code")
                {
                    ToolTip = 'Specifies the value of the Posttreatment Code field.';
                    ApplicationArea = All;
                }
                field("Particularity Code"; Rec."Particularity Code")
                {
                    ToolTip = 'Specifies the value of the Particularity Code field.';
                    ApplicationArea = All;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Category Code field.';
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
