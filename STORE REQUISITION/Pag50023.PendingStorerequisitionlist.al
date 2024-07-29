// page 50023 "Pending Store requisition list"
// {
//     ApplicationArea = All;
//     Caption = 'Pending Store requisition list';
//     PageType = List;
//     CardPageId = "Pending store req card";
//     SourceTable = storereqheader;
//     UsageCategory = Lists;
//     SourceTableView = where(status = const("Pending for Approval"));
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
//     actions
//     {
//         area(Processing)
//         {
//             action("Approve")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Image = Approval;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     storer: Record storereqheader;
//                     docno: Code[20];
//                 begin
//                     storer.Reset();
//                     storer.SetRange("NO.", docno);
//                     storer.status := rec.status::Approved;
//                     Rec.Status := Rec.Status::Approved;
//                     Rec.Modify();
//                     Message('approved');
//                 end;
//             }
//             action("Reject")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Image = Reject;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     storer: Record storereqheader;
//                     docno: Code[20];
//                 begin
//                     storer.Reset();
//                     storer.SetRange("NO.", docno);
//                     storer.status := rec.status::Rejected;
//                     Rec.Status := Rec.Status::Rejected;
//                     Rec.Modify();
//                     Message('rejected');
//                 end;
//             }
//         }
//     }

//     trigger OnOpenPage()
//     var
//         userset: record "User Setup";
//     begin
//         if userset.Get(UserId) then
//             if userset."1st approver" = false then
//                 Error('You do not have permission to Open the page');
//     end;
// }

