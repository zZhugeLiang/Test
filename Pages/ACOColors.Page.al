page 50005 "ACO Colors"
{
    Caption = 'Colors';
    PageType = List;
    DelayedInsert = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Color";

    layout
    {
        area(Content)
        {
            repeater(Colors)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Minimum Current Density"; "Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; "Maximum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Dimension Code"; "Dimension Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension Value Code"; "Dimension Value Code")
                {
                    ApplicationArea = All;
                }
                field("Color Group Code"; "Color Group")
                {
                    ApplicationArea = All;
                }
                field("Coloring Time"; "Coloring Time")
                {
                    ApplicationArea = All;
                }
                field(Aucos; Aucos)
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

    // TODO issue 13
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Color Group");
    end;
}