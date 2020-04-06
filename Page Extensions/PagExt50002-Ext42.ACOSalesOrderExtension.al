pageextension 50002 "ACO Sales Order Extension" extends "Sales Order"
{
    layout
    {
        addafter(General)
        {
            group(Production)
            {
                field("ACO Week Capacity"; "ACO Week Capacity")
                {
                    ApplicationArea = All;
                }
                field("ACO Large Line"; "ACO Large Line")
                {
                    ApplicationArea = All;
                }
                field("ACO Quantity Charges"; "ACO Quantity Charges")
                {
                    ApplicationArea = All;
                }
                field("ACO Logged In"; "ACO Logged In")
                {
                    Editable = not "ACO Logged In";
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        LoggedInQst: Label 'Are you sure you want to login this Sales Order?';
                    begin
                        if not Confirm(LoggedInQst) then
                            Error('');

                        //LoggedIn := "ACO Logged In";
                        Validate("ACO Logged In DateTime", CurrentDateTime());
                    end;
                }
                field("ACO Logged In Day"; "ACO Logged In Day")
                {
                    ApplicationArea = All;
                }
                field("ACO Logged In Week"; "ACO Logged In Week")
                {
                    ApplicationArea = All;
                }
                field("ACO Logged In Year"; "ACO Logged In Year")
                {
                    ApplicationArea = All;
                }
                field("ACO Customer Comment"; "ACO Customer Comment")
                {
                    ApplicationArea = All;
                }
            }
        }

        addafter("Document Date")
        {
            field("ACO Document Date Day"; "ACO Document Date Day")
            {
                ApplicationArea = All;
            }
            field("ACO Document Date Week"; "ACO Document Date Week")
            {
                ApplicationArea = All;
            }
            field("ACO Document Date Year"; "ACO Document Date Year")
            {
                ApplicationArea = All;
            }
        }
    }
}