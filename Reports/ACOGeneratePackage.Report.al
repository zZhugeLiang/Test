report 50002 "ACO Generate Package"
{
    ProcessingOnly = true;
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Resource; _Resource)
                    {
                        ApplicationArea = Suite;
                        TableRelation = Resource."No.";
                    }
                    field(PackageType; _Packagetype)
                    {
                        OptionCaption = 'Box,Bundle,Carton,Cart,Chest,Tube,Empty racks,Pack,Pallet,Rack';
                        ApplicationArea = Suite;
                    }
                    field("Rack No."; "_RackNo.")
                    {
                        ApplicationArea = Suite;
                        Visible = _RackNoVisible;
                    }
                }
            }
        }


    }
    procedure setRackNoVisible(Visible: Boolean)
    begin
        _RackNoVisible := Visible;
    end;

    procedure getResource(): Code[20]
    begin
        exit(_Resource);
    end;

    procedure getPackageType(): Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack
    begin
        exit(_Packagetype);
    end;

    procedure getRackNo(): Text
    begin
        exit("_RackNo.");
    end;

    var

        _Resource: Code[20];
        _Packagetype: Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
        "_RackNo.": Text;
        _RackNoVisible: Boolean;
}
