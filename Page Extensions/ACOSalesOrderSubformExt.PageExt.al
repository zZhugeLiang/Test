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
            field("ACO Pretreatment"; "ACO Pretreatment")
            {
                ApplicationArea = All;
            }
            field("ACO Posttreatment"; "ACO Posttreatment")
            {
                ApplicationArea = All;
            }
            field("ACO Particularity"; "ACO Particularity")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Code"; "ACO Profile Code")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    ACOSetCheckboxes();
                end;
            }
            field("ACO Profile Description"; "ACO Profile Description")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Circumference"; "ACO Profile Circumference")
            {
                ApplicationArea = All;
            }
            field("ACO Profile Length"; "ACO Profile Length")
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
            field("ACO Reject Billable"; "ACO Reject Billable")
            {
                ApplicationArea = All;
                Editable = true;

            }
            field("ACO Reject Not Billable"; "ACO Reject Not Billable")
            {
                ApplicationArea = All;
            }
            field("ACO Reject Billable Shipped"; "ACO Reject Billable Shipped")
            {
                ApplicationArea = All;
            }
            field("ACO Rej. Not Billable Shipped"; "ACO Rej. Not Billable Shipped")
            {
                ApplicationArea = All;
            }
            field(ACOHasClampingMethod; ACOHasClampingMethod)
            {
                Caption = 'Clamping Method';
                Editable = false;
                ApplicationArea = All;
            }
            field(ACOHasPackagingInstructions; ACOHasPackagingInstructions)
            {
                Caption = 'Packaging Instructions';
                Editable = false;
                ApplicationArea = All;
            }
            field("ACO Profile Customer PK"; Rec."ACO Profile Customer PK")
            {
                ApplicationArea = All;
            }
            field("ACO Customer Reference"; Rec."ACO Customer Item Reference")
            {
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
                    DestinationType: Enum "ACO Doc. Attach. Dest. Type";
                begin
                    ACODownloadFile(DestinationType::"Packing Instructions");
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
                    DestinationType: Enum "ACO Doc. Attach. Dest. Type";
                begin
                    ACODownloadFile(DestinationType::"Clamping Method");
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetACOProfileCustomerPK('', '', '');
    end;

    trigger OnAfterGetRecord()
    begin
        ACOSetCheckboxes();
    end;

    trigger OnClosePage()
    var
        ACOSingleInstanceMgt: Codeunit "ACO Single Instance Mgt";
    begin
        ACOSingleInstanceMgt.SetACOProfileCustomerPK('', '', '');
    end;

    var
        ACOHasClampingMethod: Boolean;
        ACOHasPackagingInstructions: Boolean;

    local procedure ACOSetCheckboxes()
    var
        Item: Record Item;
        DocumentAttachment: Record "Document Attachment";
    begin
        // TODO Attachments
        ACOHasClampingMethod := false;
        ACOHasPackagingInstructions := false;
        if Rec.Type <> Rec.Type::Item then
            exit;

        if Item.Get(Rec."No.") then begin
            DocumentAttachment.SetRange("Table ID", Database::Item);
            DocumentAttachment.SetRange("No.", Rec."No.");
            DocumentAttachment.SetRange("ACO Source Type", DocumentAttachment."ACO Source Type"::Customer);
            DocumentAttachment.SetRange("ACO Source No.", Rec."Sell-to Customer No.");
            DocumentAttachment.SetRange("ACO Destination Type", DocumentAttachment."ACO Destination Type"::"Clamping Method");
            if DocumentAttachment.FindFirst() then
                ACOHasClampingMethod := DocumentAttachment."Document Reference ID".HasValue();

            DocumentAttachment.Reset();
            DocumentAttachment.SetRange("Table ID", Database::Item);
            DocumentAttachment.SetRange("No.", Rec."No.");
            DocumentAttachment.SetRange("ACO Source Type", DocumentAttachment."ACO Source Type"::Customer);
            DocumentAttachment.SetRange("ACO Source No.", Rec."Sell-to Customer No.");
            DocumentAttachment.SetRange("ACO Destination Type", DocumentAttachment."ACO Destination Type"::"Packing Instructions");
            if DocumentAttachment.FindFirst() then
                ACOHasPackagingInstructions := DocumentAttachment."Document Reference ID".HasValue();
        end;
    end;

    local procedure ACODownloadFile(DestinationType: enum "ACO Doc. Attach. Dest. Type")
    var
        Item: Record Item;
        DocumentAttachment: Record "Document Attachment";
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        if Item.Get(Rec."No.") then begin
            DocumentAttachment.SetRange("Table ID", Database::Item);
            DocumentAttachment.SetRange("No.", Rec."No.");
            DocumentAttachment.SetRange("ACO Source Type", DocumentAttachment."ACO Source Type"::Customer);
            DocumentAttachment.SetRange("ACO Source No.", Rec."Sell-to Customer No.");
            DocumentAttachment.SetRange("ACO Destination Type", DestinationType);
            if DocumentAttachment.FindFirst() then
                ACOExport(DocumentAttachment, true)
            else begin
                DocumentAttachment.SetRange("ACO Source No.");
                if DocumentAttachment.FindFirst() then
                    ACOExport(DocumentAttachment, true)
            end;
        end;
    end;

    procedure ACOExport(var DocumentAttachment: Record "Document Attachment"; ShowFileDialog: Boolean): Text
    var
        TempBlob: Codeunit "Temp Blob";
        FileManagement: Codeunit "File Management";
        DocumentStream: OutStream;
        FullFileName: Text;
    begin
        if DocumentAttachment.ID = 0 then
            exit;

        if not DocumentAttachment."Document Reference ID".HasValue then
            exit;

        FullFileName := DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
        TempBlob.CreateOutStream(DocumentStream);
        DocumentAttachment."Document Reference ID".ExportStream(DocumentStream);
        exit(FileManagement.BLOBExport(TempBlob, FullFileName, ShowFileDialog));
    end;
}