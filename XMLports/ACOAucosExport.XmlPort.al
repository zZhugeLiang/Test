xmlport 50000 "ACO Aucos Export"
{
    Caption = 'Aucos Export';
    Direction = Export;

    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';
    RecordSeparator = '<NewLine>';
    TableSeparator = ',';
    TextEncoding = WINDOWS;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ACOBathSheetHeader; "ACO Bath Sheet Header")
            {

                tableelement(ACOBathSheetLine; "ACO Bath Sheet Line")
                {
                    LinkFields = "Bath Sheet No." = field("No.");
                    LinkTable = ACOBathSheetHeader;
                    MinOccurs = Zero;
                    XmlName = 'bathSheetLine';

                    fieldelement(no; ACOBathSheetHeader."No.")
                    {
                    }
                    textelement(layerThickness)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            layerThickness := Format(Round(ACOBathSheetHeader."Layer Thickness", 1));
                        end;
                    }
                    textelement(bathSheetComment)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            bathSheetComment := CopyStr(ACOBathSheetHeader."Bath Sheet Comment", 1, 40);
                        end;
                    }
                    textelement(profileComment)
                    {
                        trigger OnBeforePassVariable()
                        var
                            ACOProfile: Record "ACO Profile";
                        begin
                            if ACOProfile.Get(ACOBathSheetLine."Profile Code") then
                                profileComment := CopyStr(ACOProfile."Comment Bath Card", 1, 40);
                        end;
                    }
                    textelement(totalSurface)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            totalSurface := FormatAndRound(ACOBathSheetHeader."Total Surface" / 100);
                        end;
                    }

                    fieldelement(profileCode; ACOBathSheetLine."Profile Code")
                    {

                    }

                    textelement(profileDescription)
                    {
                        trigger OnBeforePassVariable()
                        var
                            ACOProfile: Record "ACO Profile";
                        begin
                            if ACOProfile.Get(ACOBathSheetLine."Profile Code") then
                                profileDescription := CopyStr(ACOProfile."Description", 1, 40);
                        end;
                    }
                    textelement(quantity_Line)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            quantity_Line := FormatAndRound(ACOBathSheetLine.Quantity);
                        end;
                    }
                    textelement(length_Line)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            length_Line := FormatAndRound(ACOBathSheetLine.Length);
                        end;
                    }
                    textelement(circumference_Line)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            circumference_Line := FormatAndRound(ACOBathSheetLine.Circumference);
                        end;
                    }

                    textelement(ablageNo)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                            ACOBathSheetLineAll: Record "ACO Bath Sheet Line";
                            ACOProfile: Record "ACO Profile";
                            AucosFlush: Boolean;
                        begin
                            if Item.Get(ACOBathSheetLine.Treatment) then
                                ablageNo := 'n/' + Item."ACO Pretreatment";

                            ACOBathSheetLineAll.SetRange("Bath Sheet No.", ACOBathSheetLine."Bath Sheet No.");
                            if ACOBathSheetLineAll.FindSet() then
                                repeat
                                    if ACOProfile.Get(ACOBathSheetLine."Profile Code") and ACOProfile."Extra Flushing" then
                                        AucosFlush := true;
                                until ACOBathSheetLineAll.Next() = 0;

                            if AucosFlush then
                                ablageNo += 's';
                            // if Item.Get(ACOBathSheetLine.Treatment) then
                            //     ablageNo := Item."ACO Pretreatment";
                        end;
                    }

                    textelement(itemPretreatment)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                        begin
                            if Item.Get(ACOBathSheetLine.Treatment) then
                                itemPretreatment := Item."ACO Pretreatment";
                        end;
                    }

                    fieldelement(color; ACOBathSheetLine."Color")
                    {
                    }

                    textelement(itemDescription)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                        begin
                            if Item.Get(ACOBathSheetLine.Treatment) then
                                itemDescription := Item.Description;
                        end;
                    }

                    textelement(GSXLLTime)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            GSXLLTime := FormatAndRound(ACOBathSheetHeader."GSX LL Time");
                        end;
                    }

                    textelement(GSXLLStr)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            GSXLLStr := FormatAndRound(ACOBathSheetHeader."GSX LL Str.");
                        end;
                    }

                    textelement(GSXLLDhd)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            GSXLLDhd := FormatAndRound(ACOBathSheetHeader."GSX LL Dhd.");
                        end;
                    }

                    textelement(thickStainingTime)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            thickStainingTime := FormatAndRound(ACOBathSheetHeader.Thick);
                        end;
                    }

                    textelement(thinStainingTime)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            thinStainingTime := FormatAndRound(ACOBathSheetHeader.Thin);
                        end;
                    }

                    textelement(sealingTime)
                    {

                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                            ACOAppSetup: Record "ACO App Setup";
                            ACOPretreatment: Record "ACO Pretreatment";
                            ACOLayerThickness: Record "ACO Layer Thickness";
                            CalculatedSealingTime: Decimal;
                        begin
                            ACOAppSetup.Get();
                            CalculatedSealingTime := ACOAppSetup."Aucos Seal Time";

                            if Item.Get(ACOBathSheetLine.Treatment) then
                                if ACOPretreatment.Get(Item."ACO Pretreatment") then
                                    if not ACOPretreatment."Aucos Sealing Time" then
                                        if ACOLayerThickness.Get(Item."ACO Layer Thickness Code") then begin
                                            CalculatedSealingTime := ACOAppSetup."Aucos Sealconstant" + (ACOLayerThickness."mu Value" * 3);
                                        end;

                            sealingTime := FormatAndRound(CalculatedSealingTime);
                        end;
                    }
                    // tableelement(ACOProfile; "ACO Profile")
                    // {
                    //     LinkFields = Code = field("Profile Code");
                    //     LinkTable = ACOBathSheetLine;
                    //     MinOccurs = Zero;
                    //     XmlName = 'profile';

                    //     fieldelement(commentBathCard; ACOProfile."Comment Bath Card")

                    //     {
                    //     }
                    // }

                }

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
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }


    trigger OnPostXmlPort()
    begin
        currXMLport.Filename := 'AucosExport' + '.csv';
    end;


    local procedure FormatAndRound(InputDec: Decimal): Text
    begin
        exit(Format(Round(InputDec, 0.000001), 0, 1));
    end;
}
