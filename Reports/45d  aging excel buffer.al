/// <summary>
/// Report 45D Excel buffer report (ID 50024).
/// </summary>
report 50024 "45D Excel buffer report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {

            //DataItemTableView = where("Document Type" = const(Invoice), Open = const(true));
            dataitemtableview = sorting("Document No.", "Customer No.") order(ascending);


            trigger OnAfterGetRecord()
            var

            begin
                if currCustNo = '' then begin
                    currCustNo := "Customer No.";
                    I := 0;
                    CustomerNorecCounter := entrycount(currCustNo);

                end;
                i += 1;
                if i = 1 then
                    MakeExceldata(true, false);
                if (i > 1) and (i <> CustomerNorecCounter) then
                    MakeExceldata(false, false);
                if i = CustomerNorecCounter then begin
                    MakeExceldata(false, true);
                    currCustNo := '';
                end;
                Clear(col1Days);
                Clear(col2Days);
                Clear(col3Days);
                Clear(col4Days);
                Clear(col5Days);
                Clear(col6Days);

                NoOfdays := (ToDate - "Due Date");


                if (NoOfdays >= 0) And (NoOfdays <= 45) then
                    col1Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays > 46) And (NoOfdays <= 90) then
                    col2Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays > 91) And (NoOfdays <= 135) then
                    col3Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays > 136) And (NoOfdays <= 180) then
                    col5Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays > 181) And (NoOfdays <= 225) then
                    col5Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays > 225) then
                    col6Days := "Cust. Ledger Entry"."Remaining Amount";
                if "Cust. Ledger Entry"."Remaining Amount" <> 0 then begin
                    TOtalAMt1 += col1Days;
                    TOtalAMt2 += col2Days;
                    TOtalAMt3 += col3Days;
                    TOtalAMt4 += col4Days;
                    TOtalAMt5 += col5Days;
                    TOtalAMt6 += col6Days;












                end;

            end;



            // trigger OnPreDataItem()
            // var
            // begin
            //     makeheader();
            //     if "Customer No." <> '' then
            //         SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
            //     i := 0;
            //     j := 0;


            //     //for date

            //     if ToDate = 0D then begin
            //         ToDate := Today;
            //         SetRange("Due Date");
            //     end else
            //         SetRange("Due Date", 0D, ToDate);
            // end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    Caption = 'Date Filters';
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'To Date';
                        trigger OnValidate()
                        begin

                        end;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        //ExcelBuffer.DELETEALL;
        makeexcelinfo();

    end;

    trigger OnPostReport()
    begin

        ExcelBuffer.CreateNewBook('45D Receivable Aging Report');
        ExcelBuffer.WriteSheet('45D Receivable Aging Report', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(StrSubstNo('45D Receivable Aging Report', CurrentDateTime, UserId));
        ExcelBuffer.OpenExcel();

    end;










    var
        RecCust: Record "Cust. Ledger Entry";
        ExcelBuffer: Record "Excel Buffer";
        ToDate: Date;
        col1Days: Decimal;
        col2Days: Decimal;
        col3Days: Decimal;
        col4Days: Decimal;
        col5Days: Decimal;
        col6Days: Decimal;
        NoOfdays: Integer;
        CompanyInfo: Record "Company Information";
        TOtalAMt: Decimal;
        TOtalRemainAMt: Decimal;
        TOtalAMt1: Decimal;
        TOtalAMt2: Decimal;
        TOtalAMt3: Decimal;
        TOtalAMt4: Decimal;
        TOtalAMt5: Decimal;
        TOtalAMt6: Decimal;
        TOtalAMtcolwise: Decimal;
        cust: Record Customer;
        Balance: Decimal;
        i: Decimal;
        CustomerNorecCounter: Integer;
        currCustNo: Code[20];
        j: Decimal;


    local procedure Makeheader()

    var
        myint: integer;
    begin
        // ExcelBuffer.NewRow;
        // ExcelBuffer.NewRow;
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow;
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(CompanyInfo.Address, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(CompanyInfo."Address 2", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow;
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('45D Receivable Aging Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow;
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn('Doc. No.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Doc. Type', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Posting Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Due date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Orig. Amount.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Rem.Amount.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('( 0-45 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('( 46 - 90 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('( 91 - 135 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('( 136 - 180 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('( 181 - 225 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('(>=225) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);


    end;

    // local procedure makeheading()
    // begin
    //     ExcelBuffer.NewRow();
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer No.", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer Name", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
    // end;

    // local procedure MakeBody()
    // var
    //     myInt: Integer;

    // begin

    //     ExcelBuffer.NewRow;
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Document No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Document Type", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Due Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::date);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Original Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn("Cust. Ledger Entry"."Remaining Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number);
    //     ExcelBuffer.AddColumn(col1Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn(col2Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn(col3Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn(col4Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn(col5Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
    //     ExcelBuffer.AddColumn(col6Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);




    // end;

    /// <summary>
    /// CreateExcelBook.
    /// </summary>
    Local procedure CreateExcelBook();
    begin
        ExcelBuffer.CreateNewBook('45D Receivable Aging Report');
        ExcelBuffer.WriteSheet('45D Receivable Aging Report', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(StrSubstNo('45D Receivable Aging Report', CurrentDateTime, UserId));
        ExcelBuffer.OpenExcel();

    end;

    local procedure entrycount(custno: Code[20]): integer
    begin
        "Cust. Ledger Entry".SetRange("Customer No.", custno);
        if "Cust. Ledger Entry".FindSet then
            exit("Cust. Ledger Entry".Count);
    end;


    local procedure MakeExceldata(isheader: Boolean; isfooter: Boolean);
    begin
        if isheader then begin
            ExcelBuffer.NewRow();
            // ExcelBuffer.AddColumn("Cust. Ledger Entry".FieldCaption("Customer No."), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer No.", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
            for j := 1 to 6 do
                ExcelBuffer.AddColumn('', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.NewRow();

        end;
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Document No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Document Type", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Due Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Original Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Remaining Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::number);
        ExcelBuffer.AddColumn(col1Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(col2Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(col3Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(col4Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(col5Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn(col6Days, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);

        if isfooter then begin
            ExcelBuffer.NewRow();
            ExcelBuffer.AddColumn('Total For C', false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer No.", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
            for j := 1 to 6 do
                ExcelBuffer.AddColumn('', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            ExcelBuffer.NewRow();
        end;



    end;

    local procedure makeexcelinfo()
    begin
        ExcelBuffer.SetUseInfoSheet();
        ExcelBuffer.NewRow;
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo.Address, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo."Address 2", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('45D Receivable Aging Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Doc. No.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Doc. Type', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Posting Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Due date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Orig. Amount.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Rem.Amount.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('( 0-45 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('( 46 - 90 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('( 91 - 135 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('( 136 - 180 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('( 181 - 225 ) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('(>=225) Days', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);


    end;

}