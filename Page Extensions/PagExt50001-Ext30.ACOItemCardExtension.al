pageextension 50001 "ACO Item Card Extension" extends "Item Card"
{
    layout
    {
        addlast(Content)
        {
            group(Production)
            {
                field("ACO Pretreatment"; "ACO Pretreatment")
                {
                    ApplicationArea = All;
                }

                field("ACO Layer Thickness"; "ACO Layer Thickness Code")
                {
                    ApplicationArea = All;
                }

                field("ACO Color"; "ACO Color")
                {
                    ApplicationArea = All;
                }

                field("ACO Category"; "ACO Category Code")
                {
                    ApplicationArea = All;
                }

                field("ACO Sawing"; "ACO Sawing")
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
            action("ACO Pretreatments")
            {
                Caption = 'Pretreatments';
                Image = Action;
                RunObject = Page "ACO Pretreatments";
                ApplicationArea = All;
            }

            action("ACO Layer Thicknesses")
            {
                Caption = 'Layer Thicknesses';
                Image = SetPriorities;
                RunObject = Page "ACO Layer Thicknesses";
                ApplicationArea = All;
            }

            action("ACO Colors")
            {
                Caption = 'Colors';
                Image = Category;
                RunObject = Page "ACO Colors";
                ApplicationArea = All;
            }

            action("ACO Color Groups")
            {
                Caption = 'Color Groups';
                Image = AbsenceCategories;
                RunObject = Page "ACO Color Groups";
                ApplicationArea = All;
            }

            action("ACO Categories")
            {
                Caption = 'Categories';
                Image = Segment;
                RunObject = Page "ACO Colors";
                ApplicationArea = All;
            }
        }
    }
}