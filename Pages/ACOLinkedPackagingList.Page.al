page 50034 "ACO Linked Packaging List"
{

    PageType = List;
    SourceTable = "ACO Linked Packaging";
    Caption = 'Packaging List';
    UsageCategory = None;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field("Length"; "Length")
                {
                    ApplicationArea = All;
                }
                field("Packaging Type Code"; "Packaging Type Code")
                {
                    ApplicationArea = All;
                }
                field(Width; Width)
                {
                    ApplicationArea = All;
                }
                field("Package Type Code"; "Package Type Code")
                {
                    ApplicationArea = All;
                }
                field(Inside; "Inside Code")
                {
                    ApplicationArea = All;
                }
                field("Packaging Unit of Measure"; "Packaging Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Inside Unit of Measure"; "Inside Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Quantity per Layer"; "Quantity per Layer")
                {
                    ApplicationArea = All;
                }
                field("Build-up Layer"; "Build-up Layer Code")
                {
                    ApplicationArea = All;
                }
                field("Build-up Quantity per Layer"; "Build-up Quantity per Layer")
                {
                    ApplicationArea = All;
                }
                field("Build-up Number of Layers"; "Build-up Number of Layers")
                {
                    ApplicationArea = All;
                }
                field("Build-up Maximum Width"; "Build-up Maximum Width")
                {
                    ApplicationArea = All;
                }
                field("Build-up Maximum Height"; "Build-up Maximum Height")
                {
                    ApplicationArea = All;
                }
                field(Remark; Remark)
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
