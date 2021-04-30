report 50000 "ACO Bath Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOBathSheet.rdl';
    Caption = 'Bath Sheet';

    dataset
    {
        dataitem(ACOBathSheetHeader; "ACO Bath Sheet Header")
        {
            column(BathSheetCaption; BathSheetCaptionLbl) { }
            column(BathSheetNo; "No.")
            {
            }
            column(DateCaption; DateCaptionLbl) { }
            column(Creation_Date; Format("Creation Date", 0, '<Day,2>-<Month,2>-<Year4>'))
            {
            }

            column(ThickCaption; ThickCaptionLbl) { }
            column(ThinCaption; ThinCaptionLbl) { }
            column(TreatmentCaption; TreatmentCaptionLbl) { }
            column(Treatment; ItemDescription)
            {
            }
            column(MEASUREText; MEASUREText)
            {
            }
            column(HighEndText; HighEndText)
            {
            }
            column(EURASText; EURASText)
            {
            }
            column(ThickStainingCaption; ThickStainingCaptionLbl) { }
            column(ThinStainingCaption; ThinStainingCaptionLbl) { }
            column(ThickStaining; Thick)
            {
            }
            column(ThinStaining; Thin)
            {
            }
            column(TotalProfileSurfaceCaption; TotalProfileSurfaceCaptionLbl) { }
            column(TotalSurfaceProfiles; "Total Surface Profiles")
            {
            }
            column(SurfaceAttachmentRackCaption; SurfaceAttachmentRackCaptionLbl) { }
            column(SurfaceAttachrack; "Surface Attachrack")
            {
            }
            column(SurfaceAdditionCaption; SurfaceAdditionCaptionLbl) { }
            column(SurfaceAddition; "Surface Addition")
            {
            }
            column(TotalSurfaceCaption; TotalSurfaceCaptionLbl) { }
            column(TotalSurface; "Total Surface")
            {
            }
            column(TotalQuantityCaption; TotalQuantityCaptionLbl) { }
            column(TotalQuantity; "Total Quantity")
            {
            }
            column(LayerThicknessCaption; LayerThicknessCaptionLbl) { }
            column(LayerThickness; "Layer Thickness")
            {
            }
            column(GSX1Caption; GSX1CaptionLbl) { }
            column(GSX2Caption; GSX2CaptionLbl) { }
            column(GSX3Caption; GSX3CaptionLbl) { }
            column(GSXLLCaption; GSXLLCaptionLbl) { }
            column(StrCaption; StrCaptionLbl) { }
            column(DhdCaption; DhdCaptionLbl) { }
            column(TimeCaption; TimeCaptionLbl) { }
            column(piecesCaption; piecesCaptionLbl) { }

            column(GSX1Dhd; "GSX 1 Dhd.")
            {
            }
            column(GSX1Str; "GSX 1 Str.")
            {
            }
            column(GSX1Time; "GSX 1 Time")
            {
            }
            column(GSX2Dhd; "GSX 2 Dhd.")
            {
            }
            column(GSX2Str; "GSX 2 Str.")
            {
            }
            column(GSX2Time; "GSX 2 Time")
            {
            }
            column(GSX3Dhd; "GSX 3 Dhd.")
            {
            }
            column(GSX3Str; "GSX 3 Str.")
            {
            }
            column(GSX3Time; "GSX 3 Time")
            {
            }
            column(GSX4Dhd; "GSX LL Dhd.")
            {
            }
            column(GSX4Str; "GSX LL Str.")
            {
            }
            column(GSX4Time; "GSX LL Time")
            {
            }
            column(NoteCaption; NoteCaptionLbl) { }
            column(BathSheetComment; "Bath Sheet Comment")
            {
            }
            column(ContactPointsOnVisibleSideCaption; ContactPointsOnVisibleSideCaptionLbl) { }
            column(ProfileDamagedCaption; ProfileDamagedCaptionLbl) { }
            column(YESCaption; YESCaptionLbl) { }
            column(NOCaption; NOCaptionLbl) { }
            column(ParaphCaption; ParaphCaptionLbl) { }
            column(PayAttentionCaption; PayAttentionCaptionLbl) { }
            column(PrintingDateCaption; PrintingDateCaptionLbl) { }
            column(PrintingDate; CurrentDateTime())
            {
            }
            column(CreatedbyCaption; CreatedbyCaptioNLbl) { }
            column(CreatedbyUser; User."User Name")
            {
            }
            column(AllComments; AllComments)
            {
            }
            column(ProjectColorDescriptionCaption; ProjectColorDescriptionCaptionLbl) { }
            column(RerunText; RerunText) { }
            dataitem(ACOBathSheetLine; "ACO Bath Sheet Line")
            {
                DataItemLinkReference = ACOBathSheetHeader;
                DataItemLink = "Bath Sheet No." = field("No.");
                column(ProductionOrderStatus; ACOBathSheetLine."Production Order Status")
                {
                }
                column(ProductionOrderNo; ACOBathSheetLine."Production Order No.")
                {
                }
                column(ProductionOrderLineNo; ACOBathSheetLine."Production Order Line No.")
                {
                }
                column(SalesOrderCaption; SalesOrderCaptionLbl) { }
                column(SalesOrderNo; ACOBathSheetLine."Sales Order No.")
                {
                }
                column(SOLineCaption; SOLineCaptionLbl) { }
                column(SalesOrderLineNo; ACOBathSheetLine."Sales Order Line No.")
                {
                }
                column(CustomerNameCaption; CustomerCaptionLbl)
                {
                }
                column(CustomerName; CustomerName)
                {
                }
                column(ProfileCaption; ProfileCaptionLbl) { }
                column(ProfileCode; ACOBathSheetLine."Profile Code")
                {
                }
                column(ColorCaption; ColorCaptionLbl) { }
                column(Color; ACOColor.Description)
                {
                }
                column(QuantityCaption; QuantityCaptionLbl) { }
                column(Quantity; ACOBathSheetLine.Quantity)
                {
                }
                column(LengthCaption; LengthCaptionLbl) { }
                column(Length; ACOBathSheetLine.Length)
                {
                }
                column(ChargeNoCaption; FieldCaption("Charge No.")) { }
                column(ChargeNo; "Charge No.")
                {
                }

                column(Name_ACOProjectColorHeader; ACOProjectColorHeader.Name)
                {
                }
                column(ThickStainingTimeLine; MaxThickStainingTime)
                {
                }
                column(ThinStainingTimeLine; MinThinStainingTime)
                {
                }
                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    Customer: Record Customer;
                    SalesLine: Record "Sales Line";
                    ACOBathSheetMgt: Codeunit "ACO Bath Sheet Mgt.";
                begin
                    MaxThickStainingTime := -1;
                    MinThinStainingTime := 99999;
                    if not Item.Get("Treatment") then
                        Clear(Item);

                    ItemDescription := Item.Description;

                    if not ACOColor.Get(Color) then
                        Clear(ACOColor);

                    Clear(SalesLine);
                    Clear(ACOProjectColorHeader);

                    if SalesLine.Get(SalesLine."Document Type"::Order, ACOBathSheetLine."Sales Order No.", ACOBathSheetLine."Sales Order Line No.") then
                        if not ACOProjectColorHeader.Get(SalesLine."ACO Project Color Code") then
                            Clear(ACOProjectColorHeader);

                    if not Customer.Get(ACOBathSheetLine."Customer No.") then
                        Clear(Customer);

                    CustomerName := Customer.Name;

                    ACOBathSheetMgt.DetermineStainingTimes(SalesLine, MinThinStainingTime, MaxThickStainingTime, Customer);

                    if MaxThickStainingTime = -1 then
                        MaxThickStainingTime := 0;

                    if MinThinStainingTime = 99999 then
                        MinThinStainingTime := 0;
                end;
            }

            trigger OnAfterGetRecord()
            var
                ACOBathSheetLine: Record "ACO Bath Sheet Line";
                ACOProfile: Record "ACO Profile";
                Customer: Record Customer;
                TempACOProfile: Record "ACO Profile" temporary;
                TempCustomer: Record Customer temporary;
                Item: Record Item;
                CRLF: Text[2];
            begin
                MeasureText := DONOTMEASURECaptionLbl;
                HighEndText := '';
                EURASText := '';
                AllComments := '';
                RerunText := '';

                CRLF[1] := 13;
                CRLF[2] := 10;

                AllComments += ACOBathSheetHeader."Bath Sheet Comment";

                ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
                if ACOBathSheetLine.FindSet() then
                    repeat
                        if not TempCustomer.Get(ACOBathSheetLine."Customer No.") then
                            if Customer.Get(ACOBathSheetLine."Customer No.") and (Customer."ACO Comment Bath Card" <> '') then begin
                                TempCustomer."No." := Customer."No.";
                                TempCustomer."ACO Comment Bath Card" := Customer."ACO Comment Bath Card";
                                TempCustomer.Insert();
                            end;

                        if ACOBathSheetLine."High End" then
                            HighEndText := HighEndCaptionLbl;

                        if ACOProfile.Get(ACOBathSheetLine."Profile Code") then begin
                            if not TempACOProfile.Get(ACOBathSheetLine."Profile Code") and (ACOProfile."Comment Bath Card" <> '') then begin
                                TempACOProfile."Code" := ACOProfile."Code";
                                TempACOProfile."Comment Bath Card" := ACOProfile."Comment Bath Card";
                                TempACOProfile.Insert();
                            end;

                            if MeasureText = DONOTMEASURECaptionLbl then
                                if not ACOProfile."Not Measurable" then
                                    MeasureText := MEASURECaptionLbl;
                        end;
                        if RerunText = '' then
                            if ACOBathSheetLine.Rerun then
                                RerunText := RerunCaptionLbl;
                    until (ACOBathSheetLine.Next() = 0) or ((HighEndText = HighEndCaptionLbl) and (MeasureText = MEASURECaptionLbl));

                if TempCustomer.FindSet() then
                    repeat
                        AllComments += ',' + TempCustomer."ACO Comment Bath Card";
                    until TempCustomer.Next() = 0;

                if TempACOProfile.FindSet() then
                    repeat
                        AllComments += ',' + TempACOProfile."Comment Bath Card";
                    until TempACOProfile.Next() = 0;

                if (AllComments[1] = ',') and (StrLen(AllComments) > 1) then
                    AllComments := CopyStr(AllComments, 2, StrLen(AllComments) - 1);

                if Euras then
                    EURASText := EURASCaptionLbl;

                FirstACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
                if not FirstACOBathSheetLine.FindFirst() then
                    Clear(FirstACOBathSheetLine);

                if not Item.Get(FirstACOBathSheetLine."Treatment") then
                    Clear(Item);

                ItemDescription := Item.Description;

                if not ACOColor.Get(FirstACOBathSheetLine.Color) then
                    Clear(ACOColor);
            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
    end;

    var
        User: Record User;
        FirstACOBathSheetLine: Record "ACO Bath Sheet Line";
        ACOColor: Record "ACO Color";
        ACOProjectColorHeader: Record "ACO Project Color Header";
        CustomerName: Text[100];
        ItemDescription: Text[100];
        MeasureText: Text;
        HighEndText: Text;
        EURASText: Text;
        AllComments: Text;
        RerunText: Text;
        MaxThickStainingTime: Decimal;
        MinThinStainingTime: Decimal;
        BathSheetCaptionLbl: Label 'Bath Sheet';
        DateCaptionLbl: Label 'Date';
        SalesOrderCaptionLbl: Label 'Sales Order';
        SOLineCaptionLbl: Label 'SOLine';
        ProfileCaptionLbl: Label 'Profile';
        ColorCaptionLbl: Label 'Color';
        QuantityCaptionLbl: Label 'Quantity';
        LengthCaptionLbl: Label 'Length';
        ThickCaptionLbl: Label 'Thick';
        ThinCaptionLbl: Label 'Thin';
        CustomerCaptionLbl: Label 'Customer';
        TreatmentCaptionLbl: Label 'Treatment';
        MEASURECaptionLbl: Label 'M E A S U R E';
        DONOTMEASURECaptionLbl: Label 'D O  N O T  M E A S U R E';
        HighEndCaptionLbl: Label 'High End';
        EURASCaptionLbl: Label 'E U R A S';
        ThickStainingCaptionLbl: Label 'Thick Staining';
        ThinStainingCaptionLbl: Label 'Thin Staining';
        TotalProfileSurfaceCaptionLbl: Label 'Total Profile Surface';
        SurfaceAttachmentRackCaptionLbl: Label 'Surface Attachment Rack';
        SurfaceAdditionCaptionLbl: Label 'Surface Addition';
        TotalSurfaceCaptionLbl: Label 'Total Surface';
        TotalQuantityCaptionLbl: Label 'Total Quantity';
        LayerThicknessCaptionLbl: Label 'Layer Thickness';
        GSX1CaptionLbl: Label 'GSX 1';
        GSX2CaptionLbl: Label 'GSX 2';
        GSX3CaptionLbl: Label 'GSX 3';
        GSXLLCaptionLbl: Label 'GSX LL';
        StrCaptionLbl: Label 'Str.';
        DhdCaptionLbl: Label 'Dhd';
        TimeCaptionLbl: Label 'Time';
        piecesCaptionLbl: Label 'pieces';
        PayAttentionCaptionLbl: Label 'Pay attention';
        NoteCaptionLbl: Label 'Note';
        ContactPointsOnVisibleSideCaptionLbl: Label 'Contact points on visible side';
        ProfileDamagedCaptionLbl: Label 'Profile damaged?';
        YESCaptionLbl: Label 'YES';
        NOCaptionLbl: Label 'NO';
        ParaphCaptionLbl: Label 'Paraph';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
        ProjectColorDescriptionCaptionLbl: Label 'Project Color Description';
        RerunCaptionLbl: Label 'Rerun';

}
