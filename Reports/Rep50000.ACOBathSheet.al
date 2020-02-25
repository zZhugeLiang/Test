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
            column(Creation_Date; "Creation Date")
            {
            }
            column(SalesOrderCaption; SalesOrderCaptionLbl) { }
            column(SOLineCaption; SOLineCaptionLbl) { }
            column(ColorCaption; ColorCaptionLbl) { }

            column(QuantityCaption; QuantityCaptionLbl) { }
            column(LengthCaption; LengthCaptionLbl) { }
            column(ThickCaption; ThickCaptionLbl) { }
            column(Thick; Thick)
            {
            }
            column(ThinCaption; ThinCaptionLbl) { }
            column(Thin; Thin)
            {
            }
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
            column(ThinStainingCaption; ThinStainingCaptionLbl) { }
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
            column(piecesCaption; piecesCaptionLbl) { }

            column(GSX1Dhd; "GSX 1 Dhd.")
            {
            }
            column(GSX1Str; "GSX 1 Str.")
            {
            }
            column(GSX1TimeNew; "GSX 1 Time New")
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
            column(GSX2TimeNew; "GSX 2 Time New")
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
            column(GSX3TimeNew; "GSX 3 Time New")
            {
            }
            column(GSX3Time; "GSX 3 Time")
            {
            }
            column(GSX4Dhd; "GSX 4 Dhd.")
            {
            }
            column(GSX4Str; "GSX 4 Str.")
            {
            }
            column(GSX4TimeNew; "GSX 4 Time New")
            {
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
            column(CreatedbyUser; UserId())
            {
            }
        }
    }

    var
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
        ProfileDamagedCaptionLbl: Label 'Profile damaged';
        YESCaptionLbl: Label 'YES';
        NOCaptionLbl: Label 'NO';
        ParaphCaptionLbl: Label 'Paraph';
        PrintingDateCaptionLbl: Label 'Printing Date';
        CreatedbyCaptionLbl: Label 'Created by';
}
