// page 50022 "Store req subform"
// {

//     Caption = 'Store req subform';
//     PageType = ListPart;
//     SourceTable = "Store requisition line";
//     AutoSplitKey = true;
//     Editable = true;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 Caption = 'General';

//                 field("DocumentNo."; Rec."DocumentNo.")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the DocumentNo. field.';
//                 }
//                 field("Line No"; Rec."Line No")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Line No field.';
//                 }
//                 field(NO; Rec.NO)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the NO field.';

//                 }
//                 field(description; Rec.description)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the description field.';
//                 }
//                 field(UOM; Rec.UOM)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the UOM field.';
//                 }
//                 field("Store Location"; Rec."Store Location")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Store Location field.';
//                 }
//                 field("Required location"; Rec."Required location")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Required location field.';
//                 }
//                 field("Requested Quantity"; Rec."Requested Quantity")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Requested Quantity field.';
//                 }
//                 field("Issue Quantity"; Rec."Issue Quantity")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Issue Quantity field.';
//                     Visible = vis;
//                     //Editable = false;
//                 }
//                 field("Available Stock"; Rec."Available Stock")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Available Stock field.';
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
//             }
//         }
//     }
//     var
//         vis: Boolean;

//     trigger OnOpenPage()
//     var
//         sh: Record storereqheader;
//     begin
//         vis := false;

//         sh.Reset();
//         sh.SetRange("NO.", rec."DocumentNo.");
//         if sh.FindFirst() then begin
//             if sh.status1 = sh.status1::released then
//                 vis := true;
//         end;
//     end;

// }
