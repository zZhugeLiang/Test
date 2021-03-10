table 50023 "ACO Package Header"
{
    Caption = 'Package Header';
    DrillDownPageId = "ACO Packages";
    LookupPageId = "ACO Packages";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(2; "Resource No."; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Customer Name"; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(5; "Address1"; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(6; "Address2"; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(7; "Packing Type"; Option)
        {
            OptionMembers = Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Rack No. Customer"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(9; "Remark"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(10; "Date-Time"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; Reject; Boolean)
        {
            Caption = 'Reject';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(12; "Sales Shipment No."; Code[20])
        {
            //TODO 2
            Caption = 'Sales Shipment No.';
            Editable = false;
            TableRelation = "Sales Shipment Header";
            DataClassification = CustomerContent;
        }

        field(13; City; Text[30])
        {
            Caption = 'City';
            Editable = false;
        }

        field(14; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            Editable = false;
        }

        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ACOPackageLine: Record "ACO Package Line";
        SalesShipmentLinkedErr: Label 'Package can not be deleted while a Sales Shipment is linked to it.';
    begin
        //TODO 5
        if Rec."Sales Shipment No." <> '' then
            Error(SalesShipmentLinkedErr);

        if Rec.Reject then begin
            ACOPackageLine.SetRange("Package No.", Rec."No.");
            if ACOPackageLine.FindSet() then
                repeat
                    if ACOBathSheetLine.Get(ACOPackageLine."Bathsheet No.", ACOPackageLine."Production Order No.", ACOPackageLine."Production Order Status", ACOPackageLine."Production Order Line No.") then begin
                        ACOBathSheetLine."Reject Quantity" -= ACOPackageLine.Quantity;
                        ACOBathSheetLine.Modify();
                    end;
                until ACOPackageLine.Next() = 0;

            ACOPackageLine.SetRange("Package No.", Rec."No.");
            ACOPackageLine.DeleteAll();
        end else begin
            ACOPackageLine.SetRange("Package No.", Rec."No.");
            if ACOPackageLine.FindSet() then
                repeat
                    if ACOBathSheetLine.Get(ACOPackageLine."Bathsheet No.", ACOPackageLine."Production Order No.", ACOPackageLine."Production Order Status", ACOPackageLine."Production Order Line No.") then begin
                        ACOBathSheetLine."Remaining Quantity" += ACOPackageLine.Quantity;
                        ACOBathSheetLine."Quantity Processed" -= ACOPackageLine.Quantity;
                        ACOBathSheetLine.Modify();
                    end;
                until ACOPackageLine.Next() = 0;

            ACOPackageLine.SetRange("Package No.", Rec."No.");
            ACOPackageLine.DeleteAll();
        end;
    end;
}