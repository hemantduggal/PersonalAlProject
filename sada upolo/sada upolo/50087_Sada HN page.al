
page 50087 "SadaPriceList-HN"
{
    PageType = List;
    caption = 'Sada Price List- HN';
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Sadapricelisthn;
    RefreshOnActivate = true;
    // SourceTableView = where(uploadtype = filter('HN'));
    //CardPageId = "";




    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ProductBU; Rec.ProductBU)
                {
                    ApplicationArea = All;

                }
                field(ProductBUCode; Rec.ProductBUCode)
                {
                    ApplicationArea = all;
                }
                field(Productgroup; Rec.Productgroup)
                {
                    ApplicationArea = all;
                }
                field(ProductGroupCode; Rec.ProductGroupCode)
                {
                    ApplicationArea = all;
                }
                field(MPN; Rec.MPN)
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = all;
                }
                field("End Customer "; Rec."End Customer")
                {
                    ApplicationArea = all;
                }
                field("Debit Number"; Rec."Debit Number")
                {
                    ApplicationArea = all;
                }
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = all;
                }
                field("E2 Contract Nr"; Rec."E2 Contract Nr")
                {
                    ApplicationArea = all;
                }
                field(DebitStatus; Rec.DebitStatus)
                {
                    ApplicationArea = all;
                }
                field("Item Start Date"; Rec."Item Start Date")
                {
                    ApplicationArea = all;
                }
                field("Item Expiry Date"; Rec."Item Expiry Date")
                {
                    ApplicationArea = all;
                }
                field("Reg Item Exp Date"; Rec."Reg Item Exp Date")
                {
                    ApplicationArea = all;
                }
                field("Reg item Status"; Rec."Reg item Status")
                {
                    ApplicationArea = all;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = all;
                }
                field("Debit Item Num"; Rec."Debit Item Num")
                {
                    ApplicationArea = all;
                }
                field("Debit Req Qty"; Rec."Debit Req Qty")
                {
                    ApplicationArea = all;
                }
                field("Debit Ship Qty"; Rec."Debit Ship Qty")
                {
                    ApplicationArea = all;
                }
                field("Debit Open Qty"; Rec."Debit Open Qty")
                {
                    ApplicationArea = all;
                }
                field("Adj. Cost"; Rec."Adj. Cost")
                {
                    ApplicationArea = all;
                }
                field("Adj. Resale"; Rec."Adj. Resale")
                {
                    ApplicationArea = all;
                }
                field(DBC; Rec.DBC)
                {
                    ApplicationArea = all;
                }
                field("Debit Open Qty Percentage"; Rec."Debit Open Qty Percentage")
                {
                    ApplicationArea = all;
                }
                field("Is MQ"; Rec."Is MQ")
                {
                    ApplicationArea = all;
                }
                field(DistiShiptoname; Rec.DistiShiptoname)
                {
                    ApplicationArea = all;
                }
                field("Customer City"; Rec."Customer City")
                {
                    ApplicationArea = all;
                }
                field("Customer State"; Rec."Customer State")
                {
                    ApplicationArea = all;
                }
                field("Customer Zip"; Rec."Customer Zip")
                {
                    ApplicationArea = all;
                }
                field("Customer Country"; Rec."Customer Country")
                {
                    ApplicationArea = all;
                }
                field("End Customer City"; Rec."End Customer City")
                {
                    ApplicationArea = all;

                }
                field("End Customer State"; Rec."End Customer State")
                {
                    ApplicationArea = all;
                }
                field("End Customer Zip"; Rec."End Customer Zip")
                {
                    ApplicationArea = all;
                }
                field("End Customer Country"; Rec."End Customer Country")
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

            //for CSv
            // action(Hongkong)
            // {
            //     Caption = 'Import Hong kong Data';

            //     Image = ListPage;
            //     ApplicationArea = all;
            //     //RunObject = page "SadaPriceList-HN";
            //     trigger OnAction()
            //     begin
            //         Xmlport.Run(Xmlport::importXmlportHN, false, true);

            //     end;
            // }
            //new for Excel
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
        SOImportBuffer: Record Sadapricelisthn;
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
            Evaluate(SOImportBuffer.ProductBU, GetValueAtCell(RowNo, 1));
            Evaluate(SOImportBuffer.ProductBUCode, GetValueAtCell(RowNo, 2));
            Evaluate(SOImportBuffer.Productgroup, GetValueAtCell(RowNo, 3));
            Evaluate(SOImportBuffer.ProductGroupCode, GetValueAtCell(RowNo, 4));
            Evaluate(SOImportBuffer.MPN, GetValueAtCell(RowNo, 5));
            Evaluate(SOImportBuffer.Name, GetValueAtCell(RowNo, 6));
            Evaluate(SOImportBuffer.Customer, GetValueAtCell(RowNo, 7));
            Evaluate(SOImportBuffer."End Customer", GetValueAtCell(RowNo, 8));
            Evaluate(SOImportBuffer."Debit Number", GetValueAtCell(RowNo, 9));
            Evaluate(SOImportBuffer.RegNo, GetValueAtCell(RowNo, 10));
            Evaluate(SOImportBuffer."E2 Contract Nr", GetValueAtCell(RowNo, 11));
            Evaluate(SOImportBuffer.DebitStatus, GetValueAtCell(RowNo, 12));
            Evaluate(SOImportBuffer."Item Start Date", GetValueAtCell(RowNo, 13));
            Evaluate(SOImportBuffer."Item Expiry Date", GetValueAtCell(RowNo, 14));
            Evaluate(SOImportBuffer."Reg Item Exp Date", GetValueAtCell(RowNo, 15));
            Evaluate(SOImportBuffer."Reg item Status", GetValueAtCell(RowNo, 16));
            Evaluate(SOImportBuffer.Currency, GetValueAtCell(RowNo, 17));
            Evaluate(SOImportBuffer."Debit Item Num", GetValueAtCell(RowNo, 18));
            Evaluate(SOImportBuffer."Debit Req Qty", GetValueAtCell(RowNo, 19));
            Evaluate(SOImportBuffer."Debit Ship Qty", GetValueAtCell(RowNo, 20));
            Evaluate(SOImportBuffer."Debit Open Qty", GetValueAtCell(RowNo, 21));
            Evaluate(SOImportBuffer."Adj. Cost", GetValueAtCell(RowNo, 22));
            Evaluate(SOImportBuffer."Adj. Resale", GetValueAtCell(RowNo, 23));
            Evaluate(SOImportBuffer.DBC, GetValueAtCell(RowNo, 24));
            Evaluate(SOImportBuffer."Debit Open Qty Percentage", GetValueAtCell(RowNo, 25));
            Evaluate(SOImportBuffer."Is MQ", GetValueAtCell(RowNo, 26));
            Evaluate(SOImportBuffer.DistiShiptoname, GetValueAtCell(RowNo, 27));
            Evaluate(SOImportBuffer."Customer City", GetValueAtCell(RowNo, 28));
            Evaluate(SOImportBuffer."Customer State", GetValueAtCell(RowNo, 29));
            Evaluate(SOImportBuffer."Customer Zip", GetValueAtCell(RowNo, 30));
            Evaluate(SOImportBuffer."Customer Country", GetValueAtCell(RowNo, 31));
            Evaluate(SOImportBuffer."End Customer City", GetValueAtCell(RowNo, 32));
            Evaluate(SOImportBuffer."End Customer State", GetValueAtCell(RowNo, 33));
            Evaluate(SOImportBuffer."End Customer Zip", GetValueAtCell(RowNo, 34));
            Evaluate(SOImportBuffer."End Customer Country", GetValueAtCell(RowNo, 35));
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












