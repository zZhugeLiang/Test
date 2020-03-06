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
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Line No.";"Sales Line No") 
                {
                    ApplicationArea = All;
                }
                field("Bathsheet No."; "Bathsheet No.")
                {
                    ApplicationArea = All;
                }
                field("Bathsheet line No."; "Bathsheet line No.")
                {
                    ApplicationArea = All;
                }
                field("Profile no."; "Profile no.")
                {
                    ApplicationArea = All;
                }
                field("Profile description"; "Profile description")
                {
                    ApplicationArea = All;
                }
                field(Length; Length)
                {
                    ApplicationArea = All;
                }
                field(Treatment; Treatment)
                {
                    ApplicationArea = All;
                }
               field("Treatment Description"; "Treatment Description")
                {
                    ApplicationArea = All;
                }
                field("Your Reference"; "Your Reference")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    
}
