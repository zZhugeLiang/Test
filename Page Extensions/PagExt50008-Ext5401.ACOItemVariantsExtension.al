pageextension 50008 "ACO Item Variants Extension" extends "Item Variants"
{
    layout
    {
        addafter("Description 2")
        {
            field("ACO Number of Meters"; "ACO Number of Meters")
            {
                ApplicationArea = All;
                ToolTip = 'Number of Meters';
            }

        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ItemVariant: Record "Item Variant";
    begin
        ItemVariant.SetRange("Item No.", "Item No.");
        if ItemVariant.FindSet() then
            repeat
                ItemVariant.TestField("ACO Number of Meters");
            until ItemVariant.Next() = 0;
    end;

}