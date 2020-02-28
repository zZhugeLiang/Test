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
            column(SalesOrderCaption; SalesOrderCaptionLbl) { }
            // column(SalesOrderNo; FirstACOBathSheetLine."Sales Order No.")
            // {
            // }
            column(SOLineCaption; SOLineCaptionLbl) { }
            // column(SalesOrderLineNo; FirstACOBathSheetLine."Sales Order Line No.")
            // {
            // }     
            column(ProfileCaption; ProfileCaptionLbl) { }
            column(ProfileCode; FirstACOBathSheetLine."Profile Code")
            {
            }
            column(ColorCaption; ColorCaptionLbl) { }
            column(Color; ACOColor.Description)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl) { }
            column(Quantity; FirstACOBathSheetLine.Quantity)
            {
            }
            column(LengthCaption; LengthCaptionLbl) { }
            column(Length; FirstACOBathSheetLine.Length)
            {
            }
            column(ThickCaption; ThickCaptionLbl) { }
            column(ThinCaption; ThinCaptionLbl) { }
            // column(CustomerNameCaption; CustomerCaptionLbl)
            // {
            // }
            // column(CustomerName; FirstACOBathSheetLine."Customer Name")
            // {
            // }
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
            column(ThickStaining; Thick)
            {
            }
            column(ThinStainingCaption; ThinStainingCaptionLbl) { }
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

            trigger OnAfterGetRecord()
            var
                ACOBathSheetLine: Record "ACO Bath Sheet Line";
                ACOProfile: Record "ACO Profile";
                Item: Record Item;
            begin
                MeasureText := DONOTMEASURECaptionLbl;
                HighEndText := '';
                EURASText := '';

                ACOBathSheetLine.SetRange("Bath Sheet No.", "No.");
                if ACOBathSheetLine.FindSet() then
                    repeat
                        if ACOBathSheetLine."High End" then
                            HighEndText := HighEndCaptionLbl;

                        if MeasureText = DONOTMEASURECaptionLbl then
                            if ACOProfile.Get(ACOBathSheetLine."Profile Code") and not ACOProfile."Not Measurable" then
                                MeasureText := MEASURECaptionLbl;
                    until (ACOBathSheetLine.Next() = 0) or ((HighEndText = HighEndCaptionLbl) and (MeasureText = MEASURECaptionLbl));

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
        ItemDescription: Text[50];
        MeasureText: Text;
        HighEndText: Text;
        EURASText: Text;
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
        TMLineCaptionLbl: Label 'TMLine';

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
}
