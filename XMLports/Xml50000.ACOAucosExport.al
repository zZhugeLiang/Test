xmlport 50000 "ACO Aucos Export"
{
    Caption = 'Aucos Export';
    Direction = Export;
    TextEncoding = UTF8;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ';';
    TableSeparator = 'NewLine';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ACOBathSheetHeader; "ACO Bath Sheet Header")
            {
                fieldelement(no; ACOBathSheetHeader."No.")
                {
                }
                fieldelement(layerThickness; ACOBathSheetHeader."Layer Thickness")
                {
                }
                textelement(bathSheetComment)
                {
                    trigger OnBeforePassVariable()
                    begin
                        BathSheetComment := CopyStr(ACOBathSheetHeader."Bath Sheet Comment", 1, 40);
                    end;
                }
                fieldelement(totalSurface; ACOBathSheetHeader."Total Surface")
                {
                }
                tableelement(ACOBathSheetLine; "ACO Bath Sheet Line")
                {
                    LinkFields = "Bath Sheet No." = field("No.");
                    LinkTable = ACOBathSheetHeader;
                    MinOccurs = Zero;
                    XmlName = 'bathSheetLine';

                    textelement(commentProfile)
                    {
                        trigger OnBeforePassVariable()
                        var
                            ACOProfile: Record "ACO Profile";
                        begin
                            if ACOProfile.Get(ACOBathSheetLine."Profile Code") then
                                commentProfile := CopyStr(ACOProfile."Comment Bath Card", 1, 40);
                        end;
                    }
                    fieldelement(quantity_Line; ACOBathSheetLine.Quantity)
                    {
                    }
                    fieldelement(length_Line; ACOBathSheetLine.Length)
                    {
                    }
                    fieldelement(circumference_Line; ACOBathSheetLine.Circumference)
                    {
                    }

                    textelement(ablageNo)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                            ACOBathSheetLineAll: Record "ACO Bath Sheet Line";
                            AucosFlush: Boolean;
                        begin
                            if Item.Get(ACOBathSheetLine.Treatment) then
                                ablageNo := 'n/' + Item."ACO Pretreatment";

                            ACOBathSheetLineAll.SetRange("Bath Sheet No.", ACOBathSheetLine."Bath Sheet No.");
                            if ACOBathSheetLineAll.FindSet() then
                                repeat
                                //   if Item.Get(ACOBathSheetLineAll.Treatment) and Item. then

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
                            GSXLLTime := Format(ACOBathSheetHeader."GSX LL Time");
                        end;
                    }

                    textelement(GSXLLStr)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            GSXLLStr := Format(ACOBathSheetHeader."GSX LL Str.");
                        end;
                    }

                    textelement(GSXLLDhd)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            GSXLLDhd := Format(ACOBathSheetHeader."GSX LL Dhd.");
                        end;
                    }

                    textelement(thickStainingTime)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            thickStainingTime := Format(ACOBathSheetHeader.Thick);
                        end;
                    }

                    textelement(thinStainingTime)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            thinStainingTime := Format(ACOBathSheetHeader.Thin);
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
                                        if ACOLayerThickness.Get(Item."ACO Layer Thickness Code") then
                                            CalculatedSealingTime += ACOLayerThickness."mu Value";

                            sealingTime := Format(CalculatedSealingTime);
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


    var
        ACOPasdrofile: Record "ACO Profile";
}
