page 50031 "ACO Package Card SubPage"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "ACO Package Line";
    Caption = 'Lines';
    DelayedInsert = true;
    ModifyAllowed = true;
    LinksAllowed = false;
    MultipleNewLines = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Package No."; Rec."Package No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Line No."; Rec."Sales Line No")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet No."; Rec."Bathsheet No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet line No."; Rec."Bathsheet line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile no."; Rec."Profile no.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile description"; Rec."Profile description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Customer Item No."; Rec."Customer Item No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile Cust. Description"; Rec."Profile Cust. Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Length; Rec.Length)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Treatment; Rec.Treatment)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Treatment Description"; Rec."Treatment Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Quantity; Quantity)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Number of Units"; Rec."Number of Units")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Reject Reason Code"; Rec."Reject Reason Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Ship; Rec.Ship)
                {
                    Editable = true;
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
            }
        }
    }
}
