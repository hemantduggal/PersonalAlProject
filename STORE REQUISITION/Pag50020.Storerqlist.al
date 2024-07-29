// page 50020 "Store req list"
// {
//     ApplicationArea = All;
//     Caption = 'Store rq list';
//     PageType = List;
//     SourceTable = storereqheader;
//     UsageCategory = Lists;
//     CardPageId = "Store req card";
//     Editable = false;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("NO."; Rec."NO.")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the NO. field.';
//                 }


//                 field(status; Rec.status)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the status field.';
//                 }

//             }
//         }
//     }
// }
