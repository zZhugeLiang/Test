tableextension 50001 "VZK Item Extension" extends Item
{
    fields
    {
        field(50000; "ACO Pretreatment Code"; Code[10])
        {
            Caption = ' Pretreatment Code';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOPretreatment: Record "ACO Pretreatment";
            begin
                if ACOPretreatment.Get("ACO Pretreatment Code") then
                    ACOInsertDefaultDimension(ACOPretreatment."Dimension Code", ACOPretreatment.Code)
                else
                    if ACOPretreatment.Get(xRec."ACO Pretreatment Code") then
                        ACODeleteDefaultDimension(ACOPretreatment."Dimension Code", '');
            end;
        }
        field(50001; "ACO Layer Thickness Code"; Code[10])
        {
            Caption = 'Layer Thickness Code';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ACOLayerThickness: Record "ACO Layer Thickness";
            begin
                if ACOLayerThickness.Get("ACO Layer Thickness Code") then
                    ACOInsertDefaultDimension(ACOLayerThickness."Dimension Code", ACOLayerThickness.Code)
                else
                    if ACOLayerThickness.Get(xRec."ACO Layer Thickness Code") then
                        ACODeleteDefaultDimension(ACOLayerThickness."Dimension Code", '');
            end;
        }

        field(50002; "ACO Color Code"; Code[20])
        {
            Caption = 'Color Code';
            DataClassification = CustomerContent;
            TableRelation = "ACO Color";

            trigger OnValidate()
            var
                ACOColor: Record "ACO Color";
            begin
                if ACOColor.Get("ACO Color Code") then
                    ACOInsertDefaultDimension(ACOColor."Dimension Code", ACOColor.Code)
                else
                    if ACOColor.Get(xRec."ACO Color Code") then
                        ACODeleteDefaultDimension(ACOColor."Dimension Code", '');
            end;
        }

        field(50003; "ACO Category Code"; Code[50])
        {
            Caption = 'Category Code';
            DataClassification = CustomerContent;
            TableRelation = "ACO Category";
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