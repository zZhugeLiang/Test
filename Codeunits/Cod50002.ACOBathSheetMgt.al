codeunit 50002 "ACO Bath Sheet Mgt."
{

    procedure CreateBathSheet(ProductionOrderLines: Record "Prod. Order Line")
    var
        ACOBathSheetHeader: Record "ACO Bath Sheet Header";
        LineNo: Integer;
    begin
        ProductionOrderLines.SetRange("ACO Included", true);

        CheckProductionLines(ProductionOrderLines);
        //SelectResources(ProductionOrderLines);
        LineNo := 10000;
        ProductionOrderLines.Reset();
        ProductionOrderLines.SetRange("ACO Included", true);
        if ProductionOrderLines.FindSet() then
            repeat
                CreateBathSheetLine(ProductionOrderLines, ACOBathSheetHeader, LineNo);
            until ProductionOrderLines.Next() = 0;
        CreateBathSheetHeader(ACOBathSheetHeader, ProductionOrderLines);
        UpdateBathSheetHeader(ACOBathSheetHeader);
        CalculateProcessTimes(ACOBathSheetHeader, ProductionOrderLines);
        //CompleteBathSheet(ProductionOrderLines);
    end;

    local procedure CheckProductionLines(ProductionOrderLines: Record "Prod. Order Line"): Boolean;
    var
        Item: Record Item;
        ColorCode: Code[20];
        ChargeNo: Code[10];
        ChargeCount: Integer;
        ColorCodeNotIdenticalErr: Label 'Color Code on Charge No. %1 is not identical.';
        VariantCodeEmptyErr: Label 'Variant Code can not be empty on Charge No. %1.';
        ChargeNoEmptyErr: Label 'Charge No can not be empty on Production Order Line %1.';
        QuantityToBathSheetZeroErr: Label 'Quantity to Bath Sheet can not be 0 on Charge No. %1.';
        Max2ChargesErr: Label 'A maximum of 2 charges is allowed, per Bath Sheet.';
    begin
        ProductionOrderLines.SetCurrentKey("ACO Charge No.", Status, "Prod. Order No.");
        if ProductionOrderLines.FindSet() then
            repeat
                if ProductionOrderLines."Variant Code" = '' then
                    Error(VariantCodeEmptyErr);

                if ProductionOrderLines."ACO Quantity to Bath Sheet" = 0 then
                    Error(QuantityToBathSheetZeroErr);

                if ProductionOrderLines."ACO Charge No." = '' then
                    Error(ChargeNoEmptyErr, ProductionOrderLines."Prod. Order No." + ' ' + Format(ProductionOrderLines."Line No."));

                if ChargeNo <> ProductionOrderLines."ACO Charge No." then begin
                    ChargeCount += 1;
                    ColorCode := '';
                end else begin

                end;

                if ChargeCount > 2 then
                    Error(Max2ChargesErr);

                ChargeNo := ProductionOrderLines."ACO Charge No.";

                if Item.Get(ProductionOrderLines."Item No.") then begin
                    if (ColorCode <> '') and (ColorCode <> Item."ACO Color") then
                        Error(ColorCodeNotIdenticalErr, ProductionOrderLines."ACO Charge No.");

                    ColorCode := Item."ACO Color";
                end;
            until ProductionOrderLines.Next() = 0;
    end;

    local procedure SelectResources(BathSheetNo: Code[20]; FilterString: Text)
    var
        Resource: Record Resource;
        ACOSheetResource: Record "ACO Bath Sheet Resource";
        UnknownResourceErr: Label 'Bath Sheet cannot be created, Resource is unknown.';
    begin
        Resource.SetFilter("No.", FilterString);
        if Resource.FindSet() then
            repeat
                ACOSheetResource."Bath Sheet No." := BathSheetNo;
                ACOSheetResource."Resource No." := Resource."No.";
                ACOSheetResource.Insert();
            until Resource.Next() = 0
        else
            Error(UnknownResourceErr);
    end;

    local procedure CreateBathSheetHeader(var ACOBathSheetHeader: Record "ACO Bath Sheet Header"; ProductionOrderLine: Record "Prod. Order Line")
    var
        ACOProfile: Record "ACO Profile";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ACOLayerThickness: Record "ACO Layer Thickness";
        Customer: Record Customer;
        PreviousSourceNo: Code[20];
        CurrentSourceNo: Code[20];
        TotalCircumference: Decimal;
        MaxThickStainingTime: Decimal;
        MinThinStainingTime: Decimal;
        LayerThickness: Integer;
        MaxLayerThickness: Integer;
        SalesLineMeasure: Boolean;
    begin
        // ACOBathSheetHeader."No." := BathSheetHeader."No.";
        if ProductionOrderLine.FindSet() then begin
            if ACOProfile.Get(ProductionOrderLine."ACO Profile Code") then begin
                ACOBathSheetHeader."Bath Sheet Comment" := ACOProfile."Comment Bath Card";
                //ACOBathSheetHeader."Total Surface Profiles" :=
                // ACOBathSheetHeader."Surface Addition" := ACOProfile.
                //SalesLineMeasure := ACOProfile.me
                // ACOBathSheetHeader."Minimum Current Density" := ACOProfile.
            end;

            SalesHeader.Get(SalesHeader."Document Type", ProductionOrderLine."ACO Source No.");
            Customer.Get(SalesHeader."Sell-to Customer No.");
            ACOBathSheetHeader."Note Bath Sheet" := Customer."ACO Comment Bath Card";

            if SalesLine.Get(SalesLine."Document Type"::Order, ProductionOrderLine."ACO Source No.", ProductionOrderLine."ACO Source No.") then
                ACOBathSheetHeader."Extra to Enumerate" := SalesLine."ACO Extra to Enumerate Profile";

            repeat
                CurrentSourceNo := ProductionOrderLine."ACO Source No.";
                if SalesLine.Get(SalesLine."Document Type"::Order, ProductionOrderLine."ACO Source No.", CurrentSourceNo) then begin
                    TotalCircumference += SalesLine."ACO Profile Circumference";

                    if SalesLine."ACO Thick St. Time Profile" >= MaxThickStainingTime then
                        MaxThickStainingTime := SalesLine."ACO Thick St. Time Profile";

                    if SalesLine."ACO Thick Staining Time PT" >= MaxThickStainingTime then
                        MaxThickStainingTime := SalesLine."ACO Thick Staining Time PT";

                    if SalesLine."ACO Thin Staining Time Profile" <= MinThinStainingTime then
                        MinThinStainingTime := SalesLine."ACO Thick St. Time Profile";

                    if SalesLine."ACO Thin Staining Time PT" <= MinThinStainingTime then
                        MinThinStainingTime := SalesLine."ACO Thick Staining Time PT";

                    if not ACOBathSheetHeader.Euras then
                        if SalesLine."ACO Euras Profile" then
                            ACOBathSheetHeader.Euras := true;

                    if ACOLayerThickness.Get(SalesLine."ACO Layer Thickness") then
                        LayerThickness := ACOLayerThickness."mu Value"
                    else
                        LayerThickness := 0;

                    if MaxLayerThickness <= LayerThickness then
                        MaxLayerThickness := LayerThickness;
                end;
                //if SalesLine.ACO

                if PreviousSourceNo <> CurrentSourceNo then begin
                    SalesHeader.Get(SalesHeader."Document Type"::Order, CurrentSourceNo);
                    if not ACOBathSheetHeader.Euras then
                        if SalesHeader."ACO Euras" then
                            ACOBathSheetHeader.Euras := true;
                end;
                // if SalesLine.
                PreviousSourceNo := CurrentSourceNo;
            until ProductionOrderLine.Next() = 0;
        end;

        ACOBathSheetHeader."Layer Thickness" := MaxLayerThickness + SalesHeader."ACO Extra to Enumerate";
        ACOBathSheetHeader.Circumference := TotalCircumference;
        ACOBathSheetHeader.Insert(true);
    end;

    local procedure CreateBathSheetLine(ProductionOrderLine: Record "Prod. Order Line"; ACOBathSheetHeader: Record "ACO Bath Sheet Header"; var LineNo: Integer)
    var
        SalesLine: Record "Sales Line";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ItemVariant: Record "Item Variant";
        MinCurrentDensity: Decimal;
        MaxCurrentDensity: Decimal;
    begin
        SalesLine.Get(SalesLine."Document Type"::Order, ProductionOrderLine."ACO Source No.", ProductionOrderLine."ACO Source Line No.");

        ACOBathSheetLine."Bath Sheet No." := ACOBathSheetHeader."No.";
        ACOBathSheetLine."Production Order Status" := ProductionOrderLine.Status;
        ACOBathSheetLine."Production Order No." := ProductionOrderLine."Prod. Order No.";
        ACOBathSheetLine."Production Order Line No." := ProductionOrderLine."Line No.";
        ACOBathSheetLine.Quantity := ProductionOrderLine."ACO Quantity to Bath Sheet";
        ACOBathSheetLine."Profile Code" := ProductionOrderLine."ACO Profile Code";
        ACOBathSheetLine."Charge No." := ProductionOrderLine."ACO Charge No.";
        ACOBathSheetLine.Color := SalesLine."ACO Color";

        if SalesLine.Type = SalesLine.Type::Item then // is deze regel nodig?
            ACOBathSheetLine.Treatment := SalesLine."No.";

        // if SalesLine."ACO Min. Curr. Density Profile" >= MinCurrentDensity then
        MinCurrentDensity := SalesLine."ACO Min. Curr. Density Profile";

        if SalesLine."ACO Min. Current Density Color" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Min. Current Density Color";
        if SalesLine."ACO Minimum Current Density LT" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Minimum Current Density LT";
        if SalesLine."ACO Minimum Current Density PT" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Minimum Current Density PT";

        // if SalesLine."ACO Max. Curr. Density Profile" <= MaxCurrentDensity then
        MaxCurrentDensity := SalesLine."ACO Max. Curr. Density Profile";
        if SalesLine."ACO Min. Current Density Color" <= MaxCurrentDensity then
            MaxCurrentDensity := SalesLine."ACO Min. Current Density Color";
        if SalesLine."ACO Maximum Current Density LT" <= MaxCurrentDensity then
            MaxCurrentDensity := SalesLine."ACO Maximum Current Density LT";
        if SalesLine."ACO Maximum Current Density PT" <= MaxCurrentDensity then
            MaxCurrentDensity := SalesLine."ACO Maximum Current Density PT";

        ACOBathSheetLine."Minimum Current Density" := MinCurrentDensity;
        ACOBathSheetLine."Maximum Current Density" := MaxCurrentDensity;

        // ACOBathSheetLine.Length := ProductionOrderLine.ACO
        ACOBathSheetLine.Circumference := SalesLine."ACO Profile Circumference";
        ACOBathSheetLine.CalculateSurface();
        ACOBathSheetLine.Insert();
        LineNo += 10000;
    end;

    local procedure UpdateBathSheetHeader(ACOBathSheetHeader: Record "ACO Bath Sheet Header")
    var
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ACOProfile: Record "ACO Profile";
        BathSheetComment: Text;
    begin
        // Wanneer moet deze functie aangeroepen worden?
        ACOBathSheetLine.SetRange("Bath Sheet No.", ACOBathSheetHeader."No.");
        if ACOBathSheetLine.FindSet() then
            repeat
                if ACOProfile.Get(ACOBathSheetLine."Profile Code") and (StrLen(BathSheetComment) < MaxStrLen(ACOBathSheetHeader."Bath Sheet Comment")) then
                    BathSheetComment += ACOProfile."Comment Bath Card";

                ACOBathSheetHeader."Total Surface Profiles" += ACOBathSheetLine.Surface;
            until ACOBathSheetLine.Next() = 0;

        ACOBathSheetHeader."Bath Sheet Comment" := CopyStr(BathSheetComment, 1, MaxStrLen(ACOBathSheetHeader."Bath Sheet Comment"));
        ACOBathSheetHeader.Modify();
    end;

    local procedure CalculateProcessTimes(var ACOBathSheetHeader: Record "ACO Bath Sheet Header"; ProductionOrderLines: Record "Prod. Order Line")
    var
        ACOAppSetup: Record "ACO App Setup";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        MaxCurrDens: Decimal;
        MinCurrDens: Decimal;
        Str: Decimal;
        Dhd: Decimal;
        BathTime: Decimal;
        TotalSurface: Decimal;
        LayerThickness: Decimal;
        MinAnodiseTime: Decimal;
    begin
        ACOAppSetup.Get();
        ACOAppSetup.TestField("Max. Current Density Bath 1");
        ACOAppSetup.TestField("Max. Current Density Bath 2");
        ACOAppSetup.TestField("Max. Current Density Bath 3");
        ACOAppSetup.TestField("Max. Current Density Bath L");
        ACOAppSetup.TestField("Min. Anodise Time");

        ACOBathSheetLine.SetRange("Bath Sheet No.", ACOBathSheetHeader."No.");
        if ACOBathSheetLine.FindSet() then begin
            MaxCurrDens := ACOBathSheetLine."Maximum Current Density";
            MinCurrDens := ACOBathSheetLine."Minimum Current Density";

            repeat
                if MaxCurrDens <= ACOBathSheetLine."Maximum Current Density" then
                    MaxCurrDens := ACOBathSheetLine."Maximum Current Density";

                if MinCurrDens >= ACOBathSheetLine."Minimum Current Density" then
                    MinCurrDens := ACOBathSheetLine."Minimum Current Density";

            until ACOBathSheetLine.Next() = 0;
        end;

        Str := ACOAppSetup."Max. Current Density Bath 1";

        ACOBathSheetHeader.TestField("Total Surface");

        TotalSurface := ACOBathSheetHeader."Total Surface";
        LayerThickness := ACOBathSheetHeader."Layer Thickness";
        MinAnodiseTime := ACOAppSetup."Min. Anodise Time";

        CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime);
        ACOBathSheetHeader."GSX 1 Dhd." := Dhd;
        ACOBathSheetHeader."GSX 1 Str." := Str;
        // ACOBathSheetHeader."GSX 1 Time" := 0T;
        ACOBathSheetHeader."GSX 1 Time New" := BathTime;

        Str := ACOAppSetup."Max. Current Density Bath 2";
        CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime);
        ACOBathSheetHeader."GSX 2 Dhd." := Dhd;
        ACOBathSheetHeader."GSX 2 Str." := Str;
        // ACOBathSheetHeader."GSX 2 Time" := 0T;
        ACOBathSheetHeader."GSX 2 Time New" := BathTime;

        Str := ACOAppSetup."Max. Current Density Bath 3";
        CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime);

        ACOBathSheetHeader."GSX 3 Dhd." := Dhd;
        ACOBathSheetHeader."GSX 3 Str." := Str;
        // ACOBathSheetHeader."GSX 3 Time" := 0T;
        ACOBathSheetHeader."GSX 3 Time New" := BathTime;

        Str := ACOAppSetup."Max. Current Density Bath L";
        CalculateProcessTimeBath(Dhd, Str, BathTime, TotalSurface, LayerThickness, MinAnodiseTime);

        ACOBathSheetHeader."GSX 4 Dhd." := Dhd;
        ACOBathSheetHeader."GSX 4 Str." := Str;
        // ACOBathSheetHeader."GSX 4 Time" := 0T;
        ACOBathSheetHeader."GSX 4 Time New" := BathTime;

        ACOBathSheetHeader.Modify();
    end;

    local procedure CalculateProcessTimeBath(var CurrDens: Decimal; var Str: Decimal; var BathTime: Decimal; TotalSurface: Decimal; LayerThickness: Decimal; MinAnodiseTime: Decimal)
    begin
        CurrDens := Str / (TotalSurface * 100);
        BathTime := (3 * LayerThickness / CurrDens);

        if BathTime < MinAnodiseTime then begin
            CurrDens := 3 * LayerThickness / MinAnodiseTime;
            BathTime := (3 * LayerThickness / CurrDens);
        end;

        Str := CurrDens * TotalSurface;
    end;
}