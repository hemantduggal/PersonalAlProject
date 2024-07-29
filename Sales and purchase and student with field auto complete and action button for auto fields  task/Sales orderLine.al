/// <summary>
/// PageExtension salesorderext (ID 50107) extends Record Sales Order.
/// </summary>
pageextension 50107 salesorderextenstion extends "Sales Order Subform"
{
    layout
    {
        // modify("No.")
        // {
        //     trigger OnAfterValidate()
        //     var
        //         item: record Item;
        //     begin
        //         if item.Get() then begin
        //             rec."ItemUnitMeasure code" := item."ItemUnitMeasure code";
        //         end;
        //     end;
        // }
        // Add changes to page layout here
        addafter("No.")
        {

            field(Weight; Rec.Weight)
            {
                ApplicationArea = all;
            }
            field("Size (in cm)"; Rec."Size (in cm)")
            {
                ApplicationArea = all;
            }
            field("ItemUnitMeasure code"; Rec."ItemUnitMeasure code")
            {
                ApplicationArea = all;
            }
            field(closingfrequency; Rec.closingfrequency)
            {
                ApplicationArea = all;
                trigger OnLookup(var Text: Text): Boolean
                var
                    masterdate: Record mastertable;
                begin
                    masterdate.Reset();
                    if page.RunModal(page::masterpage, masterdate) = Action::LookupOK then begin
                        Evaluate(rec.closingfrequency, masterdate.no);
                    end;
                end;

            }

            field(Item_no; Rec.Item_no)
            {
                ApplicationArea = all;

            }
            field(sales_type; Rec.sales_type)
            {
                ApplicationArea = all;
            }
            field(sales_code; Rec.sales_code)
            {
                ApplicationArea = all;
            }
            field(location; Rec.location)
            {
                ApplicationArea = all;
            }
            field(start_date; Rec.start_date)
            {
                ApplicationArea = all;
            }
            field(end_date; Rec.end_date)
            {
                ApplicationArea = all;
            }
            field("Unit Cost"; Rec."Unit Cost") { ApplicationArea = all; }

            field(StudentNO; Rec.StudentNO)
            {
                ApplicationArea = all;
            }
            field("External Doc no"; Rec."External Doc no")
            {
                ApplicationArea = all;
                caption = 'External doc no';
            }

            field(StudentSubject; Rec.StudentSubject)
            {
                Caption = 'StudentSubjects';
                ApplicationArea = All;


                // trigger OnAfterLookup(Selected: RecordRef)
                // var
                //     salesRec: Record "Sales Line";
                // begin
                //     salesRec.Reset();
                //     if page.RunModal(Page::"Sales Order", salesRec) = Action::LookupOK then
                //         REc.StudentSubject := salesRec.StudentSubject;

                // end;
            }
            field(Marks; Rec.Marks)
            {
                Caption = 'marks';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field("Date of birth"; Rec."Date of birth")
            {
                Caption = 'dateofbirth';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(Age; Rec.Age)
            {
                Caption = 'Age';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(item_category_code; Rec.item_category_code)
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin

                end;

            }
            field(HEat_no; Rec.HEat_no)
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin

                end;

            }
            field(Billet_no; Rec.Billet_no)
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin

                end;

            }
            field(Size; Rec.Size)
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin

                end;
            }
            field(Dia; Rec.Dia)
            {
                ApplicationArea = all;
                trigger OnValidate();
                begin

                end;
            }




        }
    }
    actions
    {
        addafter("F&unctions")
        {
            action(ImportSalesLine)
            {
                Caption = 'import sales line through xml port';
                // Promoted = true;
                // PromotedCategory = Process;
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::"Sales Price Xml port", false, true);
                end;

            }
            action("Export sales line")
            {
                caption = 'export sales line';
                Image = Export;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    xmlport.Run(Xmlport::"export Sales line", true, false);
                end;
            }
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                // Promoted = true;
                // PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                begin
                    if BatchName = '' then
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
        SOImportBuffer: Record "Sales Line";
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
        if SOImportBuffer.FindLast() then;
        LineNo := SOImportBuffer."Line No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        for RowNo := 1 to MaxRowNo do begin
            LineNo := LineNo + 10000;
            SOImportBuffer.Init();
            SOImportBuffer."Document Type" := SOImportBuffer."Document Type"::Order;
            Evaluate(SOImportBuffer."Document No.", GetValueAtCell(RowNo, 1));
            Evaluate(SOImportBuffer."Line No.", GetValueAtCell(RowNo, 2));
            // Message('%1', SOImportBuffer."Document No.");
            if SOImportBuffer.Insert(true) then
                Evaluate(SOImportBuffer.Type, GetValueAtCell(RowNo, 3));
            Evaluate(SOImportBuffer."No.", GetValueAtCell(RowNo, 4));
            evaluate(SOImportBuffer.Description, GetValueAtCell(RowNo, 5));
            Evaluate(SOImportBuffer.Quantity, GetValueAtCell(RowNo, 6));
            Evaluate(SOImportBuffer."Unit of Measure", GetValueAtCell(RowNo, 7));
            SOImportBuffer.Modify(true);
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