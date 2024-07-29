report 50017 BillwiseagingReportNew
{
    UsageCategory = Administration;
    Caption = 'Bill Wise Customer Ageing Repor NEW';
    ApplicationArea = all;
    //ProcessingOnly = true;
    //DefaultLayout = RDLC;
    UseRequestPage = true;
    RDLCLayout = 'ReportLayout\BillwiseAgingNEW.rdl';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            //   DataItemTableView = where("Document Type" = const(Invoice), "Remaining Amount" = filter(> 0), Open = const(true));
            // column(Zone; cust.zone)
            // { }
            column(caption; slab)
            {

            }
            column(salepname; salepname.Name)
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            { }
            column(thirty; ZeroToThirty)
            {

            }

            column(thirtysixty; ThirtyoneToSixty)
            {

            }
            column(sixtyninty; SixtyOneToNinty)
            {

            }
            column(nintyonetwenty; NintyOneToOneTwenty)
            {

            }
            column(onetwentyoneeighty; TwentyOnetoOneEighty)
            {

            }
            column(greateroneeighty; greatherOneEighty)
            {

            }
            column(startdate; format(startdate)) { }
            column(ToDate; format(ToDate)) { }
            column(Document_No_; "Document No.")
            {

            }
            column(cust; cust.CalcFields("Balance (LCY)"))
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Balance; Balance)
            { }
            column(Posting_Date; format("Posting Date"))
            { }
            column(Document_Type; "Document Type")
            { }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAdd2; CompanyInfo."Address 2")
            {

            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {

            }
            // column(Due_Date; format("posting Date"))
            // {

            // }
            column(Due_Date; format("Posting Date"))
            {

            }
            column(Original_Amount; "Original Amount")
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(CompanyInfoname; CompanyInfo.Name)
            {

            }

            column(Customer_No_; "Customer No.")
            {

            }
            column(col1Days; col1Days)
            { }
            column(col2Days; col2Days)
            { }
            column(col3Days; col3Days)
            { }
            column(col4Days; col4Days)
            { }
            column(col5Days; col5Days)
            { }
            column(col6Days; col6Days)
            { }
            column(TOtalAMt; TOtalAMt)
            { }
            column(TOtalAMt1; TOtalAMt1)
            { }
            column(calculateage; calculateage) { }
            // column(paymentterm; paymentterm) { }
            column(paymentterm; customerrec."Payment Terms Code") { }
            column(TOtalAMt2; TOtalAMt2) { }

            column(TOtalRemainAMt; TOtalRemainAMt) { }

            column(TOtalAMt3; TOtalAMt3) { }
            column(TOtalAMt4; TOtalAMt4) { }
            column(TOtalAMt5; TOtalAMt5) { }
            column(TOtalAMt6; TOtalAMt6) { }
            column(TOtalAMtcolwise; TOtalAMtcolwise) { }

            trigger OnAfterGetRecord()
            var

            begin
                if salepname.get("Salesperson Code") then;

                if customerrec.get("Customer No.") then;
                Clear(calculateage);
                Clear(paymentterm);
                Clear(col1Days);
                Clear(col2Days);
                Clear(col3Days);
                Clear(col4Days);
                Clear(col5Days);
                Clear(col6Days);
                Clear(startdatedays);
                Clear(enddatedays);


                ///////////
                "Cust. Ledger Entry".CalcFields("Remaining Amount");
                //   startdatedays := (startdate - "posting Date");
                // enddatedays := (ToDate - "posting Date");
                NoOfdays := (ToDate - "posting Date");

                Evaluate(from, arr[1]);
                Evaluate(too, arr[2]);
                Evaluate(from2, arr[3]);
                Evaluate(too3, arr[4]);
                Evaluate(from3, arr[5]);
                Evaluate(too3, arr[6]);


                //Message('%1', NoOfdays);
                // if ZeroToThirty <> 0 then begin
                if (NoOfdays >= from) And (NoOfdays <= too) then
                    col1Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays >= from2) And (NoOfdays <= too2) then
                    col2Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays >= from3) And (NoOfdays <= too3) then
                    col3Days := "Cust. Ledger Entry"."Remaining Amount";
                if (NoOfdays >= from4) And (NoOfdays <= too4) then
                    col4Days := "Cust. Ledger Entry"."Remaining Amount";


                //     // Message('%1', col1Days);
                // end;
                // if ThirtyoneToSixty <> 0 then begin
                // if (NoOfdays > 30) And (NoOfdays <= 60) then
                //     col2Days := "Cust. Ledger Entry"."Remaining Amount";
                // //     //  Message('%1', col2Days);
                // // end;
                // // if SixtyOneToNinty <> 0 then begin
                // if (NoOfdays > 60) And (NoOfdays <= 90) then
                //     col3Days := "Cust. Ledger Entry"."Remaining Amount";
                // //     //  Message('%1', col3Days);
                // // end;
                // // if NintyOneToOneTwenty <> 0 then begin
                // if (NoOfdays > 90) And (NoOfdays <= 120) then
                //     col5Days := "Cust. Ledger Entry"."Remaining Amount";
                // //     //  Message('%1', col4Days);
                // // end;
                // // if TwentyOnetoOneEighty <> 0 then begin
                // if (NoOfdays > 120) And (NoOfdays <= 180) then
                //     col5Days := "Cust. Ledger Entry"."Remaining Amount";
                // //     //  Message('%1', col5Days);
                // // end;
                // // if greatherOneEighty <> 0 then begin
                // if (NoOfdays > 180) then
                //     col6Days := "Cust. Ledger Entry"."Remaining Amount";
                // //     //Message('%1', col6Days);
                // end;

                ///////////////////
                if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then begin
                    sih.Reset();
                    sih.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                    if sih.FindFirst() then
                        paymentterm := sih."Payment Terms Code";
                end else
                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then begin
                        sCMH.Reset();
                        sCMH.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                        if sCMH.FindFirst() then
                            paymentterm := sCMH."Payment Terms Code";
                    end else
                        if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then begin
                            RSH.Reset();
                            RSH.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                            if RSH.FindFirst() then
                                paymentterm := RSH."Payment Terms Code";
                        end;



                cust.Reset();
                if cust.get("Customer No.") then begin
                    cust.CalcFields("Balance (LCY)");
                    Balance := cust."Balance (LCY)";
                end;

                calculateage := "posting Date" - ToDate;
                /// /////


                if "Cust. Ledger Entry"."Remaining Amount" <> 0 then begin

                    TOtalAMt += "Original Amount";
                    TOtalRemainAMt += "Remaining Amount";
                    TOtalAMt1 += col1Days;
                    TOtalAMt2 += col2Days;
                    TOtalAMt3 += col3Days;
                    TOtalAMt4 += col4Days;
                    TOtalAMt5 += col5Days;
                    TOtalAMt6 += col6Days;
                    TOtalAMtcolwise += "Cust. Ledger Entry"."Remaining Amount";


                end;

            end;

            trigger OnPostDataItem()
            begin
                /*
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Totals', FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(TOtalAMt, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(TOtalRemainAMt, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn(TOtalAMt1, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMt2, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMt3, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMt4, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMt5, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMt6, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(TOtalAMtcolwise, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
*/
            end;

            trigger OnPreDataItem()
            var
                UserSetRec: Record "User Setup";

            begin




                // addhead();
                if ToDate <> 0D then
                    SetFilter("posting Date", '..%1', ToDate);
                // message("Cust. Ledger Entry".GetFilters);
                if CustomerNo <> '' then
                    SetFilter("Customer No.", CustomerNo)
                else
                    CustomerNo := "Cust. Ledger Entry".GetFilter("Customer No.");
                UserSetRec.Get(UserId);
                // if UserSetRec."HO User" = false then
                //     if UserSetRec.Salesperson <> '' then
                //         // "Cust. Ledger Entry".SetRange("Shortcut Dimension 4 Code", UserSetRec.Salesperson);
                //           "Cust. Ledger Entry".SetRange("Salesperson Code", UserSetRec.Salesperson);
                // "Cust. Ledger Entry".SetFilter("Salesperson Code", UserSetRec.Salesperson);

            end;

        }
    }




    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(CustomerNo; CustomerNo)
                {
                    Caption = 'Customer No';
                    TableRelation = Customer."No.";
                    ApplicationArea = All;
                }


                field(ToDate; ToDate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Till Date';

                }

                field(slab; slab)
                {
                    Caption = 'No. of Days';
                    ApplicationArea = All;
                }
                field(slab2; slab2)
                {
                    Caption = 'No. of Days 2';
                    ApplicationArea = All;
                }
                field(slab3; slab3)
                {
                    Caption = 'No. of Days 3';
                    ApplicationArea = All;
                }
                field(slab4; slab4)
                {
                    Caption = 'No. of Days 4';
                    ApplicationArea = All;
                }




            }
        }
    }
    procedure SplitValues()
    var
        UniqueValues: List of [Text];
        UniqueValues2: List of [Text];
        UniqueValues3: List of [Text];
        UniqueValues4: List of [Text];
        DelimitedText: Text;
        delimitedtext2: Text;
        delimitedtext3: Text;
        delimitedtext4: text;

        value: Text;
        value2: text;
        value3: text;
        value4: Text;
        i: Integer;
        i2: Integer;
        i3: Integer;
        i4: Integer;
    begin
        DelimitedText := slab;
        DelimitedText2 := slab2;
        delimitedtext3 := slab3;
        delimitedtext4 := slab4;
        UniqueValues := SplitUniqueValues(DelimitedText);
        UniqueValues2 := SplitUniqueValues(DelimitedText2);
        UniqueValues3 := SplitUniqueValues(DelimitedText3);
        UniqueValues4 := SplitUniqueValues(DelimitedText4);

        foreach value in UniqueValues do begin
            i += 1;
            arr[i] := value;
            foreach value2 in UniqueValues2 do begin
                i2 += 1;
                arr[i2] := value;
                foreach value3 in UniqueValues3 do begin
                    i3 += 1;
                    arr[i3] := value;
                    foreach value4 in UniqueValues4 do begin
                        i4 += 1;
                        arr[i4] := value;
                    end;
                end;
            end;
        end;
    end;

    local procedure SplitUniqueValues(DelimitedText: Text): List of [Text]
    var
        UniqueValues: List of [Text];
        UniqueValues2: List of [Text];
        UniqueValues3: List of [Text];
        UniqueValues4: List of [Text];
        Values: List of [Text];
        Delimiters: Text;
        delimiters2: Text;
        delimiters3: Text;
        delimiters4: text;

        value: Text;
        value2: text;
        value3: text;
        value4: Text;
        i: Integer;
        i2: Integer;
        i3: Integer;
        i4: Integer;
    begin
        Delimiters := '-';
        delimiters2 := '-';
        delimiters3 := '-';
        delimiters4 := '-';
        Values := DelimitedText.Split(Delimiters.Split(' '));
        Values := DelimitedText.Split(Delimiters2.Split(' '));
        Values := DelimitedText.Split(Delimiters3.Split(' '));
        Values := DelimitedText.Split(Delimiters4.Split(' '));

        foreach value in Values do
            if not UniqueValues.Contains(value) then
                UniqueValues.Add(value);
        foreach value2 in Values do
            if not UniqueValues2.Contains(value2) then
                UniqueValues2.Add(value2);
        foreach value3 in Values do
            if not UniqueValues3.Contains(value3) then
                UniqueValues3.Add(value3);
        foreach value4 in Values do
            if not UniqueValues4.Contains(value4) then
                UniqueValues4.Add(value4);

        exit(UniqueValues);
        exit(UniqueValues2);
        exit(UniqueValues3);
        exit(UniqueValues4);
    end;


    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        SplitValues();
    end;

    procedure addhead()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);

        ExcelBuffer.DELETEALL;


        ExcelBuffer.NewRow;
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo.Address, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(CompanyInfo."Address 2", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Bill Wise Customer Aging Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(startdate, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('To', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(ToDate, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('Posting Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Voucher No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Credit Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Age', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Balance', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Invoice Amount', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Remarks', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(slab, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn('Total', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer Name", FALSE, '', true, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);


    end;

    trigger OnPostReport()
    begin

        // ExcelBuffer.CreateNewBook('customer Aging Report');
        // ExcelBuffer.WriteSheet('Customer Aging Report', CompanyName, UserId);
        // ExcelBuffer.CloseBook();
        // ExcelBuffer.SetFriendlyFilename(StrSubstNo('Customer Aging Report', CurrentDateTime, UserId));
        // ExcelBuffer.OpenExcel();

    end;

    var
        arr: array[20] of Text;
        slab: text[20];
        slab2: Text[20];
        slab3: Text[20];
        slab4: Text[20];
        from: integer;
        too: integer;
        from2: Integer;
        too2: Integer;

        from3: Integer;
        too3: Integer;
        from4: Integer;
        too4: Integer;

        CustomerNo: Code[1000];
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
        sih: Record "Sales Invoice Header";
        sCMH: Record "Sales Cr.Memo Header";
        paymentterm: Code[20];
        RSH: Record "Return Shipment Header";
        startdate: Date;
        calculateage: Integer;
        startdatedays: Integer;
        enddatedays: Integer;
        "ZeroToThirty": Integer;
        fromto: Integer;
        "ThirtyoneToSixty": Integer;
        "SixtyOneToNinty": Integer;
        "NintyOneToOneTwenty": Integer;
        customerrec: record Customer;
        "TwentyOnetoOneEighty": Integer;
        "greatherOneEighty": Integer;
        RemainAmt: Decimal;
        salepname: Record "Salesperson/Purchaser";
}