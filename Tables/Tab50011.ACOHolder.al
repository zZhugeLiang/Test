// table 50010 "ACO Support Holder"
// {
//     Caption = 'Holder';
//     // DrillDownPageId = "ACO Holders";
//     // LookupPageId = "ACO Holders";
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "Code"; Code[20])
//         {
//             Caption = 'Code';
//             DataClassification = CustomerContent;
//         }

//         field(2; "Description"; Text[100])
//         {
//             Caption = 'Description';
//             DataClassification = CustomerContent;
//         }

//         field(3; "Customer No."; Code[20])
//         {
//             Caption = 'Customer No.';
//             TableRelation = "ACO Category";
//             DataClassification = CustomerContent;
//         }

//         field(4; "Profile"; Code[10])
//         {
//             Caption = 'Profile';
//             DataClassification = CustomerContent;
//         }

//         field(5; "Length"; Decimal)
//         {
//             Caption = 'Length';
//             DataClassification = CustomerContent;
//         }

//         field(6; "Color Group"; Code[20])
//         {
//             Caption = 'Color Group';
//             DataClassification = CustomerContent;
//         }

//         field(7; Holder; Code[20])////??
//         {
//             Caption = 'Holder';
//             DataClassification = CustomerContent;
//         }

//         field(8; "Supporting Holder"; Code[20])
//         {
//             Caption = 'Supporting Holder';
//             DataClassification = CustomerContent;
//         }

//         field(9; "Distance Holder"; Code[20])
//         {
//             Caption = 'Distance Holder';
//             DataClassification = CustomerContent;
//         }

//         // field(10; "ACO Clamping Method"; Option)
//         // {
//         //     Caption = 'Clamping Method';
//         //     DataClassification = CustomerContent;
//         // }
//         // field(11; "ACO Type of Clamp"; Option)
//         // {
//         //     Caption = 'Type of Clamp';
//         //     DataClassification = CustomerContent;
//         // }

//         field(11; Comment; Text[50])
//         {
//             Caption = 'Comment';
//             DataClassification = CustomerContent;
//         }

//         field(12; Method; Text[50])
//         {
//             Caption = 'Comment';
//             DataClassification = CustomerContent;
//         }
//         field(13; Space; Decimal)
//         {
//             Caption = 'Space';
//             DataClassification = CustomerContent;
//         }
//         field(14; Helix; Decimal)
//         {
//             Caption = 'Helix';
//             DataClassification = CustomerContent;
//         }
//         field(15; "Helix Start"; Decimal)
//         {
//             Caption = 'Helix Start [in cm]';
//             DataClassification = CustomerContent;
//         }
//         field(16; "Helix End"; Decimal)
//         {
//             Caption = 'Helix End [in cm]';
//             DataClassification = CustomerContent;
//         }
//     }

//     keys
//     {
//         key(PK; "Code")
//         {
//             Clustered = true;
//         }
//     }
// }