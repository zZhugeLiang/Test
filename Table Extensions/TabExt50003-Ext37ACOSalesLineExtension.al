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

        field(50004; "Thin Staining Time"; Decimal)
        {
            Caption = 'Thin Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50005; "Thick Staining Time"; Decimal)
        {
            Caption = 'Thick Staining Time [min]';
            DataClassification = CustomerContent;
        }

        field(50006; "Do Not Calculate Short Length"; Boolean)
        {
            Caption = 'Do Not Calculate Short Length';
            DataClassification = CustomerContent;
        }

        field(50007; "Aucos"; Boolean)
        {
            Caption = 'Aucos';
            DataClassification = CustomerContent;
        }

        field(50008; "Aucos Sealing Time"; Boolean)
        {
            Caption = 'Aucos Sealing Time';
            DataClassification = CustomerContent;
        }

        field(50009; "Aucos Flushing Time"; Boolean)
        {
            Caption = 'Aucos Flushing Time';
            DataClassification = CustomerContent;
        }

        field(50010; "British Standard"; Boolean)
        {
            Caption = 'British Standard';
            DataClassification = CustomerContent;
        }

        field(50011; "Minimum Current Density Color"; Decimal)
        {
            Caption = 'Minimum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50012; "Maximum Current Density Color"; Decimal)
        {
            Caption = 'Maximum Current Density Color [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50013; "Minimum Current Density LT"; Decimal)
        {
            Caption = 'Minimum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50014; "Maximum Current Density LT"; Decimal)
        {
            Caption = 'Maximum Current Density Layer Thickness [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50015; "Maximum Curr. Density Category"; Decimal)
        {
            Caption = 'Maximum Current Density Category [A/dm²]';
            DataClassification = CustomerContent;
        }

        field(50016; "Profile Code"; Code[30])
        {
            Caption = 'Profile Code';
            DataClassification = CustomerContent;
        }

        field(50017; "Profile Description"; Text[100])
        {
            Caption = 'Profile Description';
            DataClassification = CustomerContent;
        }

        field(50018; "Profile Category"; Code[50])
        {
            Caption = 'Profile Category';
            TableRelation = "ACO Category";
            DataClassification = CustomerContent;
        }

        field(50019; "Profile Circumference"; Decimal)
        {
            Caption = 'Profile Circumference [mm]';
            DataClassification = CustomerContent;
        }

        field(50020; "Weight per meter"; Decimal)
        {
            Caption = 'Weight per meter [kg]';
            DataClassification = CustomerContent;
        }

    }
}