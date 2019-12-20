// table 50011 "ACO Support Holder"
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
//     }

//     keys
//     {
//         key(PK; "Code")
//         {
//             Clustered = true;
//         }
//     }
// }