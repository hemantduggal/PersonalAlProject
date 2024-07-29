// /// <summary>
// /// Page ASSEMBLY WORKSHEET Page (ID 50009).
// /// </summary>
// page 50013 "ASSEMBLY MAster WORKSHEET Page"
// {
//     ApplicationArea = Basic, Suite;
//     AutoSplitKey = true;
//     Caption = 'ASSEMBLY WORKSHEET';
//     DataCaptionFields = "Journal Batch Name";
//     DelayedInsert = true;
//     PageType = Worksheet;
//     SaveValues = true;
//     SourceTable = "ASSEMBLY MASTER Line";
//     UsageCategory = Tasks;

//     layout
//     {
//         area(Content)
//         {
//             field(CurrentJnlBatchName; CurrentJnlBatchName)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Batch Name';
//                 Lookup = true;
//                 ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the journal is based on.';

//                 trigger OnLookup(var Text: Text): Boolean
//                 begin
//                     CurrPage.SaveRecord();
//                     ItemJnlMgt.LookupName(CurrentJnlBatchName,rec);

//                     CurrPage.Update(false);
//                 end;

//                 trigger OnValidate()
//                 begin
//                     ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
//                     CurrentJnlBatchNameOnAfterVali();
//                 end;
//             }
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("Assembly No"; Rec."Assembly No")
//                 { ApplicationArea = all; }
//                 field(Type; rec.Type)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Description; rec.Description)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(amount; Rec.amount)
//                 {
//                     ApplicationArea = all;

//                 }
//                 field(quantity; Rec.quantity)
//                 {
//                     ApplicationArea = all;

//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(Post)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'P&ost';
//                 Image = PostOrder;
//                 ShortCutKey = 'F9';
//                 ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
//         CurrentJnlBatchName: Code[10];
//         ItemJnlMgt: Codeunit ItemJnlManagement;

//     // local procedure SetControlAppearanceFromBatch()
//     // var
//     //     ItemJournalBatch: Record "Item Journal Batch";
//     //     ItemTrackingCode: Record "Item Tracking Code";
//     //     BackgroundErrorHandlingMgt: Codeunit "Background Error Handling Mgt.";
//     // begin



//     // end;

//     // local procedure CurrentJnlBatchNameOnAfterVali()
//     // begin
//     //     CurrPage.SaveRecord();
//     //     ItemJnlMgt.SetName(CurrentJnlBatchName, Rec);
//     //     SetControlAppearanceFromBatch();
//     //     CurrPage.Update(false);
//     // end;


//      trigger OnOpenPage()
//     var
//         JnlSelected: Boolean;
//     begin
//         if IsOpenedFromBatch() then begin
//             CurrentJnlBatchName := "Journal Batch Name";
//             itemJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
//             exit;
//         end;
//         itemJnlManagement.TemplateSelection(PAGE::"FA Reclass. Journal", Rec, JnlSelected);
//         if not JnlSelected then
//             Error(''); 

//         itemJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
//     end;

//     protected var
//         itemJnlManagement: Codeunit ItemJnlMgt;
//         CurrentJnlBatchName: Code[10];
//         FADescription: Text[100];
//         NewFADescription: Text[100];

//     local procedure CurrentJnlBatchNameOnAfterVali()
//     begin
//         CurrPage.SaveRecord();
//         itemJnlManagement.SetName(CurrentJnlBatchName, Rec);
//         CurrPage.Update(false);
//     end;


// }