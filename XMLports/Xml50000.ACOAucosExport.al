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
                fieldelement(No; ACOBathSheetHeader."No.")
                {
                }
                fieldelement(LayerThickness; ACOBathSheetHeader."Layer Thickness")
                {
                }
                fieldelement(BathSheetComment; ACOBathSheetHeader."Bath Sheet Comment")
                {
                }
                fieldelement(TotalSurface; ACOBathSheetHeader."Total Surface")
                {
                }



                tableelement(ACOBathSheetLine; "ACO Bath Sheet Line")
                {
                    LinkFields = "Bath Sheet No." = field("No.");
                    LinkTable = ACOBathSheetHeader;
                    MinOccurs = Zero;
                    XmlName = 'bathSheetLine';

                    fieldelement(profileCode_Line; ACOBathSheetLine."Profile Code")
                    {
                    }
                    fieldelement(profileDescription_Line; ACOBathSheetLine."Profile Description")
                    {
                        trigger OnBeforePassField()
                        var
                            asd: Decimal;
                        begin
                            ACOBathSheetLine."Profile Description" := CopyStr(ACOBathSheetLine."Profile Description", 1, 40)
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
                    fieldelement(profileCode_Line; ACOBathSheetLine.Color)
                    {
                    }
                    fieldelement(profileCode_Line; ACOBathSheetLine."Profile Code")
                    {
                    }

                    textelement(ContExcludefromSegmentTitle)
                    {

                        trigger OnBeforePassVariable()
                        begin
                            // ContExcludefromSegmentTitle := Contact.FieldCaption("Exclude from Segment");
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
