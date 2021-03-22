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

                field("Package No."; "Package No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Line No."; "Line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Line No."; "Sales Line No")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet No."; "Bathsheet No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet line No."; "Bathsheet line No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile no."; "Profile no.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile description"; "Profile description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Customer Item No."; "Customer Item No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile Cust. Description"; "Profile Cust. Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Length; Length)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Treatment; Treatment)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Treatment Description"; "Treatment Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Your Reference"; "Your Reference")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("External Document No."; "External Document No.")
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
                field("Number of Units"; "Number of Units")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Variant Code"; "Variant Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Reject Reason Code"; "Reject Reason Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Ship; Ship)
                {
                    Editable = true;
                    ApplicationArea = All;
                    Tooltip = ' ';
                }
            }
        }
    }
}
