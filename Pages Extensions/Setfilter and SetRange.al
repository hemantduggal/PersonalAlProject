// /// <summary>
// /// PageExtension SetFilter (ID 50104) extends Record Item List.
// /// </summary>
// pageextension 50104 "SetFilter and SetRange" extends "Item List"
// {
//     actions
//     {
//         addfirst(processing)
//         {
//             action("SetFilter")
//             {
//                 ApplicationArea = all;
//                 Caption = 'set filter';
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 trigger OnAction()
//                 begin
//                     Rec.SetFilter("No.", '1896-S');
//                 end;
//             }
//             action("SetRange")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Set Range';
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Rec.SetRange("Unit Price", 5000, 10000);
//                 end;
//             }
//         }
//     }

// }