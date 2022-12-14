pageextension 50009 "ACO Sales Quote Extension" extends "Sales Quote"
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
                    ToolTip = 'Week Capacity';
                }
                field("ACO Large Line"; "ACO Large Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Large Line';
                }
                field("ACO Quantity Charges"; "ACO Quantity Charges")
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantity Charges';
                }
                field("ACO Logged In"; "ACO Logged In")
                {
                    Editable = not "ACO Logged In";
                    ApplicationArea = All;
                    ToolTip = 'Logged In';

                    trigger OnValidate()
                    var
                        LoggedInQst: Label 'Are you sure you want to login this Sales Order?';
                    begin
                        if not Confirm(LoggedInQst) then
                            Error('');

                        Validate("ACO Logged In DateTime", CurrentDateTime());
                    end;
                }
                field("ACO Logged In Day"; "ACO Logged In Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Day';
                }
                field("ACO Logged In Week"; "ACO Logged In Week")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Week';
                }
                field("ACO Logged In Year"; "ACO Logged In Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Logged In Year';
                }
                field("ACO Customer Comment"; "ACO Customer Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Comment';
                }
            }
        }

        addafter("Document Date")
        {
            field("ACO Document Date Day"; "ACO Document Date Day")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Day';
            }
            field("ACO Document Date Week"; "ACO Document Date Week")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Week';
            }
            field("ACO Document Date Year"; "ACO Document Date Year")
            {
                ApplicationArea = All;
                ToolTip = 'Document Date Year';
            }
            field("ACO Supplier"; "ACO Supplier")
            {
                ApplicationArea = All;
                ToolTip = 'Supplier';
            }
        }
        addafter("Shipping Agent Service Code")
        {
            field("ACO Own Shipping Agent"; "ACO Own Shipping Agent")
            {
                ApplicationArea = All;
                ToolTip = 'Own Shipping Agent';
            }
        }
    }
}