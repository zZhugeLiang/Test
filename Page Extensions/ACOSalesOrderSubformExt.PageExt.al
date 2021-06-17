pageextension 50003 "ACO Sales Order Subform Ext." extends "Sales Order Subform"
{
    layout
    {

        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                Rec."ACO Manual Unit Price" := true;
            end;
        }
        addlast(Control1)
        {
            field("ACO Number of Units"; "ACO Number of Units")
            {
                ApplicationArea = All;
            }
            field("ACO British Standard"; "ACO British Standard")
            {
                ApplicationArea = All;
            }
            field("ACO Layer Thickness"; "ACO Layer Thickness")
            {
                ApplicationArea = All;
            }
            field("ACO Color"; "ACO Color")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
                // trigger OnValidate()
                // var
                //     ACOProfileCustomer: Record "ACO Profile Customer";
                //     ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
                // begin
                //     ACOSingleInstanceMgt.GetACOProfileCustomer(ACOProfileCustomer);
                //     if not ACOProfileCustomer.IsEmpty() then begin
                //         Rec.ACO Profile de
                //     end;
                // end;
            }
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Circumference"; "ACO Profile Circumference")
            {
                ApplicationArea = All;
            }
            field("ACO Customer Item No."; "ACO Customer Item No.")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Cust. Description"; "ACO Profile Cust. Description")
            {
                ApplicationArea = All;
            }
            field("ACO Not Measurable"; "ACO Not Measurable")
            {
                ApplicationArea = All;
            }
            field("ACO Extra Flushing"; "ACO Extra Flushing")
            {
                ApplicationArea = All;
            }
            field("ACO Area Profile"; "ACO Area Profile")
            {
                ApplicationArea = All;
            }
            field("ACO Euras Profile"; "ACO Euras Profile")
            {
                ApplicationArea = All;
            }
            field("ACO High End"; "ACO High End")
            {
                ApplicationArea = All;
            }
            field("ACO Measure Report"; "ACO Measure Report")
            {
                ApplicationArea = All;
            }
            field("ACO Attach Method Code Profile"; "ACO Attach Method Code Profile")
            {
                ApplicationArea = All;
            }
            field("ACO Type of Clamp Code"; "ACO Type of Clamp Code")
            {
                ApplicationArea = All;
            }
            field("ACO Area"; "ACO Area")
            {
                ApplicationArea = All;
            }
            field("ACO Sawing"; "ACO Sawing")
            {
                ApplicationArea = All;
            }
            field("ACO Start Length"; "ACO Start Length")
            {
                Editable = "ACO Sawing";
                ApplicationArea = All;
            }
            field("ACO Qty. After Production"; "ACO Qty. After Production")
            {
                ApplicationArea = All;
            }
            field("ACO Linked Holder"; "ACO Linked Holder")
            {
                ApplicationArea = All;
            }
            field("ACO Receipt Bag"; "ACO Receipt Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Receipt Shelf"; "ACO Receipt Shelf")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Bag"; "ACO Shipping Bag")
            {
                ApplicationArea = All;
            }
            field("ACO Shipping Shelf"; "ACO Shipping Shelf")
            {
                ApplicationArea = All;
            }
            field("ACO Kundentour HUECK"; "ACO Kundentour HUECK")
            {
                ApplicationArea = All;
            }
            field("ACO Packaging"; "ACO Packaging")
            {
                ApplicationArea = All;
            }
            field("ACO Project Color Code"; "ACO Project Color Code")
            {
                ApplicationArea = All;
            }
            field("ACO Head Cut"; "ACO Head Cut")
            {
                ApplicationArea = All;
            }
            field("ACO Return Remaining"; "ACO Return Remaining")
            {
                ApplicationArea = All;
            }
            field("ACO Lower Accuracy"; "ACO Lower Accuracy")
            {
                ApplicationArea = All;
            }
            field("ACO Upper Accuracy"; "ACO Upper Accuracy")
            {
                ApplicationArea = All;
            }
            field("ACO Number of Units to Ship"; "ACO Number of Units to Ship")
            {
                ApplicationArea = All;
            }
            field("ACO Number of Units to Invoice"; "ACO Number of Units to Invoice")
            {
                ApplicationArea = All;
            }
            field(ACOHasClampingMethod; ACOHasClampingMethod)
            {
                Caption = 'Clamping Method';
                ApplicationArea = All;
            }
            field(ACOHasPackagingInstructions; ACOHasPackagingInstructions)
            {
                Caption = 'Packaging Instructions';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast("&Line")
        {
            action("ACO Download Packaging Instructions")
            {
                Caption = 'Download Packaging Instructions';
                Image = Documents;
                ApplicationArea = All;
                ToolTip = 'Download Packaging Instructions';

                trigger OnAction()
                var
                    ACOProfile: Record "ACO Profile";
                    ACOProfileCustomer: Record "ACO Profile Customer";
                begin
                    if ACOProfile.Get(Rec."ACO Profile Code") then
                        ACOProfile.DownloadPackagingInstructions();
                end;
            }

            action("ACO Download Clamping Instructions")
            {
                Caption = 'Download Clamping Instructions';
                Image = Documents;
                ApplicationArea = All;
                ToolTip = 'Download Clamping Instructions';

                trigger OnAction()
                var
                    ACOProfile: Record "ACO Profile";
                begin
                    if ACOProfile.Get(Rec."ACO Profile Code") then
                        ACOProfile.DownloadClampingMethod();
                end;
            }
        }
    }

    // TODO issue 8
    // trigger OnOpenPage()
    // var
    //     ACOProfileCustomer: Record "ACO Profile Customer";
    //     ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    // begin
    //     // Clear(ACOProfileCustomer);
    //     // ACOSingleInstanceMgt.ClearACOProfileCustomer();
    //     ACOSingleInstanceMgt.SetACOProfileCustomerPK('', '', '');
    // end;

    trigger OnAfterGetRecord()
    var
        ACOProfile: Record "ACO Profile";
    begin
        if ACOProfile.Get(Rec."ACO Profile Code") then begin
            ACOProfile.CalcFields("Clamping Method File", "Packaging Instructions File");

            ACOHasClampingMethod := ACOProfile."Clamping Method File".HasValue();
            ACOHasPackagingInstructions := ACOProfile."Packaging Instructions File".HasValue();
        end else begin
            ACOHasClampingMethod := false;
            ACOHasPackagingInstructions := false;
        end;
    end;

    // TODO issue 8
    // trigger OnClosePage()
    // var
    //     ACOProfileCustomer: Record "ACO Profile Customer";
    //     ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    // begin
    //     // Clear(ACOProfileCustomer);
    //     ACOSingleInstanceMgt.SetACOProfileCustomerPK('', '', '');
    // end;

    var
        ACOHasClampingMethod: Boolean;
        ACOHasPackagingInstructions: Boolean;
}