// report 50155 "Import Sada Price List"
// {

//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(integer; Integer)
//         {
//             DataItemTableView = SORTING(Number);

//             trigger OnAfterGetRecord()
//             begin
//                 ImportSheet(Number);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 ExcelBuf.OpenBook(ServerFileName, SheetName);
//                 ExcelBuf.ReadSheet;
//                 SETRANGE(Number, 2, ExcelBuf.COUNT);
//             end;

//             trigger OnPostDataItem()
//             begin
//                 ExcelBuf.DELETEALL;
//                 MESSAGE('Import Data');
//             end;
//         }
//     }
//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//         trigger OnQueryClosePage(CloseAction: Action): Boolean
//         var
//             FileMgt: Codeunit "File Management";
//         begin
//             IF CloseAction = ACTION::OK THEN BEGIN
//                 ServerFileName := FileMgt.UploadFile(Text006, ExcelFileExtensionTok);
//                 IF ServerFileName = '' THEN
//                     EXIT(FALSE);

//                 SheetName := ExcelBuf.SelectSheetsName(ServerFileName);
//                 IF SheetName = '' THEN
//                     EXIT(FALSE);

//             END;
//         end;
//     }
//     labels
//     {
//     }

//     trigger OnPostReport()
//     begin
//         ExcelBuf.DELETEALL;
//         MESSAGE('Import Data');
//     end;

//     var
//         ExcelBuf: Record "Excel Buffer" temporary;
//         ServerFileName: Text;
//         SheetName: Text[250];
//         Text005: Label 'Imported from Excel ';
//         Text006: Label 'Import Excel File';
//         ExcelFileExtensionTok: Label '.xlsx', Locked = true;
//         FileName: Text;
//         ResNo: Code[20];
//         CountData: Integer;
//         LastNoSeries: Code[20];
//         Rec_Item: Record Item;
//         "Type Slect": Option " ",Lines,Update;
//         ColText1: array[11] of Text[250];
//         seyinteg: Integer;
//         DimSetID: Integer;
//         CText1: array[3] of Text;



//         sadapricelist: Record Sadapricelist;
//         GlobalDocNo: Code[20];
//         GlobalBatchName: Code[20];
//         GlobalTemplname: Code[20];
//         BatchName: Code[20];
//         Templname: Code[20];
//         LineNum: Integer;

//         Entry_Num: Integer;
//         LineNo: Integer;



//         sadaprice: Record Sadapricelist;


//     procedure ImportSheet(RowNum: Integer)
//     begin
//         CLEAR(ColText1);


//         ExcelBuf.SETRANGE(ExcelBuf."Row No.", RowNum);
//         IF ExcelBuf.FINDSET THEN
//             REPEAT
//                 ColText1[ExcelBuf."Column No."] := ExcelBuf."Cell Value as Text";
//             UNTIL ExcelBuf.NEXT = 0;
//         IF ColText1[1] <> '' THEN BEGIN
//             //  if SheetName = 'Sada Price List' then begin
//             LineNo := GetEntryNo(GlobalDocNo);

//             // end;
//             sadapricelist.Reset();
//             if sadapricelist.FindLast() then begin
//                 sadapricelist.INIT;
//                 sadapricelist."Entry No" := sadapricelist."Entry No" + 1;

//                 sadapricelist.INSERT;
//             end;

//             if ColText1[1] <> '' then begin
//                 Evaluate(sadapricelist.ProductBU, ColText1[1]);
//                 sadapricelist.VALIDATE(ProductBU, ColText1[1]);
//             end;


//             if ColText1[2] <> '' then begin
//                 EVALUATE(sadapricelist.ProductbUcode, ColText1[2]);
//                 sadapricelist.VALIDATE(ProductbUcode);

//             end;

//             if ColText1[3] <> '' then begin
//                 EVALUATE(sadapricelist.Productgroup, ColText1[3]);
//                 sadapricelist.VALIDATE(Productgroup);
//             end;

//             if ColText1[4] <> '' then begin
//                 EVALUATE(sadapricelist.Productgroupcode, ColText1[4]);
//             end;

//             if ColText1[5] <> '' then begin
//                 EVALUATE(sadapricelist.MPN, ColText1[5]);
//                 sadapricelist.VALIDATE(MPN);
//             end;
//             if ColText1[6] <> '' then begin
//                 EVALUATE(sadapricelist.Name, ColText1[6]);
//                 sadapricelist.Validate(Name);
//             end;
//             if ColText1[7] <> '' then begin
//                 EVALUATE(sadapricelist.Customer, ColText1[7]);
//                 sadapricelist.Validate(Customer);
//             end;
//             if ColText1[8] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer", ColText1[7]);
//                 sadapricelist.Validate("End Customer");
//             end;
//             if ColText1[9] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Number", ColText1[7]);
//                 sadapricelist.Validate("Debit Number");
//             end;

