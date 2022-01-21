table 50017 "ACO Bath Sheet Line"
{
    Caption = 'Bath Sheet Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bath Sheet No."; Code[20])
        {
            Caption = 'Bath Sheet No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(2; "Production Order No."; Code[20])
        {
            Caption = 'Production Order No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(3; "Production Order Status"; Option)
        {
            Caption = 'Production Order Status';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(4; "Production Order Line No."; Integer)
        {
            Caption = 'Production Order Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(5; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "Sales Line"."ACO Profile Code";
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(6; "Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("ACO Profile".Description where("Code" = field("Profile Code")));
        }

        field(7; "Length"; Decimal)
        {
            Caption = 'Length';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(8; "Circumference"; Decimal)
        {
            Caption = 'Circumference';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(9; "Treatment"; Code[20])
        {
            Caption = 'Treatment';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(10; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CalculateSurface();
            end;
        }

        field(11; "Rerun"; Boolean)
        {
            Caption = 'Rerun';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(12; "Rerun Reason"; Code[10])
        {
            Caption = 'Rerun Reason';
            TableRelation = "Reason Code";
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(13; "Color"; Code[20])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
        }

        field(14; "High End"; Boolean)
        {
            Caption = 'High End';
            DataClassification = CustomerContent;
        }

        field(15; "Reject Quantity"; Decimal)
        {
            Caption = 'Reject Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                RejectQuantityCannotBeGreaterThanQuantityErr: Label 'Reject Quantity cannot be greater than Quantity.';
            begin
                if "Reject Quantity" > Quantity then
                    Error(RejectQuantityCannotBeGreaterThanQuantityErr);
            end;
        }

        field(16; "Charge No."; Code[10])
        {
            Caption = 'Charge No.';
            DataClassification = CustomerContent;
        }

        field(17; "Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(18; "Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(19; "Surface"; Decimal)
        {
            Caption = 'Surface';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(20; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(21; "Sales Order Line No."; Integer)
        {
            Caption = 'Sales Order Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(22; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            Editable = false;
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }

        field(25; "Completed"; Boolean)
        {
            Caption = 'Completed';
            Editable = False;
            FieldClass = FlowField;
            CalcFormula = Lookup("ACO Bath Sheet Header".Complete where("No." = field("Bath Sheet No.")));
        }

        field(26; "Qty in Package"; Decimal)
        {
            Caption = 'Qty. in Package';
            Editable = true;
            DataClassification = CustomerContent;
        }

        field(27; "Quantity Processed"; Integer)
        {
            Caption = 'Quantity Processed';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("ACO Package Line"."Quantity" where("Bathsheet No." = field("Bath Sheet No."), "Production Order No." = field("Production Order No."),
                                                                    "Production Order Status" = field("Production Order Status"), "Production Order Line No." = field("Production Order Line No.")));
        }

        field(28; "Bathsheet Complete"; Boolean)
        {
            Caption = 'Bathsheet Complete';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("ACO Bath Sheet Header".Complete where("No." = field("Bath Sheet No.")));
        }

        field(50016; "Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Bath Sheet No.", "Production Order No.", "Production Order Status", "Production Order Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        CalculateProcessTimesBathSheetHeader();
    end;

    trigger OnDelete()
    var
    begin
        CalculateProcessTimesBathSheetHeader();
    end;

    local procedure CalculateProcessTimesBathSheetHeader()
    var
        ACOBathSheetHeader: Record "ACO Bath Sheet Header";
    begin
        ACOBathSheetHeader.Get(Rec."Bath Sheet No.");
        ACOBathSheetHeader.CalculateProcessTimes(ACOBathSheetHeader);
    end;

    procedure CalculateSurface()
    begin
        Surface := Quantity * Length * Circumference / 10000;
    end;
}