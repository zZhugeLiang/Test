codeunit 50002 "ACO Bath Sheet Mgt."
{

    procedure CreateBathSheet(var ProductionOrderLines: Record "Prod. Order Line"; var Resource: Record Resource)
    var
        ACOBathSheetHeader: Record "ACO Bath Sheet Header";
    begin
        GetAppSetupAndCheckFields();
        // CheckResourceFilter(ResourceFilter);

        CheckProductionLines(ProductionOrderLines);

        CreateBathSheetHeader(ACOBathSheetHeader, ProductionOrderLines);
        CreateBathSheetLines(ACOBathSheetHeader."No.", ProductionOrderLines);

        ACOBathSheetHeader.UpdateBathSheetHeader();
        // CalculateProcessTimes(ACOBathSheetHeader, ProductionOrderLines);
        //CompleteBathSheet(ProductionOrderLines);
        // ProductionOrderLines.SetRange("ACO Included", true);
        ProductionOrderLines.ModifyAll("ACO Complete", true);
        ProductionOrderLines.ModifyAll("Quantity", 0);
        // how to make it so that the line is processed?
        // ProductionOrderLines.ModifyAll("ACO Included", false);

        InsertResources(ACOBathSheetHeader."No.", Resource)
    end;

    // 1. Get Setup and Check Fields
    local procedure GetAppSetupAndCheckFields()
    begin
        ACOAppSetup.Get();
        ACOAppSetup.TestField("Max. Current Density Bath 1");
        ACOAppSetup.TestField("Max. Current Density Bath 2");
        ACOAppSetup.TestField("Max. Current Density Bath 3");
        ACOAppSetup.TestField("Max. Current Density Bath L");
        ACOAppSetup.TestField("Min. Anodise Time");
    end;

    // 2. Check Production Lines
    local procedure CheckProductionLines(var ProductionOrderLines: Record "Prod. Order Line"): Boolean;
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
        // ProductionOrderLines.SetRange("ACO Included", true);
        if ProductionOrderLines.FindSet() then
            repeat
                if ProductionOrderLines."Variant Code" = '' then
                    Error(VariantCodeEmptyErr, ProductionOrderLines."ACO Charge No.");
                if ProductionOrderLines."ACO Quantity to Bath Sheet" = 0 then
                    Error(QuantityToBathSheetZeroErr, ProductionOrderLines."ACO Charge No.");
                if ProductionOrderLines."ACO Charge No." = '' then
                    Error(ChargeNoEmptyErr, ProductionOrderLines."Prod. Order No." + ' ' + Format(ProductionOrderLines."Line No."));

                if ChargeNo <> ProductionOrderLines."ACO Charge No." then begin
                    ChargeCount += 1;
                    ColorCode := '';
                end;

                if ChargeCount > 2 then
                    Error(Max2ChargesErr);

                ChargeNo := ProductionOrderLines."ACO Charge No.";

                if Item.Get(ProductionOrderLines."Item No.") then begin
                    if (ColorCode <> '') and (ColorCode <> Item."ACO Color") then
                        Error(ColorCodeNotIdenticalErr, ChargeNo);
                    ColorCode := Item."ACO Color";
                end;
            until ProductionOrderLines.Next() = 0;
    end;

    local procedure CreateBathSheetHeader(var ACOBathSheetHeader: Record "ACO Bath Sheet Header"; var ProductionOrderLines: Record "Prod. Order Line")
    var
        ACOProfile: Record "ACO Profile";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
        PreviousSourceNo: Code[20];
        CurrentSourceNo: Code[20];
        TotalCircumference: Decimal;
        MaxThickStainingTime: Decimal;
        MinThinStainingTime: Decimal;
        PreviousMinThinStainingTime: Decimal;
        PreviousMaxThickStainingTime: Decimal;
        First: Boolean;
        Measure: Boolean;
    begin
        // ProductionOrderLines.SetRange("ACO Included", true);
        First := true;
        Measure := true;
        MaxThickStainingTime := -1;
        MinThinStainingTime := 99999;
        PreviousMaxThickStainingTime := -1;
        PreviousMinThinStainingTime := 99999;

        if ProductionOrderLines.FindSet() then
            repeat
                if First then begin
                    if ACOProfile.Get(ProductionOrderLines."ACO Profile Code") then //begin
                        ACOBathSheetHeader."Bath Sheet Comment" := ACOProfile."Comment Bath Card";
                    SalesHeader.Get(SalesHeader."Document Type"::Order, ProductionOrderLines."ACO Source No.");
                    Customer.Get(SalesHeader."Sell-to Customer No.");
                    ACOBathSheetHeader."Note Bath Sheet" := Customer."ACO Comment Bath Card";

                    First := false;
                end;

                CurrentSourceNo := ProductionOrderLines."ACO Source No.";
                if SalesLine.Get(SalesLine."Document Type"::Order, ProductionOrderLines."ACO Source No.", ProductionOrderLines."ACO Source Line No.") then begin
                    TotalCircumference += SalesLine."ACO Profile Circumference";
                    DetermineStainingTimes(SalesLine, MinThinStainingTime, MaxThickStainingTime, Customer);

                    if ((PreviousMinThinStainingTime <> MinThinStainingTime) and (PreviousMinThinStainingTime <> 99999)) or ((PreviousMaxThickStainingTime <> MaxThickStainingTime) and (PreviousMaxThickStainingTime <> -1)) then begin
                        ACOAppSetup.Get();
                        ACOBathSheetHeader."Bath Sheet Comment" := ACOAppSetup."Multiple Staining Times Text";
                    end;

                    PreviousMaxThickStainingTime := MaxThickStainingTime;
                    PreviousMinThinStainingTime := MinThinStainingTime;

                    if SalesLine."ACO Euras Profile" then
                        ACOBathSheetHeader.Euras := true;

                    if SalesLine."ACO Project Color Code" <> '' then
                        ACOBathSheetHeader."Color Measurement" := true;

                    if SalesLine."ACO Not Measurable" then
                        Measure := false;
                end;

                if PreviousSourceNo <> CurrentSourceNo then begin
                    SalesHeader.Get(SalesHeader."Document Type"::Order, CurrentSourceNo);
                    if not ACOBathSheetHeader.Euras then
                        if SalesHeader."ACO Euras" then
                            ACOBathSheetHeader.Euras := true;
                end;

                PreviousSourceNo := CurrentSourceNo;
            until ProductionOrderLines.Next() = 0;

        if MaxThickStainingTime = -1 then
            MaxThickStainingTime := 0;

        if MinThinStainingTime = 99999 then
            MinThinStainingTime := 0;

        ACOBathSheetHeader.Thick := MaxThickStainingTime;
        ACOBathSheetHeader.Thin := MinThinStainingTime;
        ACOBathSheetHeader.Measure := Measure;
        ACOBathSheetHeader.Circumference := TotalCircumference;
        ACOBathSheetHeader.Insert(true);
    end;

    procedure DetermineStainingTimes(SalesLine: Record "Sales Line"; var MinThinStainingTime: Decimal; var MaxThickStainingTime: Decimal; Customer: Record Customer)
    var
        SalesHeader: Record "Sales Header";
        ACOProfileCustomer: Record "ACO Profile Customer";
        Item: Record Item;
        ACOPretreatment: Record "ACO Pretreatment";
    begin
        if Item.Get(SalesLine."No.") then
            if ACOPretreatment.Get(Item."ACO Pretreatment") then begin
                if ACOPretreatment."Thick Staining Time" <> -1 then
                    if ACOPretreatment."Thick Staining Time" >= MaxThickStainingTime then
                        MaxThickStainingTime := ACOPretreatment."Thick Staining Time";

                if ACOPretreatment."Thin Staining Time" <> -1 then
                    if ACOPretreatment."Thin Staining Time" <= MinThinStainingTime then
                        MinThinStainingTime := ACOPretreatment."Thin Staining Time";
            end;

        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        ACOProfileCustomer.SetRange("Profile Code", SalesLine."ACO Profile Code");
        ACOProfileCustomer.SetRange("Customer No.", Customer."No.");
        if ACOProfileCustomer.FindFirst() then begin
            if ACOPretreatment."Thick Staining Time" = -1 then
                if ACOProfileCustomer."Thick Staining Time" >= MaxThickStainingTime then
                    MaxThickStainingTime := ACOProfileCustomer."Thick Staining Time";
            if ACOPretreatment."Thin Staining Time" = -1 then
                if ACOProfileCustomer."Thin Staining Time" <= MinThinStainingTime then
                    MinThinStainingTime := ACOProfileCustomer."Thin Staining Time";
        end;
    end;

    local procedure CreateBathSheetLines(ACOBathSheetHeaderNo: Code[20]; var ProductionOrderLines: Record "Prod. Order Line")
    var
        LineNo: Integer;
    begin
        LineNo := 10000;
        if ProductionOrderLines.FindSet(true) then
            repeat
                CreateBathSheetLine(ACOBathSheetHeaderNo, ProductionOrderLines, LineNo);
                LineNo += 10000;
            until ProductionOrderLines.Next() = 0;
    end;

    local procedure CreateBathSheetLine(ACOBathSheetHeaderNo: Code[20]; ProductionOrderLine: Record "Prod. Order Line"; var LineNo: Integer)
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ACOBathSheetLine: Record "ACO Bath Sheet Line";
        ItemVariant: Record "Item Variant";
        MinCurrentDensity: Decimal;
        MaxCurrentDensity: Decimal;
        NumberofUnitsLtQuantityToBathSheetErr: Label 'Remaining Quantity cannot be less than Quantity to Bath Sheet.';
    begin
        SalesHeader.Get(SalesHeader."Document Type"::Order, ProductionOrderLine."ACO Source No.");
        SalesLine.Get(SalesLine."Document Type"::Order, ProductionOrderLine."ACO Source No.", ProductionOrderLine."ACO Source Line No.");
        LineNo := LineNo;  // Dummy Regel -> AUB Oplossen als je hier bij uit komt, LineNo wordt niet meer gebruikt? <-- 
        if not ProductionOrderLine."ACO Rerun" then
            if ProductionOrderLine."ACO Remaining Quantity" < ProductionOrderLine."ACO Quantity to Bath Sheet" then
                Error(NumberofUnitsLtQuantityToBathSheetErr);

        ACOBathSheetLine."Bath Sheet No." := ACOBathSheetHeaderNo;
        ACOBathSheetLine."Production Order Status" := ProductionOrderLine.Status.AsInteger();
        ACOBathSheetLine."Production Order No." := ProductionOrderLine."Prod. Order No.";
        ACOBathSheetLine."Production Order Line No." := ProductionOrderLine."Line No.";
        ACOBathSheetLine."Sales Order No." := ProductionOrderLine."ACO Source No.";
        ACOBathSheetLine."Sales Order Line No." := ProductionOrderLine."ACO Source Line No.";

        ACOBathSheetLine."Customer No." := SalesHeader."Sell-to Customer No.";
        ACOBathSheetLine.Quantity := ProductionOrderLine."ACO Quantity to Bath Sheet";
        ACOBathSheetLine."Remaining Quantity" := ACOBathSheetLine.Quantity;
        ACOBathSheetLine."Profile Code" := ProductionOrderLine."ACO Profile Code";
        ACOBathSheetLine."Charge No." := ProductionOrderLine."ACO Charge No.";
        ACOBathSheetLine.Rerun := ProductionOrderLine."ACO Rerun";
        ACOBathSheetLine."Rerun Reason" := ProductionOrderLine."ACO Rerun Reason";
        ACOBathSheetLine.Color := SalesLine."ACO Color";

        if SalesLine.Type = SalesLine.Type::Item then // is deze regel nodig?
            ACOBathSheetLine.Treatment := SalesLine."No.";

        DetermineCurrentDensities(SalesLine, MinCurrentDensity, MaxCurrentDensity);
        ACOBathSheetLine."Minimum Current Density" := MinCurrentDensity;
        ACOBathSheetLine."Maximum Current Density" := MaxCurrentDensity;

        ACOBathSheetLine.Circumference := SalesLine."ACO Profile Circumference";
        if ItemVariant.Get(ProductionOrderLine."Item No.", ProductionOrderLine."Variant Code") then
            ACOBathSheetLine.Length := Round(ItemVariant."ACO Number of Meters" * 1000, 1);

        ACOBathSheetLine.CalculateSurface();
        ACOBathSheetLine."High End" := SalesLine."ACO High End";
        ACOBathSheetLine.Insert();

        ProductionOrderLine."ACO Remaining Quantity" := ProductionOrderLine."ACO Remaining Quantity" - ProductionOrderLine."ACO Quantity to Bath Sheet";
        ProductionOrderLine."ACO Quantity to Bath Sheet" := ProductionOrderLine."ACO Remaining Quantity";
        ProductionOrderLine.Modify();
    end;

    procedure DetermineCurrentDensities(SalesLine: Record "Sales Line"; var MinCurrentDensity: Decimal; var MaxCurrentDensity: Decimal)
    var
        ACOProfileCustomer: Record "ACO Profile Customer";
        CheckProfileCustomer: Boolean;
    begin
        ACOProfileCustomer.SetRange("Profile Code", SalesLine."ACO Profile Code");
        ACOProfileCustomer.SetRange("Customer No.", SalesLine."Sell-to Customer No.");
        CheckProfileCustomer := ACOProfileCustomer.FindFirst();

        MinCurrentDensity := 0;
        if SalesLine."ACO Min. Current Density Color" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Min. Current Density Color";
        if SalesLine."ACO Minimum Current Density LT" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Minimum Current Density LT";
        if SalesLine."ACO Minimum Current Density PT" >= MinCurrentDensity then
            MinCurrentDensity := SalesLine."ACO Minimum Current Density PT";
        if CheckProfileCustomer then
            if ACOProfileCustomer."Minimum Current Density" >= MinCurrentDensity then
                MinCurrentDensity := ACOProfileCustomer."Minimum Current Density";

        MaxCurrentDensity := 1000;
        CheckMaximumCurrentDensity(MaxCurrentDensity, SalesLine."ACO Max. Current Density Color");
        CheckMaximumCurrentDensity(MaxCurrentDensity, SalesLine."ACO Maximum Current Density LT");
        CheckMaximumCurrentDensity(MaxCurrentDensity, SalesLine."ACO Maximum Current Density PT");
        CheckMaximumCurrentDensity(MaxCurrentDensity, SalesLine."ACO Max. Cur. Density Category");
        if CheckProfileCustomer then
            CheckMaximumCurrentDensity(MaxCurrentDensity, ACOProfileCustomer."Maximum Current Density");
    end;

    local procedure CheckMaximumCurrentDensity(var MaxCurrentDensity: Decimal; CurrentDensity: Decimal)
    begin
        if (CurrentDensity > 0) and (CurrentDensity <= MaxCurrentDensity) then
            MaxCurrentDensity := CurrentDensity;
    end;

    local procedure InsertResources(BathSheetNo: Code[20]; var Resource: Record Resource)
    var
        ACOSheetResource: Record "ACO Bath Sheet Resource";
    begin
        if Resource.FindSet() then
            repeat
                ACOSheetResource."Bath Sheet No." := BathSheetNo;
                ACOSheetResource."Resource No." := Resource."No.";
                ACOSheetResource.Insert();
            until Resource.Next() = 0
    end;

    var
        ACOAppSetup: Record "ACO App Setup";
}