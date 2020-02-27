page 50003 "ACO Pretreatments"
{
    Caption = 'Pretreatments';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ACO Pretreatment";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Pretreatments)
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
                field("Minimum Current Density"; "Minimum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Maximum Current Density"; "Maximum Current Density")
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
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
                field("Thin Staining Time"; "Thin Staining Time")
                {
                    ApplicationArea = All;
                }
                field("Thick Staining Time"; "Thick Staining Time")
                {
                    ApplicationArea = All;
                }
                field(Aucos; Aucos)
                {
                    Editable = AucosEditable;
                    ApplicationArea = All;
                }
                field("Aucos Sealing Time"; "Aucos Sealing Time")
                {
                    Editable = AucosEditable;
                    ApplicationArea = All;
                }
                field("Aucos Flushing Time"; "Aucos Flushing Time")
                {
                    Editable = AucosEditable;
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        AucosEditable := UserSetup.Get(UserID()) and UserSetup."ACO Adjust ablauf for Aucos";
    end;

    var
        AucosEditable: Boolean;
}