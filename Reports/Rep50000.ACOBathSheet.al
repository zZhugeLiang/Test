report 50000 "ACO Bath Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOBathSheet.rdl';
    Caption = 'Bath Sheet';

    dataset
    {
        dataitem(ACOBathSheetHeader; "ACO Bath Sheet Header")
        {
            column(No; "No.")
            {
            }
            column(Thick; Thick)
            {
            }
            column(Thin; Thin)
            {
            }
            column(TotalSurfaceProfiles; "Total Surface Profiles")
            {
            }
            column(SurfaceAttachrack; "Surface Attachrack")
            {
            }
            column(SurfaceAddition; "Surface Addition")
            {
            }
            column(TotalSurface; "Total Surface")
            {
            }
            column(TotalQuantity; "Total Quantity")
            {
            }
            column(LayerThickness; "Layer Thickness")
            {
            }
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
            column(BathSheetComment; "Bath Sheet Comment")
            {
            }
        }
    }



    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(FilterString; FilterString)
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        var
                            Resource: Record Resource;
                            ACOSheetResource: Record "ACO Bath Sheet Resource";
                        begin
                            Resource.SetFilter("No.", FilterString);
                            if Resource.FindSet() then
                                repeat
                                    ACOSheetResource."Bath Sheet No." := BathSheetNo;
                                    ACOSheetResource."Resource No." := Resource."No.";
                                    ACOSheetResource.Insert();
                                until Resource.Next() = 0;
                        end;
                    }
                }
            }
        }
    }

    trigger OnPostReport()
    var
        myInt: Integer;
    begin

    end;

    var
        Resource: Record Resource;
        BathSheetNo: Code[20];
        FilterString: Text;
}
