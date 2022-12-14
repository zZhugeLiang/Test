// page 50016 "ACO Holder Card"
// {
//     Caption = 'Holder Card';
//     PageType = Card;
//     SourceTable = "ACO Holder";

//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("Code"; "Code")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Description; Description)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Length; Length)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Color Group Code"; "Color Group Code")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Attach Method Code"; "Attach Method Code")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Type of Clamp Code"; "Type of Clamp Code")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Comment; Comment)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Method; Method)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Space; Space)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Helix; Helix)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Helix Start"; "Helix Start")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Helix End"; "Helix End")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Navigation)
//         {
//             action("ACO Linked Holders Types")
//             {
//                 Caption = 'Linked Holders Types';
//                 Image = Bin;
//                 RunObject = Page "ACO Linked Holder Types";
//                 RunPageLink = "Holder Code" = field("Code"), Length = field(Length);
//                 ApplicationArea = All;
//             }
//             action("ACO Linked Support Holders")
//             {
//                 Caption = 'Linked Support Holders';
//                 Image = CreateMovement;
//                 RunObject = Page "ACO Linked Support Holders";
//                 RunPageLink = "Holder Code" = field("Code"), Length = field(Length);
//                 ApplicationArea = All;
//             }
//             action("ACO Linked Distance Holders")
//             {
//                 Caption = 'Linked Distance Holders';
//                 Image = CreateBins;
//                 RunObject = Page "ACO Linked Distance Holders";
//                 RunPageLink = "Holder Code" = field("Code"), Length = field(Length);
//                 ApplicationArea = All;
//             }
//         }
//     }
// }