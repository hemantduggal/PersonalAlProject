page 50091 "Backlog-SN"
{
    PageType = List;
    caption = 'Backlog- SN';
    UsageCategory = Administration;
    SourceTable = BAcklogSn;
    RefreshOnActivate = true;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Shiptocode; Rec.Shiptocode)
                {
                    ApplicationArea = All;

                }
                field(Sono; Rec.Sono)
                {
                    ApplicationArea = all;
                }
                field("item No"; Rec."item No")
                {
                    ApplicationArea = all;
                }
                field(iteminsertdate; Rec.iteminsertdate)
                {
                    ApplicationArea = all;
                }
                field("PO No"; Rec."PO No")
                {
                    ApplicationArea = all;
                }
                field("Commercial Product"; Rec."Commercial Product")
                {
                    ApplicationArea = all;
                }
                field(RD; Rec.RD)
                {
                    ApplicationArea = all;
                }
                field(CD; Rec.CD)
                {
                    ApplicationArea = all;
                }
                field(EDD; Rec.EDD)
                {
                    ApplicationArea = all;
                }
                field("Open QTy"; Rec."Open QTy")
                {
                    ApplicationArea = all;
                }
                field("Backlog Price"; Rec."Backlog Price")
                {
                    ApplicationArea = all;
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(ImportBacklogList)
            {
                Caption = 'import Backlog List';
                action("&Import")
                {
                    Caption = '&Import';
                    Image = ImportExcel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    ToolTip = 'Import data from excel.';

                    trigger OnAction()
                    var
                    begin
                        if BatchName = '' then
                            // Error(BatchISBlankMsg);
                            ReadExcelSheet();
                        ImportExcelData();
                    end;
                }
                action("Delete All Data")
                {
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        sn: Record BAcklogSn;
                    begin
                        sn.DeleteAll();
                        sn.Reset();
                    end;
                }
            }
        }
    }
    var
        BatchName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';


    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        SOImportBuffer: Record BAcklogSn;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        SOImportBuffer.Reset();
        if SOImportBuffer.FindLast() then
            LineNo := SOImportBuffer."Entry No";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            LineNo := LineNo + 10000;
            SOImportBuffer.Init();

            SOImportBuffer."Entry No" := LineNo;
            if GetValueAtCell(RowNo, 1) <> '' then
                Evaluate(SOImportBuffer.Shiptocode, GetValueAtCell(RowNo, 1));
            if GetValueAtCell(RowNo, 2) <> '' then
                Evaluate(SOImportBuffer.Sono, GetValueAtCell(RowNo, 2));
            if GetValueAtCell(RowNo, 3) <> '' then
                Evaluate(SOImportBuffer."item No", GetValueAtCell(RowNo, 3));
            if GetValueAtCell(RowNo, 4) <> '' then
                Evaluate(SOImportBuffer.iteminsertdate, GetValueAtCell(RowNo, 4));
            if GetValueAtCell(RowNo, 5) <> '' then
                Evaluate(SOImportBuffer."PO No", GetValueAtCell(RowNo, 5));
            if GetValueAtCell(RowNo, 6) <> '' then
                Evaluate(SOImportBuffer."Commercial Product", GetValueAtCell(RowNo, 6));
            if GetValueAtCell(RowNo, 7) <> '' then
                Evaluate(SOImportBuffer.RD, GetValueAtCell(RowNo, 7));
            if GetValueAtCell(RowNo, 8) <> '' then
                Evaluate(SOImportBuffer.CD, GetValueAtCell(RowNo, 8));
            if GetValueAtCell(RowNo, 9) <> '' then
                Evaluate(SOImportBuffer.EDD, GetValueAtCell(RowNo, 9));
            if GetValueAtCell(RowNo, 10) <> '' then
                Evaluate(SOImportBuffer."Open QTy", GetValueAtCell(RowNo, 10));
            if GetValueAtCell(RowNo, 11) <> '' then
                Evaluate(SOImportBuffer."Backlog Price", GetValueAtCell(RowNo, 11));
            if GetValueAtCell(RowNo, 12) <> '' then
                Evaluate(SOImportBuffer.Value, GetValueAtCell(RowNo, 12));
            SOImportBuffer.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;
}