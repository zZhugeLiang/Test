pageextension 50006 "ACO Released Prod. Order Ext." extends "Released Production Order"
{
    layout
    {
        addafter(Quantity)
        {
            field("ACO Quantity Charges New"; Rec."ACO Quantity Charges New")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetPostProductionJournal(false);
    end;
}