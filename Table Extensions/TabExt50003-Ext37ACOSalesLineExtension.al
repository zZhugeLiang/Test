tableextension 50003 "VZK Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "ACO Pretreatment"; Code[10])
        {
            Caption = ' Pretreatment';
            TableRelation = "ACO Pretreatment";
            DataClassification = CustomerContent;
        }

        field(50001; "ACO Layer Thickness"; Code[10])
        {
            Caption = 'Layer Thickness';
            TableRelation = "ACO Layer Thickness";
            DataClassification = CustomerContent;
        }

        field(50002; "ACO Color"; Code[20])
        {
            Caption = 'Color';
            TableRelation = "ACO Color";
            DataClassification = CustomerContent;
        }

        field(50003; "ACO Category"; Code[50])
        {
            Caption = 'Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(50004; "ACO Thin Staining Time PT"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Pretreatment';
            DataClassification = CustomerContent;
        }

        field(50005; "ACO Thick Staining Time PT"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Pretreatment';
            DataClassification = CustomerContent;
        }

        field(50006; "ACO Do Not Calc. Short Length"; Boolean)
        {
            Caption = 'Do Not Calculate Short Length';
            DataClassification = CustomerContent;
        }

        field(50007; "ACO Aucos"; Boolean)
        {
            Caption = 'Aucos';
            DataClassification = CustomerContent;
        }

        field(50008; "ACO Aucos Sealing Time"; Boolean)
        {
            Caption = 'Aucos Sealing Time';
            DataClassification = CustomerContent;
        }

        field(50009; "ACO Aucos Flushing Time"; Boolean)
        {
            Caption = 'Aucos Flushing Time';
            DataClassification = CustomerContent;
        }

        field(50010; "ACO British Standard"; Boolean)
        {
            Caption = 'British Standard';
            DataClassification = CustomerContent;
        }

        field(50011; "ACO Min. Current Density Color"; Decimal)
        {
            Caption = 'Minimum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50012; "ACO Max. Current Density Color"; Decimal)
        {
            Caption = 'Maximum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50013; "ACO Minimum Current Density LT"; Decimal)
        {
            Caption = 'Minimum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50014; "ACO Maximum Current Density LT"; Decimal)
        {
            Caption = 'Maximum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50015; "ACO Max. Cur. Density Category"; Decimal)
        {
            Caption = 'Maximum Current Density Category [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50016; "ACO Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            TableRelation = "ACO Profile Customer"."Profile Code" where("Customer No." = field("Sell-to Customer No."));
            DataClassification = CustomerContent;
            //     trigger OnLookup()
            //     var
            //         ACOProfile: Record "ACO Profile";
            //         ACOProfiles: Page "ACO Profiles";
            //     begin
            //         ACOProfiles.LookupMode(true);
            //         ACOProfiles.SetTableView(DimensionValue);
            //         if ACOProfiles.RunModal() = Action::LookupOK then
            //             "ACO Profile Code" := CopyStr(DimensionValueList.GetSelectionFilter(), 1,);
            //     end;
        }

        field(50017; "ACO Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(50018; "ACO Profile Category"; Code[50])
        {
            Caption = 'Profile Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(50019; "ACO Profile Circumference"; Decimal)
        {
            Caption = 'Circumference [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50020; "ACO Not Measurable"; Boolean)
        {
            Caption = 'Not Measurable';
            DataClassification = CustomerContent;
        }

        field(50022; "ACO Area"; Decimal)
        {
            Caption = 'Area Profile';
            DataClassification = CustomerContent;
        }

        field(50023; "ACO Extra Flushing"; Boolean)
        {
            Caption = 'Extra Flushing Profile';
            DataClassification = CustomerContent;
        }

        field(50024; "ACO Correction Factor Profile"; Decimal)
        {
            Caption = 'Correction Factor Profile';
            DataClassification = CustomerContent;
        }

        field(50025; "ACO Height Level Profile"; Integer)
        {
            Caption = 'Height Level [mm] Profile';
            DataClassification = CustomerContent;
        }

        field(50026; "ACO Comment Bath Card"; Text[100])
        {
            Caption = 'Comment Bath Card';
            DataClassification = CustomerContent;
        }

        field(50027; "ACO Comment Work Note"; Text[100])
        {
            Caption = 'Comment Work Note';
            DataClassification = CustomerContent;
        }

        field(50028; "ACO Bent Profile"; Boolean)
        {
            Caption = 'Bent Profile';
            DataClassification = CustomerContent;
        }

        field(50029; "ACO Minimum Current Density PT"; Decimal)
        {
            Caption = 'Minimum Current Density Pretreatment [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50030; "ACO Maximum Current Density PT"; Decimal)
        {
            Caption = 'Maximum Current Density Pretreatment [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50031; "ACO Max. Curr. Density Profile"; Decimal)
        {
            Caption = 'Maximum Current Density Profile [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50032; "ACO Min. Curr. Density Profile"; Decimal)
        {
            Caption = 'Minimum Current Density Profile [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50033; "ACO Thin Staining Time Profile"; Decimal)
        {
            Caption = 'Thin Staining Time [min] Profile';
            DataClassification = CustomerContent;
        }

        field(50034; "ACO Thick St. Time Profile"; Decimal)
        {
            Caption = 'Thick Staining Time [min] Profile';
            DataClassification = CustomerContent;
        }

        field(50035; "ACO Euras Profile"; Boolean)
        {
            Caption = 'Euras Profile';
            DataClassification = CustomerContent;
        }

        field(50036; "ACO Extra to Enumerate Profile"; Integer)
        {
            Caption = 'Extra to Enumerate [mm] Profile';
            DataClassification = CustomerContent;
        }

        // field(50037; "ACO Holders Profile"; Code[20])
        // {
        //     Caption = 'Holders Profile';
        //     DataClassification = CustomerContent;
        // }
        // field(50038; "ACO Clamping Method Profile"; Option)
        // {
        //     Caption = 'Clamping Method Profile';
        //     DataClassification = CustomerContent;
        // }
        // field(50039; "ACO Type of Clamp Profile"; Option)
        // {
        //     Caption = 'Type of Clamp Profile';
        //     DataClassification = CustomerContent;
        // }
        // field(50040; "ACO Helix Profile"; Decimal)
        // {
        //     Caption = 'Helix Profile';
        //     DataClassification = CustomerContent;
        // }
        // field(50041; "ACO Space Profile"; Decimal)
        // {
        //     Caption = 'Space Profile';
        //     DataClassification = CustomerContent;
        // }

        // field(50042; "ACO Sawing"; Boolean)
        // {
        //     Caption = 'Sawing';
        //     DataClassification = CustomerContent;
        // }

        // field(50043; "ACO Final Length"; Boolean)
        // {
        //     Caption = 'Final Length';
        //     DataClassification = CustomerContent;
        // }


    }
}