page 50056 "ACO Generate Package Dialog"
{

    Caption = ' Generate Package Dialog';
    PageType = StandardDialog;
    //SourceTable = "";

    layout
    {
        area(content)
        {
            group(Options)
            {
                field(Resource; _Resource)
                {
                    Caption = 'Resource';
                    ApplicationArea = Suite;
                    TableRelation = Resource."No.";
                    ToolTip = ' ';
                }
                field(PackageType; _Packagetype)
                {
                    OptionCaption = 'Box,Bundle,Carton,Cart,Chest,Tube,Empty racks,Pack,Pallet,Rack';
                    ApplicationArea = Suite;
                    ToolTip = ' ';
                }
                field("Rack No."; "_RackNo.")
                {
                    Caption = 'Rack No.';
                    ApplicationArea = Suite;
                    Visible = _RackNoVisible;
                    ToolTip = ' ';
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