//             if ColText1[10] <> '' then begin
//                 EVALUATE(sadapricelist.RegNo, ColText1[7]);
//                 sadapricelist.Validate(RegNo);
//             end;
//             if ColText1[11] <> '' then begin
//                 EVALUATE(sadapricelist."E2 Contract Nr", ColText1[7]);
//                 sadapricelist.Validate("E2 Contract Nr");
//             end;
//             if ColText1[12] <> '' then begin
//                 EVALUATE(sadapricelist.DebitStatus, ColText1[7]);
//                 sadapricelist.Validate(DebitStatus);
//             end;
//             if ColText1[13] <> '' then begin
//                 EVALUATE(sadapricelist."Item Start Date", ColText1[7]);
//                 sadapricelist.Validate("Item Start Date");
//             end;
//             if ColText1[14] <> '' then begin
//                 EVALUATE(sadapricelist."Item Expiry Date", ColText1[7]);
//                 sadapricelist.Validate("Item Expiry Date");
//             end;
//             if ColText1[15] <> '' then begin
//                 EVALUATE(sadapricelist."Reg Item Exp Date", ColText1[7]);
//                 sadapricelist.Validate("Reg Item Exp Date");
//             end;
//             if ColText1[16] <> '' then begin
//                 EVALUATE(sadapricelist."Reg item Status", ColText1[7]);
//                 sadapricelist.Validate("Reg item Status");
//             end;
//             if ColText1[17] <> '' then begin
//                 EVALUATE(sadapricelist."Item Start Date", ColText1[7]);
//                 sadapricelist.Validate("Item Start Date");
//             end;
//             if ColText1[18] <> '' then begin
//                 EVALUATE(sadapricelist.Currency, ColText1[7]);
//                 sadapricelist.Validate(Currency);
//             end;
//             if ColText1[19] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Item Num", ColText1[7]);
//                 sadapricelist.Validate("Debit Item Num");
//             end;
//             if ColText1[20] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Req Qty", ColText1[7]);
//                 sadapricelist.Validate("Debit Req Qty");
//             end;
//             if ColText1[21] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Ship Qty", ColText1[7]);
//                 sadapricelist.Validate("Debit Ship Qty");
//             end;
//             if ColText1[22] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Open Qty", ColText1[7]);
//                 sadapricelist.Validate("Debit Open Qty");
//             end;
//             if ColText1[23] <> '' then begin
//                 EVALUATE(sadapricelist."Adj. Cost", ColText1[7]);
//                 sadapricelist.Validate("Adj. Cost");
//             end;
//             if ColText1[24] <> '' then begin
//                 EVALUATE(sadapricelist."Adj. Resale", ColText1[7]);
//                 sadapricelist.Validate("Adj. Resale");
//             end;
//             if ColText1[25] <> '' then begin
//                 EVALUATE(sadapricelist.DBC, ColText1[7]);
//                 sadapricelist.Validate(DBC);
//             end;
//             if ColText1[26] <> '' then begin
//                 EVALUATE(sadapricelist."Debit Open Qty Percentage", ColText1[7]);
//                 sadapricelist.Validate("Debit Open Qty Percentage");
//             end;
//             if ColText1[27] <> '' then begin
//                 EVALUATE(sadapricelist."Is MQ", ColText1[7]);
//                 sadapricelist.Validate("Is MQ");
//             end;
//             if ColText1[28] <> '' then begin
//                 EVALUATE(sadapricelist.DistiShiptoname, ColText1[7]);
//                 sadapricelist.Validate(DistiShiptoname);
//             end;
//             if ColText1[29] <> '' then begin
//                 EVALUATE(sadapricelist."Customer City", ColText1[7]);
//                 sadapricelist.Validate("Customer City");
//             end;
//             if ColText1[30] <> '' then begin
//                 EVALUATE(sadapricelist."Customer State", ColText1[7]);
//                 sadapricelist.Validate("Customer State");
//             end;
//             if ColText1[31] <> '' then begin
//                 EVALUATE(sadapricelist."Customer Zip", ColText1[7]);
//                 sadapricelist.Validate("Customer Zip");
//             end;
//             if ColText1[32] <> '' then begin
//                 EVALUATE(sadapricelist."Customer Country", ColText1[7]);
//                 sadapricelist.Validate("Customer Country");
//             end;
//             if ColText1[33] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer City", ColText1[7]);
//                 sadapricelist.Validate("End Customer City");
//             end;
//             if ColText1[34] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer City", ColText1[7]);
//                 sadapricelist.Validate("End Customer City");
//             end;
//             if ColText1[35] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer State", ColText1[7]);
//                 sadapricelist.Validate("End Customer State");
//             end;
//             if ColText1[36] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer Zip", ColText1[7]);
//                 sadapricelist.Validate("End Customer Zip");
//             end;
//             if ColText1[37] <> '' then begin
//                 EVALUATE(sadapricelist."End Customer Country", ColText1[7]);
//                 sadapricelist.Validate("End Customer Country");
//             end;

//         end;

//         sadapricelist.MODIFY(TRUE);

//     END;

//     procedure GetDocNo(DocumentNo: Code[20])

//     begin
//         GlobalDocNo := DocumentNo;



//     end;

//     local procedure GetEntryNo(DocNo: Code[20]): Integer
//     begin
//         sadapricelist.RESET;
//         sadapricelist.SETRANGE("Entry No", sadaprice."Entry No");
//         IF sadapricelist.FINDLAST THEN
//             EXIT(sadapricelist."Entry No")
//         ELSE
//             EXIT;

//     end;


// }