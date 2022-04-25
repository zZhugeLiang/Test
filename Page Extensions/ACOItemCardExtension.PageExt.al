pageextension 50001 "ACO Item Card Extension" extends "Item Card"
{
    layout
    {
        modify("Item Category Code")
        {
            Visible = false;
        }

        addafter("Item Category Code")
        {
            field("ACO Category"; Rec."ACO Category Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category Code field.';
            }
            field("ACO Price Scheme Code"; Rec."ACO Price Scheme Code")
            {
                ApplicationArea = All;
                Importance = Promoted;
                ToolTip = 'Specifies the value of the Price Scheme field.';
            }
        }

        addlast(Content)
        {
            group(Production)
            {
                field("ACO Pretreatment"; Rec."ACO Pretreatment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Pretreatment field.';
                }

                field("ACO Layer Thickness"; Rec."ACO Layer Thickness Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Layer Thickness field.';
                }

                field("ACO Color"; Rec."ACO Color")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Color field.';
                }

                field("ACO Sawing"; Rec."ACO Sawing")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sawing field.';
                }

                field("ACO Euras"; Rec."ACO Euras")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Euras field.';
                }

                field("ACO Extra to Enumerate"; Rec."ACO Extra to Enumerate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Extra to Enumerate [mm] field.';
                }

                field("ACO Thin Staining Time"; Rec."ACO Thin Staining Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Thin Staining Time [min] field.';
                }

                field("ACO Thick Staining Time"; Rec."ACO Thick Staining Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Thick Staining Time [min] field.';
                }

                field("ACO Sawing Discount"; Rec."ACO Sawing Discount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sawing Discount field.';
                }

                field("ACO Minimum Current Density"; Rec."ACO Minimum Current Density")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Current Density [A/dm²] field.';
                }

                field("ACO Maximum Current Density"; Rec."ACO Maximum Current Density")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Current Density [A/dm²] field.';
                }

                field("ACO High End"; Rec."ACO High End")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the High End field.';
                }

                field("ACO Not Measurable"; Rec."ACO Not Measurable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Not Measurable field.';
                }

                field("ACO Charges per Bath Profile"; Rec."ACO Charges per Bath Profile")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Charges per Bath Profile field.';
                }

                field("ACO Extra Flushing"; Rec."ACO Extra Flushing")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Extra Flushing field.';
                }
                field("ACO Posttreatment"; Rec."ACO Posttreatment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posttreatment field.';
                }
                field("ACO Particularity"; Rec."ACO Particularity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Particularity field.';
                }
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action("ACO Pretreatments")
            {
                Caption = 'Pretreatments';
                Image = Action;
                RunObject = Page "ACO Pretreatments";
                ApplicationArea = All;
                ToolTip = 'Executes the Pretreatments action.';
            }

            action("ACO Layer Thicknesses")
            {
                Caption = 'Layer Thicknesses';
                Image = SetPriorities;
                RunObject = Page "ACO Layer Thicknesses";
                ApplicationArea = All;
                ToolTip = 'Executes the Layer Thicknesses action.';
            }

            action("ACO Colors")
            {
                Caption = 'Colors';
                Image = Category;
                RunObject = Page "ACO Colors";
                ApplicationArea = All;
                ToolTip = 'Executes the Colors action.';
            }

            action("ACO Color Groups")
            {
                Caption = 'Color Groups';
                Image = AbsenceCategories;
                RunObject = Page "ACO Color Groups";
                ApplicationArea = All;
                ToolTip = 'Executes the Color Groups action.';
            }

            action("ACO Categories")
            {
                Caption = 'Categories';
                Image = Segment;
                RunObject = Page "ACO Colors";
                ApplicationArea = All;
                ToolTip = 'Executes the Categories action.';
            }

            action("ACO Linked Holders")
            {
                Caption = 'Linked Holders';
                Image = Category;
                RunObject = Page "ACO Linked Holders";
                RunPageLink = "Item No." = field("No.");
                ApplicationArea = All;
            }

            action("ACO Linked Packaging List")
            {
                Caption = 'Linked Packaging List';
                Image = CoupledItem;
                RunObject = Page "ACO Linked Packaging List";
                RunPageLink = "Item No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}