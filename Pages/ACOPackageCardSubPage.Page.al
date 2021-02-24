page 50031 "ACO Package Card SubPage"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "ACO Package Line";
    Caption = 'Lines';
    DelayedInsert = true;
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
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Sales Line No."; "Sales Line No")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet No."; "Bathsheet No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Bathsheet line No."; "Bathsheet line No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile no."; "Profile no.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile description"; "Profile description")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Customer Item No."; "Customer Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Profile Cust. Description"; "Profile Cust. Description")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Length; Length)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Treatment; Treatment)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Treatment Description"; "Treatment Description")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Your Reference"; "Your Reference")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Number of Units"; "Number of Units")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Reject Reason Code"; "Reject Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
        }
    }
}
