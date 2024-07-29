report 50013 "General ledger report"
{
    ApplicationArea = All;
    Caption = 'General ledger report';
    UsageCategory = ReportsAndAnalysis;
    // DefaultLayout = RDLC;
    ProcessingOnly = true;
    // RDLCLayout = 'ReportLayout\GeneralLedger.rdl';
    dataset
    {
        dataitem(GLEntry; "G/L Entry")
        {
            DataItemTableView = sorting("Document No.");

            trigger OnPreDataItem()
            var
            begin
                SetRange("Posting Date", startdate, enddate);
                makeheader();

                if "Document No." <> '' then
                    SetRange("Document No.", "Document No.");
                i := 0;
                j := 0;

            end;

            trigger OnAfterGetRecord()
            var


            begin
                gle.Reset();
                if GLEntry."Document No." <> '' then
                    gle.SetRange("Document No.", GLEntry."Document No.");
                if gle.FindSet() then
                    i := gle.Count;
                j += 1;
                if j = 1 then
                    makeheading();
                // if j > 1 then
                //     makefooter();
                if (j > 1) and (j <= i) then
                    MakeBody();
                if j > i then
                    j := 0;


                Clear(totals);
                // makeheading();
                // MakeBody();


                glacc.Reset();
                if glacc.Get(GLEntry."Bal. Account No.") then;

                // postednarration.reset();
                // if postednarration.get(glentry."Document No.") then
                //     pnarration := postednarration.narration;

                posinv.Reset();
                if posinv.Get(GLEntry."Document No.") then;


                // ClosingBalance := Amount;

                // GLE.Reset();
                // GLE.SetRange("Document No.", GLEntry."Document No.");
                // if GLEntry.FindFirst() then begin
                //     repeat
                //         drtotal += GLEntry."Debit Amount";
                //         crtotal += GLEntry."Credit Amount";
                //     until GLEntry.Next() = 0;
                // end;


                //     ExcelBuffer.NewRow();
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.AddColumn('Total', FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.AddColumn(drtotal, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.AddColumn(crtotal, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                //     ExcelBuffer.NewRow();
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //     ExcelBuffer.AddColumn('Closing Balance', FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::text);
                //     ExcelBuffer.AddColumn(ClosingBalance, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                // end;
            end;

            trigger OnPostDataItem()
            var
            begin
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('Total', FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(drtotal, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(crtotal, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Closing Balance', FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::text);
                ExcelBuffer.AddColumn(ClosingBalance, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Number);

            end;







        }


    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {

                    field(grossamount; grossamount)
                    {
                        ApplicationArea = all;
                        Caption = 'Gross Amount';
                    }
                    // field(PrintAmountInLCY; PrintAmountInLCY)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Print Amounts in LCY';
                    //     ToolTip = 'Specifies if you want the report to specify the aging per vendor ledger entry.';
                    // }
                    // field(AgingBy; AgingBy)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Aging by';
                    //     OptionCaption = 'Due Date,Posting Date';
                    //     ToolTip = 'Specifies if the aging will be calculated from the due date, the posting date, or the document date.';
                    // }
                    field(narrartion; narrartion)
                    {
                        ApplicationArea = all;
                        caption = 'Narration';
                    }
                    field(linenarration; linenarration)
                    {
                        ApplicationArea = all;
                        Caption = 'Narration';
                    }
                    field(UseExternalDocNo; UseExternalDocNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use External Document No.';
                        ToolTip = 'Specifies if you want to print the vendor''s document numbers, such as the invoice number, on all transactions. Clear this check box to print only internal document numbers.';
                    }
                    field(invoicedate; invoicedate)
                    {
                        ApplicationArea = all;
                        caption = 'External Document Date';
                    }
                    field(startdate; startdate)
                    {
                        ApplicationArea = all;
                        Caption = 'Start Date';
                    }
                    field(enddate; enddate)
                    {
                        ApplicationArea = all;
                        Caption = 'End Date';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;

        if startdate = 0D then
            Error('From Date must have value');
        if enddate = 0D then
            Error('To Date must have value');

        ExcelBuffer.DELETEALL;
        if UseExternalDocNo then
            DocNoCaption := ExternalDocumentNoCaptionLbl
        else
            DocNoCaption := DocumentNoCaptionLbl;


    end;

    trigger OnPostReport()
    begin
        ExcelBuffer.CreateNewBook('General Ledger Report');
        ExcelBuffer.WriteSheet('General Ledger Report', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(StrSubstNo('General Ledger Report', CurrentDateTime, UserId));
        ExcelBuffer.OpenExcel();


    end;


    var
        CompanyInfo: Record "Company Information";
        startdate: date;
        enddate: Date;
        ClosingBalance: Decimal;
        totals: Decimal;
        openingbalance: Decimal;
        ExcelBuffer: Record "Excel Buffer";
        glacc: Record "G/L Account";
        // postednarration: Record "Posted Narration";
        posinv: record "Purch. Inv. Header";
        grossamount: boolean;
        PrintAmountInLCY: Boolean;
        AgingBy: Option "Due Date","Posting Date","Document Date";
        narrartion: Boolean;
        linenarration: boolean;
        invoiceno: code[20];
        invoicedate: Boolean;
        PrintDetails: Boolean;
        UseExternalDocNo: Boolean;
        DueDateCaptionLbl: Label 'Due Date';
        DocumentNoCaptionLbl: Label 'Document No.';
        ExternalDocumentNoCaptionLbl: Label 'External Document No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DocumentTypeCaptionLbl: Label 'Document Type';
        DocNoCaption: Text;
        DocumentNo: Code[35];
        HeaderText: array[5] of Text[30];
        Text009: Label 'Due Date,Posting Date,Document Date';
        AllAmtsinLCYCaptionLbl: Label 'All Amounts in LCY';
        GrandTotalVLE5RemAmtLCYCaptionLbl: Label 'Balance';
        AmountLCYCaptionLbl: Label 'Original Amount';
        HeadingType: Option "Date Interval","Number of Days";
        pnarration: text;






    procedure makeheading()
    var
    begin
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn(, FALSE, '', true, FALSE, true, '', ExcelBuffer."Cell Type"::Text);


    end;

    procedure MakeBody()
    begin
        clear(grosamtdr);
        clear(grosamtcr);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(GLEntry."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn(GLEntry."Document No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(GLEntry."Document Type", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn(GLEntry.Description + '/' + glacc.Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn(GLEntry."Debit Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(GLEntry."Credit Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number);
        if grossamount = true then begin
            grosamtdr := GLEntry."Debit Amount";
            grosamtcr := GLEntry."Credit Amount";
            if GLEntry."Debit Amount" <> 0 then
                ExcelBuffer.AddColumn(grosamtdr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number)
            else
                ExcelBuffer.AddColumn(grosamtcr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number);
        end
        else
            if grossamount = false then begin
                ExcelBuffer.AddColumn(GLEntry."Debit Amount" - GLEntry."Credit Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number);
            end;
        if GLEntry."Credit Amount" <> 0 then
            ExcelBuffer.AddColumn('Cr', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text)
        else
            ExcelBuffer.AddColumn('Dr', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        if UseExternalDocNo = true
   then begin
            ExcelBuffer.AddColumn(GLEntry."External Document No.", FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.AddColumn(glentry."Document Date", FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        end
        else
            ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);


        if narrartion = true then begin
            ExcelBuffer.NewRow();
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            // ExcelBuffer.AddColumn(posinv.narration, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        end;

        if linenarration = true then begin
            ExcelBuffer.NewRow();
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
            ExcelBuffer.AddColumn(pnarration, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        end;

    end;

    procedure makeheader()
    begin

        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn(CompanyInfo.Address + '' + CompanyInfo."Address 2" + '' + CompanyInfo.City + '-' + CompanyInfo."State Code" + ',' + CompanyInfo."Post Code" + '', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn('CIN:', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(CompanyInfo.CIN, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn('GSTIN :', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo."GST Registration No.", FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

        ExcelBuffer.AddColumn('General Ledger', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('Period: From ', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(startdate, FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn('to', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(enddate, FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('Account Name', FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(GLEntry."G/L Account Name", FALSE, '', false, FALSE, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Voucher Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Voucher Name', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Voucher Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Description/opposite Head', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Debit', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Credit', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Balance', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);

        if UseExternalDocNo = true
        then begin
            ExcelBuffer.AddColumn('Invoice No', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.AddColumn('Invoice Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);
        end
        else
            ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer."Cell Type"::Text);





    end;

    // local procedure CreateHeadings()
    // var
    //     i: Integer;
    // begin
    //     if AgingBy = AgingBy::"Due Date" then begin
    //         HeaderText[1] := '';
    //         i := 2;
    //     end else
    //         i := 1;
    //     while i < ArrayLen(PeriodEndDate) do begin
    //         if HeadingType = HeadingType::"Date Interval" then
    //             HeaderText[i] := StrSubstNo('%1\..%2', PeriodStartDate[i], PeriodEndDate[i])
    //         else
    //             HeaderText[i] :=
    //               StrSubstNo('%1 - %2 %3', enddate - PeriodEndDate[i] + 1, enddate - PeriodStartDate[i] + 1, Text002);
    //         i := i + 1;
    //     end;
    //     if HeadingType = HeadingType::"Date Interval" then
    //         HeaderText[i] := StrSubstNo('%1\%2', BeforeTok, PeriodStartDate[i - 1])
    //     else
    //         HeaderText[i] := StrSubstNo('%1 %2 %3', BeforeTok, enddate - PeriodStartDate[i - 1] + 1, Text002);
    // end;


    procedure InitializeRequest(Newenddate: Date; NewAgingBy: Option; NewPeriodLength: DateFormula; NewPrintAmountInLCY: Boolean; NewPrintDetails: Boolean; NewHeadingType: Option; NewNewPagePerVendor: Boolean)
    begin
        enddate := Newenddate;
        AgingBy := NewAgingBy;
        PrintAmountInLCY := NewPrintAmountInLCY;
        PrintDetails := NewPrintDetails;

    end;

    var
        grosamtdr: Decimal;
        grosamtcr: Decimal;
        docdate: Boolean;
        i: Integer;
        j: Integer;
        gle: record "G/L entry";
        drtotal: decimal;
        crtotal: Decimal;
}
