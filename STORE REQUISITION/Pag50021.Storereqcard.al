// page 50021 "Store req card"
// {

//     Caption = 'Store req card';
//     PageType = Card;
//     SourceTable = storereqheader;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';

//                 field("NO."; Rec."NO.")
//                 {
//                     ApplicationArea = all;

//                     ToolTip = 'Specifies the value of the NO. field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field("document date"; Rec."document date")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the document date field.';
//                 }
//                 field(status; Rec.status)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the status field.';
//                 }
//                 field(storelocation; Rec.storelocation)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the storelocation field.';
//                 }
//                 field("Required Location"; Rec."Required Location")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Required Location field.';
//                 }
//                 field("Requested By"; Rec."Requested By")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Requested By field.';
//                 }
//                 field(Shortcutdim1; Rec.Shortcutdim1)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Shortcutdim1 field.';
//                 }
//                 field(Shortcutdim2; Rec.Shortcutdim2)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Shortcutdim2 field.';
//                 }
//                 field("1stapprover"; Rec."1stapprover")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("2ndapprover"; Rec."2ndapprover")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(ApproverComment; Rec.ApproverComment)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the ApproverComment field.';
//                     Editable = false;
//                 }
//                 field("2ApproverComment"; Rec."2ApproverComment")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the ApproverComment field.';
//                     Editable = false;
//                 }
//                 field(Approvaldate; Rec.Approvaldate)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Approvaldate field.';

//                 }
//                 field(status1; Rec.status1)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the status1 field.';
//                 }
//             }
//             part(storereq; "Store req subform")
//             {

//                 ApplicationArea = Basic, Suite;
//                 UpdatePropagation = Both;
//                 SubPageLink = "DocumentNo." = FIELD("NO.");
//                 Visible = true;
//                 Editable = true;

//             }

//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action("Re-Open")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Re-Open';
//                 Image = ReOpen;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Rec.Status := Rec.Status::Open;
//                     rec.status1 := Rec.status1::Open;
//                     Rec.Modify();
//                     Message('Status Changed to Open');
//                 end;
//             }
//             action(Released)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Release';
//                 Image = ReleaseDoc;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Rec.Status := Rec.Status::Open;
//                     rec.status1 := Rec.status1::released;
//                     Rec.Modify();
//                     Message('Status Changed to Release');
//                 end;

//                 // trigger OnAction()
//                 // var
//                 //     stL: Record "Store requisition line";
//                 //     StLine1: Record "Store requisition line";
//                 // begin
//                 //     // Rec.TestField(Status, Rec.Status::Open);

//                 //     StLine1.Reset();
//                 //     StLine1.SetRange("DocumentNo.", rec."NO.");
//                 //     if StLine1.FindSet() then begin
//                 //         repeat
//                 //             StLine1.TestField(NO);
//                 //         until StLine1.Next() = 0;
//                 //     end;

//                 //     StLine1.Reset();
//                 //     StLine1.SetRange("DocumentNo.", rec."NO.");

//                 //     if StLine1.FindFirst() then begin
//                 //         Rec.status1 := Rec.status1::released;
//                 //         Rec.Modify();
//                 //         Message('Status Changed to Released');
//                 //     end else
//                 //         Error(' Line should have value');


//                 // end;
//             }

//             action("Send For Approval")
//             {
//                 ApplicationArea = all;
//                 Image = ReOpen;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = vis;

//                 trigger OnAction()
//                 var
//                     storer: Record storereqheader;
//                     docno: Code[20];
//                     reqline: record "Requistion approval entries";
//                     storereql: record "Store requisition line";
//                 begin
//                     Rec.Status := Rec.Status::"Pending for Approval";
//                     Rec.Modify();


//                     ReqLINE.Init();
//                     // ReqLINE."Document No." := '';
//                     reqline."Entry No." := 1;
//                     // if ReqLINE.Insert(true) then begin
//                     reqline."Document No." := rec."NO.";
//                     reqline."Document Date" := rec."document date";
//                     reqline."Approver ID" := rec."1stapprover";
//                     reqline."approverid2" := rec."2ndapprover";
//                     reqline.Status := rec.status;
//                     // ReqLINE.TransferFields(Rec, false);
//                     ReqLINE.Insert(true);
//                     Message('Approval Requested');
//                 end;

//                 // end;
//             }

//             action("Cancel approval")
//             {
//                 ApplicationArea = all;
//                 Image = ReOpen;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = vis;

//                 trigger OnAction()
//                 begin
//                     Rec.Status := Rec.Status::Open;
//                     Rec.Modify();
//                     Message('approval cancelled');
//                 end;
//             }

//             // action(POST)
//             // {
//             //     Caption = 'Post';
//             //     ApplicationArea = all;
//             //     Image = Post;
//             //     PromotedCategory = Process;
//             //     Promoted = true;
//             //     PromotedIsBig = true;
//             //     trigger OnAction()
//             //     var
//             //     begin

//             //     end;
//             // }
//         }
//     }
//     trigger OnOpenPage()
//     var
//         userset: record "User Setup";
//     begin
//         if userset.Get(UserId) then
//             if userset."1st approver" = false then
//                 vis := false
//             else
//                 vis := true;
//     end;

//     // procedure visi(doc: code[20])
//     // var
//     //     usersetup: Record "User Setup";
//     //     header: Record storereqheader;
//     // begin
//     //     vis := false;
//     //     header.Reset();
//     //     header.SetRange("NO.", rec."NO.");
//     //     if header.FindFirst() then begin
//     //         if header."1stapprover" = UserId then begin
//     //             vis := true;
//     //         end;
//     //     end;
//     // end;


//     // trigger OnOpenPage()
//     // var
//     // begin
//     //     vis := false;
//     //     vis := MyProcedure();

//     // end;

//     // local procedure MyProcedure(): Boolean
//     // var
//     //     usersetup: record "User Setup";
//     // begin
//     //     if usersetup.Get(usersetup."User ID") then begin
//     //         if usersetup.Get(usersetup."1st approver" = true) then
//     //             exit(true)
//     //         else
//     //             exit(false);
//     //     end;
//     //     // end else begin
//     //     //     exit(true);
//     //     // end;


//     // end;


//     var
//         vis: Boolean;
// }
