tableextension 50001 "ACO Item Extension" extends Item
{
    fields
    {
        field(50000; "ACO Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOPretreatment: Record "ACO Pretreatment";
            begin
                if ACOPretreatment.Get("ACO Pretreatment") then
                    ACOInsertDefaultDimension(ACOPretreatment."Dimension Code", ACOPretreatment."Dimension Value Code")
                else
                    if ACOPretreatment.Get(xRec."ACO Pretreatment") then
                        ACODeleteDefaultDimension(ACOPretreatment."Dimension Code", ACOPretreatment."Dimension Value Code");
            end;
        }
        field(50001; "ACO Layer Thickness Code"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOLayerThickness: Record "ACO Layer Thickness";
            begin
                if ACOLayerThickness.Get("ACO Layer Thickness Code") then
                    ACOInsertDefaultDimension(ACOLayerThickness."Dimension Code", ACOLayerThickness."Dimension Value Code")
                else
                    if ACOLayerThickness.Get(xRec."ACO Layer Thickness Code") then
                        ACODeleteDefaultDimension(ACOLayerThickness."Dimension Code", '');
            end;
        }

        field(50002; "ACO Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOColor: Record "ACO Color";
            begin
                if ACOColor.Get("ACO Color") then
                    ACOInsertDefaultDimension(ACOColor."Dimension Code", ACOColor."Dimension Value Code")
                else
                    if ACOColor.Get(xRec."ACO Color") then
                        ACODeleteDefaultDimension(ACOColor."Dimension Code", '');
            end;
        }

        field(50003; "ACO Category Code"; Code[50])
        {
            Caption = 'Category Code';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Sawing"; Boolean)
        {
            Caption = 'Sawing';
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Price Scheme Code"; Code[10])
        {
            Caption = 'Price Scheme';
            TableRelation = "ACO Price Scheme";
            DataClassification = CustomerContent;
        }

        field(50007; "ACO Extra to Enumerate"; Integer)
        {
            Caption = 'Extra to Enumerate [mm]';
            DataClassification = CustomerContent;
        }

        field(50008; "ACO Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50009; "ACO Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50010; "ACO Sawing Discount"; Decimal)
        {
            Caption = 'Sawing Discount';
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Minimum Current Density"; Decimal)
        {
            Caption = 'Minimum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50012; "ACO Maximum Current Density"; Decimal)
        {
            Caption = 'Maximum Current Density [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50014; "ACO Not Measurable"; Boolean)
        {
            Caption = 'Not Measurable';
            DataClassification = CustomerContent;
        }

        field(50015; "ACO Charges per Bath Profile"; Decimal)
        {
            Caption = 'Charges per Bath Profile';
            DataClassification = CustomerContent;
        }

        field(50016; "ACO Extra Flushing"; Boolean)
        {
            Caption = 'Extra Flushing';
            DataClassification = CustomerContent;
        }

        field(50017; "ACO Posttreatment"; Code[20])
        {
            Caption = 'Posttreatment';
            TableRelation = "ACO Posttreatment";
            DataClassification = CustomerContent;
        }

        field(50018; "ACO Particularity"; Code[20])
        {
            Caption = 'Particularity';
            TableRelation = "ACO Particularity";
            DataClassification = CustomerContent;
        }
    }

    local procedure ACOInsertDefaultDimension(DimensionCode: Code[20]; DimensionValueCode: Code[20])
    var
        DefaultDimension: Record "Default Dimension";
    begin
        if DefaultDimension.Get(Database::Item, "No.", DimensionCode) then begin
            DefaultDimension."Dimension Value Code" := DimensionValueCode;
            DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::" ";
            DefaultDimension.Modify();
        end else begin
            DefaultDimension.Init();
            DefaultDimension."Table ID" := Database::Item;
            DefaultDimension."No." := "No.";
            DefaultDimension."Dimension Code" := DimensionCode;
            DefaultDimension."Dimension Value Code" := DimensionValueCode;
            DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::" ";
            DefaultDimension.Insert();
        end;

        ACOUpdateGlobalDimension(DimensionCode, DimensionValueCode);
    end;

    local procedure ACODeleteDefaultDimension(DimensionCode: Code[20]; DimensionValueCode: Code[20])
    var
        DefaultDimension: Record "Default Dimension";
    begin
        if DefaultDimension.Get(Database::Item, "No.", DimensionCode) then begin
            DefaultDimension.Delete();
            ACOUpdateGlobalDimension(DimensionCode, DimensionValueCode);
        end;
    end;

    local procedure ACOUpdateGlobalDimension(DimensionCode: Code[20]; DimensionValueCode: Code[20])
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        if DimensionCode = GLSetup."Global Dimension 1 Code" then
            "Global Dimension 1 Code" := DimensionValueCode;
        if DimensionCode = GLSetup."Global Dimension 2 Code" then
            "Global Dimension 2 Code" := DimensionValueCode;
    end;
}