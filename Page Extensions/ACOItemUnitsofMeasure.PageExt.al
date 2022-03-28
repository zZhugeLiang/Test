pageextension 50022 "ACO Item Units of Measure" extends "Item Units of Measure"
{
    layout
    {
        modify(Height)
        {
            Visible = false;
        }
        modify(Length)
        {
            Visible = false;
        }
        modify(Width)
        {
            Visible = false;
        }
        modify(Weight)
        {
            Visible = false;
        }
        modify(Cubage)
        {
            Visible = false;
        }

        addlast(Control1)
        {
            field("ACO Length"; Rec."ACO Length")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Length [mm] field.';
            }
            field("ACO Circumference"; Rec."ACO Circumference")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Circumference [mm] field.';
            }

            field("ACO Weight per meter"; Rec."ACO Weight per meter")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Weight per meter [kg] field.';
            }

            field("ACO Correction Factor"; Rec."ACO Correction Factor")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Correction Factor field.';
            }

            field("ACO Height Level"; Rec."ACO Height Level")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Height Level [mm] field.';
            }
        }
    }
}