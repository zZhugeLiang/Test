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
            column(SOLineCaption; SOLineCaptionLbl) { }
            column(ColorCaption; ColorCaptionLbl) { }

            column(QuantityCaption; QuantityCaptionLbl) { }
            column(LengthCaption; LengthCaptionLbl) { }
            column(ThickCaption; ThickCaptionLbl) { }
            column(ThinCaption; ThinCaptionLbl) { }

            column(TreatmentCaption; TreatmentCaptionLbl) { }
            column(TMLineCaption; TMLineCaptionLbl) { }
            column(ProfileCaption; ProfileCaptionLbl) { }
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
            column(Thick; Thick)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ThinStainingCaption; ThinStainingCaptionLbl) { }
            column(Thin; Thin)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalProfileSurfaceCaption; TotalProfileSurfaceCaptionLbl) { }
            column(TotalSurfaceProfiles; "Total Surface Profiles")
            {
                DecimalPlaces = 0 : 2;
            }
            column(SurfaceAttachmentRackCaption; SurfaceAttachmentRackCaptionLbl) { }
            column(SurfaceAttachrack; "Surface Attachrack")
            {
                DecimalPlaces = 0 : 2;
            }
            column(SurfaceAdditionCaption; SurfaceAdditionCaptionLbl) { }
            column(SurfaceAddition; "Surface Addition")
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalSurfaceCaption; TotalSurfaceCaptionLbl) { }
            column(TotalSurface; "Total Surface")
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalQuantityCaption; TotalQuantityCaptionLbl) { }
            column(TotalQuantity; "Total Quantity")
            {
                DecimalPlaces = 0 : 2;
            }
            column(LayerThicknessCaption; LayerThicknessCaptionLbl) { }
            column(LayerThickness; "Layer Thickness")
            {
                DecimalPlaces = 0 : 2;
            }
            column(piecesCaption; piecesCaptionLbl) { }

            column(GSX1Dhd; "GSX 1 Dhd.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX1Str; "GSX 1 Str.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX1TimeNew; "GSX 1 Time New")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX1Time; "GSX 1 Time")
            {
            }
            column(GSX2Dhd; "GSX 2 Dhd.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX2Str; "GSX 2 Str.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX2TimeNew; "GSX 2 Time New")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX2Time; "GSX 2 Time")
            {
            }
            column(GSX3Dhd; "GSX 3 Dhd.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX3Str; "GSX 3 Str.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX3TimeNew; "GSX 3 Time New")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX3Time; "GSX 3 Time")
            {
            }
            column(GSX4Dhd; "GSX 4 Dhd.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX4Str; "GSX 4 Str.")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX4TimeNew; "GSX 4 Time New")
            {
                DecimalPlaces = 0 : 2;
            }
            column(GSX4Time; "GSX 4 Time")
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
            end;
        }
    }

    trigger OnPreReport()
    begin
        User.Get(UserSecurityId());
    end;

    var
        User: Record User;
        MeasureText: Text;
        HighEndText: Text;
        EURASText: Text;
        BathSheetCaptionLbl: Label 'Bath Sheet';
        DateCaptionLbl: Label 'Date';
        SalesOrderCaptionLbl: Label 'Sales Order';
        SOLineCaptionLbl: Label 'SOLine';
        ColorCaptionLbl: Label 'Color';
        QuantityCaptionLbl: Label 'Quantity';
        LengthCaptionLbl: Label 'Length';
        ThickCaptionLbl: Label 'Thick';
        ThinCaptionLbl: Label 'Thin';
        TreatmentCaptionLbl: Label 'Treatment';
        TMLineCaptionLbl: Label 'TMLine';
        ProfileCaptionLbl: Label 'Profile';
        MEASURECaptionLbl: Label 'MEASURE';
        DONOTMEASURECaptionLbl: Label 'DO NOT MEASURE';
        HighEndCaptionLbl: Label 'High End';
        EURASCaptionLbl: Label 'EURAS';
        ThickStainingCaptionLbl: Label 'Thick Staining';
        ThinStainingCaptionLbl: Label 'Thin Staining';
        TotalProfileSurfaceCaptionLbl: Label 'Total Profile Surface';
        SurfaceAttachmentRackCaptionLbl: Label 'Surface Attachment Rack';
        SurfaceAdditionCaptionLbl: Label 'Surface Addition';
        TotalSurfaceCaptionLbl: Label 'Total Surface';
        TotalQuantityCaptionLbl: Label 'Total Quantity';
        LayerThicknessCaptionLbl: Label 'Layer Thickness';
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
