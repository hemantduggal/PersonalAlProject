// page 50200 "NonSadaPriceLists"
// {
//     PageType = List;
//     caption = 'Non-Sada Price List';
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = NonSadapricelists;
//     //CardPageId = "";


//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field("Disti Group"; Rec."Disti Group")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Shipto; Rec.Shipto)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("End Customer"; Rec."End Customer")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("End Customer BPM"; Rec."End Customer BPM")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Sales Unit"; Rec."Sales Unit")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Quote Num"; Rec."Quote Num")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Item Num"; Rec."Item Num")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("SGA No"; Rec."SGA No")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Ext Reference"; Rec."Ext Reference")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Commercial product group code"; Rec."Commercial product group code")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Product Bu"; Rec."Product Bu")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("creation Month"; Rec."creation Month")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("SGA Expire"; Rec."SGA Expire")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Delivery start Date"; Rec."Delivery start Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Delivery Stop"; Rec."Delivery Stop")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Quoteitemwrkflowstts; Rec.Quoteitemwrkflowstts)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Meet Tp"; Rec."Meet Tp")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Targert Price"; Rec."Targert Price")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Approved Price"; Rec."Approved Price")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Prisma Qty"; Rec."Prisma Qty")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Start Qty"; Rec."Start Qty")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Used Qty"; Rec."Used Qty")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Remaining Qty"; Rec."Remaining Qty")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Used Qty Percentage"; Rec."Used Qty Percentage")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Start Val"; Rec."Start Val")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Used val"; Rec."Used val")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Remaining Val"; Rec."Remaining Val")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Used val %"; Rec."Used val %")
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

//             action("&Import")
//             {
//                 Caption = '&Import';
//                 Image = ImportExcel;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 ApplicationArea = All;
//                 ToolTip = 'Import data from excel.';

//                 trigger OnAction()
//                 var
//                 begin
//                     if BatchName = '' then
//                         // Error(BatchISBlankMsg);
//                         ReadExcelSheet();
//                     ImportExcelData();
//                 end;
//             }
//         }
//     }


//     var
//         BatchName: Code[10];
//         FileName: Text[100];
//         SheetName: Text[100];

//         TempExcelBuffer: Record "Excel Buffer" temporary;
//         UploadExcelMsg: Label 'Please Choose the Excel file.';
//         NoFileFoundMsg: Label 'No Excel file found!';
//         BatchISBlankMsg: Label 'Batch name is blank';
//         ExcelImportSucess: Label 'Excel is successfully imported.';


//     local procedure ReadExcelSheet()
//     var
//         FileMgt: Codeunit "File Management";
//         IStream: InStream;
//         FromFile: Text[100];
//     begin
//         UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
//         if FromFile <> '' then begin
//             FileName := FileMgt.GetFileName(FromFile);
//             SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
//         end else
//             Error(NoFileFoundMsg);
//         TempExcelBuffer.Reset();
//         TempExcelBuffer.DeleteAll();
//         TempExcelBuffer.OpenBookStream(IStream, SheetName);
//         TempExcelBuffer.ReadSheet();
//     end;

//     local procedure ImportExcelData()
//     var
//         SOImportBuffer: Record NonSadapricelists;
//         RowNo: Integer;
//         ColNo: Integer;
//         LineNo: Integer;
//         MaxRowNo: Integer;
//     begin
//         RowNo := 0;
//         ColNo := 0;
//         MaxRowNo := 0;
//         LineNo := 0;
//         SOImportBuffer.Reset();
//         if SOImportBuffer.FindLast() then
//             LineNo := SOImportBuffer."Entry No";
//         TempExcelBuffer.Reset();
//         if TempExcelBuffer.FindLast() then begin
//             MaxRowNo := TempExcelBuffer."Row No.";
//         end;

//         for RowNo := 2 to MaxRowNo do begin
//             LineNo := LineNo + 10000;
//             SOImportBuffer.Init();

//             SOImportBuffer."Entry No" := LineNo;
//             Evaluate(SOImportBuffer."Disti Group", GetValueAtCell(RowNo, 1));
//             Evaluate(SOImportBuffer.Shipto, GetValueAtCell(RowNo, 2));
//             Evaluate(SOImportBuffer."End Customer", GetValueAtCell(RowNo, 3));
//             Evaluate(SOImportBuffer."End Customer BPM", GetValueAtCell(RowNo, 4));
//             Evaluate(SOImportBuffer."Sales Unit", GetValueAtCell(RowNo, 5));
//             Evaluate(SOImportBuffer."Quote Num", GetValueAtCell(RowNo, 6));
//             Evaluate(SOImportBuffer."Item Num", GetValueAtCell(RowNo, 7));
//             Evaluate(SOImportBuffer."SGA No", GetValueAtCell(RowNo, 8));
//             Evaluate(SOImportBuffer."Ext Reference", GetValueAtCell(RowNo, 9));
//             Evaluate(SOImportBuffer."Commercial product group code", GetValueAtCell(RowNo, 10));
//             Evaluate(SOImportBuffer."Product Bu", GetValueAtCell(RowNo, 11));
//             Evaluate(SOImportBuffer."Creation Date", GetValueAtCell(RowNo, 12));
//             Evaluate(SOImportBuffer."creation Month", GetValueAtCell(RowNo, 13));
//             Evaluate(SOImportBuffer."SGA Expire", GetValueAtCell(RowNo, 14));
//             Evaluate(SOImportBuffer."Delivery start Date", GetValueAtCell(RowNo, 15));
//             Evaluate(SOImportBuffer."Delivery Stop", GetValueAtCell(RowNo, 16));
//             Evaluate(SOImportBuffer.Quoteitemwrkflowstts, GetValueAtCell(RowNo, 17));
//             Evaluate(SOImportBuffer."Meet Tp", GetValueAtCell(RowNo, 18));
//             Evaluate(SOImportBuffer."Targert Price", GetValueAtCell(RowNo, 19));
//             Evaluate(SOImportBuffer."Approved Price", GetValueAtCell(RowNo, 20));
//             Evaluate(SOImportBuffer."Prisma Qty", GetValueAtCell(RowNo, 21));
//             Evaluate(SOImportBuffer."Start Qty", GetValueAtCell(RowNo, 22));
//             Evaluate(SOImportBuffer."Used Qty", GetValueAtCell(RowNo, 23));
//             Evaluate(SOImportBuffer."Remaining Qty", GetValueAtCell(RowNo, 24));
//             Evaluate(SOImportBuffer."Used Qty Percentage", GetValueAtCell(RowNo, 25));
//             Evaluate(SOImportBuffer."Start Val", GetValueAtCell(RowNo, 26));
//             Evaluate(SOImportBuffer."Used val", GetValueAtCell(RowNo, 27));
//             Evaluate(SOImportBuffer."Remaining Val", GetValueAtCell(RowNo, 28));
//             Evaluate(SOImportBuffer."Used val %", GetValueAtCell(RowNo, 29));

//             SOImportBuffer.Insert();
//         end;
//         Message(ExcelImportSucess);

//     end;

//     local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
//     begin

//         TempExcelBuffer.Reset();
//         If TempExcelBuffer.Get(RowNo, ColNo) then
//             exit(TempExcelBuffer."Cell Value as Text")
//         else
//             exit('');
//     end;
// }



