page 50033 "ACO Measured Colors"
{

    PageType = List;
    SourceTable = "ACO Measured Color";
    Caption = 'Measured Colors';
    ApplicationArea = All;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Location; Location)
                {
                    ApplicationArea = All;
                }
                field(SCIL; SCIL)
                {
                    ApplicationArea = All;
                }
                field(SCIA; SCIA)
                {
                    ApplicationArea = All;
                }
                field(SCIB; SCIB)
                {
                    ApplicationArea = All;
                }
                field(SCEL; SCEL)
                {
                    ApplicationArea = All;
                }
                field(SCEA; SCEA)
                {
                    ApplicationArea = All;
                }
                field(SCEB; SCEB)
                {
                    ApplicationArea = All;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = All;
                }
                field(Accord; Accord)
                {
                    ApplicationArea = All;
                }
                field(User; User)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
