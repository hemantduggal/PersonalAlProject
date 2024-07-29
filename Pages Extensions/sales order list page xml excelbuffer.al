/// <summary>
/// PageExtension ItemExt (ID 50149) extends Record Sales Order List.
/// </summary>

pageextension 50148 salesExt extends "Sales Order List"
{


    actions
    {
        addafter("F&unctions")
        {

            action(Importlines)
            {
                Caption = 'import sales order';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin

                    Xmlport.Run(50105, false, true);
                end;
            }
            action(exportItems)
            {
                Caption = 'export sales list';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::Exportsalesorderlist, true, false);
                end;
            }
            action("import via excel buffer")
            {
                Caption = 'Import via excel buffer';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'import data from excel ';
                trigger OnAction()
                var
                begin
                    ReadExcelSheet();
                    importexceldata();

                end;
            }

            action("export via excel buffer")
            {
                Caption = 'export';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                trigger OnAction()
                var
                begin
                    ExportExcelEntries(Rec);

                end;
            }

            action("Import&Post")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction()
                var
                    si: record "Sales Invoice Header";
                    sil: record "Sales Invoice Line";
                    sl: record "Sales Line";
                    head: Record "Sales Header";
                begin

                    Xmlport.Run(50003, false, true);
                    //PostDocument();
                    // Codeunit.Run(50007);
                    // head.Reset();
                    // head.SetRange("No.", rec."No.");
                    // // head.SetRange("Document Type", Rec."Document Type"::Order);
                    // if head.FindFirst() then
                    Post();
                    // PostDocument();

                    // Createsaleorder1();
                    // Createsaleorder2(sil);

                    Message('Data uploaded and Posted ');
                end;
            }


        }

    }
    var
        transname: Code[10];
        filename: text[100];
        sheetname: text[100];
        codes: Codeunit 80;
        tempexcelbuffer: Record "Excel Buffer" temporary;
        uploadmsg: Label 'please choose the excel file ';
        nofilemsg: Label 'no excel file found';
        batchisblankmsg: label 'transaction name is blank ';
        excelimportsuccess: Label 'excel imported successfully';

    local procedure ReadExcelSheet()
    var
        myInt: Integer;
        filemanagement: Codeunit "File Management";
        istream: InStream;
        fromfile: Text[100];
    begin
        UploadIntoStream(uploadmsg, '', '', fromfile, istream);
        if fromfile <> '' then begin
            filename := filemanagement.GetFileName(fromfile);
            sheetname := tempexcelbuffer.SelectSheetsNameStream(istream);

        end else
            Error(nofilemsg);
        tempexcelbuffer.Reset();
        tempexcelbuffer.DeleteAll();
        tempexcelbuffer.OpenBookStream(istream, sheetname);
        tempexcelbuffer.ReadSheet();

    end;



    local procedure GetValueAtCell(RowNo: integer; ColNo: Integer): Text
    begin
        tempexcelbuffer.Reset();
        if tempexcelbuffer.get(RowNo, ColNo) then
            exit(tempexcelbuffer."Cell Value as Text")
        else
            exit('');


    end;

    local procedure importexceldata()
    var
        myInt: Integer;
        gsimportbuffer: Record "Sales Header";
        rowno: integer;
        colno: integer;
        lineno: Integer;
        no: Code[20];
        maxrow: Integer;
    begin
        rowno := 0;
        colno := 0;
        maxrow := 0;
        lineno := 0;

        gsimportbuffer.Reset();
        if gsimportbuffer.FindLast() then
            no := gsimportbuffer."No.";
        tempexcelbuffer.Reset();
        if tempexcelbuffer.FindLast() then begin
            maxrow := tempexcelbuffer."Row No.";

        end;
        for rowno := 2 to maxrow do begin
            //     lineno := lineno + 10000;
            no := no;


            GSImportBuffer.Init();

            GSImportBuffer."Line No." := LineNO;

            Evaluate(GSImportBuffer."No.", GetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer."Sell-to Customer No.", GetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer."Sell-to Customer Name", GetValueAtCell(RowNo, 3));
            Evaluate(GSImportBuffer."External Document No.", GetValueAtCell(RowNo, 4));
            Evaluate(GSImportBuffer."Location Code", GetValueAtCell(RowNo, 5));
            Evaluate(GSImportBuffer."Document Date", GetValueAtCell(RowNo, 7));
            Evaluate(GSImportBuffer.Status, GetValueAtCell(RowNo, 8));
            Evaluate(GSImportBuffer."Combine Shipments", GetValueAtCell(RowNo, 9));
            Evaluate(GSImportBuffer."Amt. Ship. Not Inv. (LCY)", GetValueAtCell(RowNo, 10));
            Evaluate(GSImportBuffer."Amt. Ship. Not Inv. (LCY) Base", GetValueAtCell(RowNo, 11));
            Evaluate(GSImportBuffer.Amount, GetValueAtCell(RowNo, 12));
            Evaluate(GSImportBuffer."Amount Including VAT", GetValueAtCell(RowNo, 13));

            GSImportBuffer.Insert();


        end;
        Message(ExcelImportSuccess);
    end;




    local procedure ExportExcelEntries(var GSExel: Record "Sales Header")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        GSEntriesLbl: Label 'GS sales order Excel Entries';
        ExcelFileName: Label 'GSExcel Entries_%1_%2';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn(GSExel.FieldCaption("No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Sell-to Customer No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Sell-to Customer Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("External Document No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Location Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Document Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption(Status), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Combine Shipments"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Amt. Ship. Not Inv. (LCY)"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Amt. Ship. Not Inv. (LCY) Base"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption(Amount), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GSExel.FieldCaption("Amount Including VAT"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        if GSExel.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(GSExel."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Sell-to Customer No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Sell-to Customer Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."External Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Location Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(GSExel."Document Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(GSExel.Status, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(GSExel."Combine Shipments", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(GSExel."Amt. Ship. Not Inv. (LCY)", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GSExel."Amt. Ship. Not Inv. (LCY) Base", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GSExel.Amount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GSExel."Amount Including VAT", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);


            until GSExel.Next() = 0;


        TempExcelBuffer.CreateNewBook(GSEntriesLbl);
        TempExcelBuffer.WriteSheet(GSEntriesLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();

    end;


    local procedure Post()
    var
        myInt: Integer;
    begin
        PostSalesOrder(CODEUNIT::"Sales-Post (Yes/No)", Enum::"Navigate After Posting"::"Posted Document");
    end;

    protected procedure PostSalesOrder(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    var
        SalesHeader: Record "Sales Header";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        InstructionMgt: Codeunit "Instruction Mgt.";
        IsHandled: Boolean;
    begin
        OnBeforePostSalesOrder(Rec, PostingCodeunitID, Navigate);
        // LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);

        Rec.SendToPosting(PostingCodeunitID);
        CurrPage.Update(false);

        IsHandled := false;
        // OnPostDocumentBeforeNavigateAfterPosting(Rec, PostingCodeunitID, Navigate, DocumentIsPosted, IsHandled);
        if IsHandled then
            exit;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostSalesOrder(var SalesHeader: Record "Sales Header"; PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnPostDocumentBeforeNavigateAfterPosting(var SalesHeader: Record "Sales Header"; var PostingCodeunitID: Integer; var Navigate: Enum "Navigate After Posting"; DocumentIsPosted: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostOnAfterSetDocumentIsPosted(SalesHeader: Record "Sales Header"; var DocumentIsPosted: Boolean)
    begin
    end;

    var
        documentisposted: Boolean;


    ////
    // / 
    // / 

    // [Obsolete('Replaced by PostSalesOrder().', '18.0')]
    // procedure PostDocument()


    // begin
    //     // PostSalesOrder(PostingCodeunitID, "Navigate After Posting".FromInteger(Navigate));
    //     PostSalesOrder(CODEUNIT::"Sales-Post (Yes/No)", Enum::"Navigate After Posting"::"Posted Document");


    // end;

    // protected procedure PostSalesOrder(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    // var
    //     SalesHeader: Record "Sales Header";
    //     LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
    //     InstructionMgt: Codeunit "Instruction Mgt.";
    //     IsHandled: Boolean;
    // begin
    //     OnBeforePostSalesOrder(Rec, PostingCodeunitID, Navigate);
    //     if ApplicationAreaMgmtFacade.IsFoundationEnabled then
    //         LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);

    //     SendToPosting(PostingCodeunitID);

    //     // DocumentIsScheduledForPosting := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    //     // DocumentIsPosted := (not SalesHeader.Get("Document Type", "No.")) or DocumentIsScheduledForPosting;
    //     OnPostOnAfterSetDocumentIsPosted(SalesHeader, DocumentIsScheduledForPosting, DocumentIsPosted);

    //     CurrPage.Update(false);

    //     IsHandled := false;
    //     OnPostDocumentBeforeNavigateAfterPosting(Rec, PostingCodeunitID, Navigate, DocumentIsPosted, IsHandled);
    //     if IsHandled then
    //         exit;

    //     if PostingCodeunitID <> CODEUNIT::"Sales-Post (Yes/No)" then
    //         exit;

    //     case Navigate of
    //         "Navigate After Posting"::"Posted Document":
    //             begin
    //                 if InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode) then
    //                     ShowPostedConfirmationMessage();

    //                 if DocumentIsScheduledForPosting or DocumentIsPosted then
    //                     CurrPage.Close();
    //             end;
    //         "Navigate After Posting"::"New Document":
    //             if DocumentIsPosted then begin
    //                 Clear(SalesHeader);
    //                 SalesHeader.Init();
    //                 SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Order);
    //                 OnPostOnBeforeSalesHeaderInsert(SalesHeader);
    //                 SalesHeader.Insert(true);
    //                 PAGE.Run(PAGE::"Sales Order", SalesHeader);
    //             end;
    //     end;
    // end;

    // procedure SendToPosting(PostingCodeunitID: Integer) IsSuccess: Boolean
    // var
    //     ErrorContextElement: Codeunit "Error Context Element";
    //     ErrorMessageMgt: Codeunit "Error Message Management";
    //     ErrorMessageHandler: Codeunit "Error Message Handler";
    // begin
    //     if not IsApprovedForPosting() then
    //         exit;

    //     Commit();
    //     ErrorMessageMgt.Activate(ErrorMessageHandler);
    //     ErrorMessageMgt.PushContext(ErrorContextElement, rec.RecordId, 0, '');
    //     IsSuccess := CODEUNIT.Run(PostingCodeunitID, Rec);

    //     OnSendToPostingOnAfterPost(Rec);
    //     if not IsSuccess then
    //         ErrorMessageHandler.ShowErrors();
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnSendToPostingOnAfterPost(var SalesHeader: Record "Sales Header")
    // begin
    // end;

    // procedure IsApprovedForPosting() Approved: Boolean
    // var
    //     PrepaymentMgt: Codeunit "Prepayment Mgt.";
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeIsApprovedForPosting(Rec, Approved, IsHandled);
    //     if IsHandled then
    //         exit(Approved);

    //     if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then begin
    //         if PrepaymentMgt.TestSalesPrepayment(Rec) then
    //             // Error(PrepaymentInvoicesNotPaidErr, "Document Type", "No.");
    //         if rec."Document Type" = rec."Document Type"::Order then
    //                 if PrepaymentMgt.TestSalesPayment(Rec) then
    //                     // Error(Text072, "Document Type", "No.");
    //         Approved := true;
    //         OnAfterIsApprovedForPosting(Rec, Approved);
    //     end;
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeIsApprovedForPosting(var SalesHeader: Record "Sales Header"; var Approved: Boolean; var IsHandled: Boolean)
    // begin
    // end;



    // [IntegrationEvent(false, false)]
    // local procedure OnAfterIsApprovedForPosting(SalesHeader: Record "Sales Header"; var Approved: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterIsApprovedForPostingBatch(SalesHeader: Record "Sales Header"; var Approved: Boolean)
    // begin
    // end;


    // local procedure ShowPostedConfirmationMessage()
    // var
    //     OrderSalesHeader: Record "Sales Header";
    //     SalesInvoiceHeader: Record "Sales Invoice Header";
    //     InstructionMgt: Codeunit "Instruction Mgt.";
    // begin
    //     if not OrderSalesHeader.Get(OrderSalesHeader."Document Type", OrderSalesHeader."No.") then begin
    //         SalesInvoiceHeader.SetRange("No.", OrderSalesHeader."Last Posting No.");
    //         if SalesInvoiceHeader.FindFirst then
    //             if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedSalesOrderQst, SalesInvoiceHeader."No."),
    //                  InstructionMgt.ShowPostedConfirmationMessageCode)
    //             then
    //                 PAGE.Run(PAGE::"Posted Sales Invoice", SalesInvoiceHeader);
    //     end;
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforePostSalesOrder(var SalesHeader: Record "Sales Header"; PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeShowReleaseNotification(var SalesHeader: Record "Sales Header"; var Result: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforeValidateShipToOptions(var SalesHeader: Record "Sales Header"; ShipToOptions: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address"; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnPostOnAfterSetDocumentIsPosted(SalesHeader: Record "Sales Header"; var IsScheduledPosting: Boolean; var DocumentIsPosted: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnPostOnBeforeSalesHeaderInsert(var SalesHeader: Record "Sales Header")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateShipToOptionsOnAfterShipToAddressListGetRecord(var ShipToAddress: Record "Ship-to Address"; var SalesHeader: Record "Sales Header")
    // begin
    // end;

    // [IntegrationEvent(true, false)]
    // local procedure OnPostDocumentBeforeNavigateAfterPosting(var SalesHeader: Record "Sales Header"; var PostingCodeunitID: Integer; var Navigate: Enum "Navigate After Posting"; DocumentIsPosted: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    // var
    //     DocumentIsPosted: Boolean;
    //     ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    //     DocumentIsScheduledForPosting: Boolean;
    //     OpenPostedSalesOrderQst: Label 'The order is posted as number %1 and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";




    ////
    /// 
    /// 
    /// 
    procedure Createsaleorder1()
    var
        sh: Record "Sales shipment Header";
        sh1: Record "Sales Invoice Header";
        Noseriemgmt: Codeunit NoSeriesManagement;
        InventorySetup: Record "Sales & Receivables Setup";
        sl: Record "Sales Invoice Line";
        Shead: Record "Sales Header";
    begin
        Shead.Reset();
        Shead.SetRange("Document Type", Rec."Document Type"::Order);
        Shead.SetRange("No.", Rec."No.");
        // if Shead.FindLast() then
        sh.Reset();
        sh.Init;
        sh."No." := '';
        sh."Order No." := Shead."No.";
        sh.Insert(true);
        sh."Document Date" := Shead."Document Date";
        sh."Sell-to Customer No." := Shead."Sell-to Customer No.";
        sh."Sell-to Customer Name" := Shead."Sell-to Customer Name";
        sh."Location Code" := Shead."Location Code";
        sh.Modify();

        Createsaleorder2(sh);
        Message('Document sent successfully with document No. %1', sh."No.");
        page.Run(142, sl, sh."No.");

    END;

    local procedure Createsaleorder2(sl: Record "Sales Shipment Header")

    var
        TLRec: Record "Sales Shipment Line";
        NextLineNo: Integer;
        TLRec1: Record "Sales Invoice Line";
        IndentLine: Record "Sales Line";
        ResLine: Record "Sales Line";
        sh: Record "Sales Invoice Header";

    begin

        TLRec.Reset();
        TLRec.SetRange("Document No.", rec."No.");
        if TLRec.FindLast() then
            NextLineNo := TLRec1."Line No."
        else
            NextLineNo := 0;


        ResLine.Reset();
        ResLine.SetRange("Document No.", sh."No.");
        if ResLine.FindSet() then begin
            repeat
                TLRec.Init;
                TLRec."No." := sh."No.";
                NextLineNo := NextLineNo + 10000;
                TLRec."Line No." := NextLineNo;
                TLRec."Order No." := ResLine."Document No.";
                TLRec.Insert();
                TLRec.Type := ResLine.Type;
                TLRec."No." := ResLine."No.";
                TLRec.Description := ResLine.Description;
                TLRec.Quantity := ResLine.Quantity;
                tlrec."Quantity (Base)" := ResLine.Quantity;
                TLRec."Location Code" := ResLine."Location Code";
                TLRec."Order No." := ResLine."Document No.";
                TLRec.Modify();
            until ResLine.Next() = 0;

        end;
    end;


    // trigger OnOpenPage()
    // var
    //     s: record "Sales Header";
    // begin
    //     if s.FindFirst() then
    //         s.DeleteAll();
    // end;


}