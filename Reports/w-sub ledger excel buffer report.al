/// <summary>
/// Report Sales register excel buffer Report (ID 50149).
/// </summary>
report 50149 "sub ledger excel buffer report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Sell-to Customer No.";
            DataItemTableView = sorting("Sell-to Customer No.");
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
            }
            trigger OnAfterGetRecord()
            var
                salinvline: Record "Sales Invoice Line";
            begin
                Clear(debt);
                Clear(credit);
                Clear(balance);
                Cust.Reset();
                Cust.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                Cust.SetRange("Customer No.", "Sales Invoice Line"."Sell-to Customer No.");
                if cust.FindSet() then
                    repeat
                        Cust.CalcFields("Debit Amount", "Credit Amount");
                        debt += Cust."Debit Amount";
                        totaldebit += Cust."Debit Amount";
                        totalcredit += cust."Credit Amount";
                        totalbal += customer.Balance;
                        credit += Cust."Credit Amount";
                        totalqty += "Sales Invoice Line".Quantity;
                        totaluc += "Sales Invoice Line"."Unit Cost";
                    until Cust.Next() = 0;
                if customer.Get("Sales Invoice Line"."Sell-to Customer No.") then begin
                    customer.CalcFields(Balance);
                    balance += customer."Credit Amount" - customer."Credit Amount";
                    balance := customer.Balance;
                    salinvline.Reset();
                    if "Sales Invoice Line"."Sell-to Customer No." <> '' then
                        salinvline.SetRange("Sell-to Customer No.", "Sales Invoice Line"."Sell-to Customer No.");
                    if salinvline.FindFirst() then
                        i := salinvline.Count;
                    // Message('%1..%2', i, "Sales Invoice Line"."Sell-to Customer No.");
                    j += 1;
                    if j = 1 then
                        makeheading();
                    if (j > 1) and (j <= i) then
                        MakeBody();
                    if j > i then
                        j := 0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                Makeheader();
                if "No." <> '' then
                    SetRange("No.", "Sell-to Customer No.");
                i := 0;
                j := 0;
            end;

            trigger OnPostDataItem()
            begin
                TempExcelBuffer.NewRow();
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn('total', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(totalqty, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(totaluc, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(totaldebit, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(totalcredit, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(totalbal, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Starting_date; Starting_date)
                    {
                        ApplicationArea = all;

                    }
                    field(ending_date; ending_date)
                    {
                        ApplicationArea = All;
                    }
                    field(postingdate; "Sales Invoice header"."Posting Date")
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action("Export to excel")
                {
                    ApplicationArea = All;

                    Image = Export;
                    trigger OnAction()
                    var
                    begin
                    end;
                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        "Sales Invoice Header".SetRange("Posting Date", starting_date, ending_date);
        CompanyInfo.Get;
        TempExcelBuffer.DELETEALL
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book

        tempExcelBuffer.CreateNewBook('sub ledger excel buffer report');
        tempExcelBuffer.WriteSheet('sub ledger excel buffer report', CompanyName, UserId);
        tempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('sub ledger excel buffer report', CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();
    end;

    var
        myInt: Integer;
        starting_date: Date;
        ending_date: Date;
        CompanyInfo: Record "Company Information";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        Cust: Record "Cust. Ledger Entry";
        caption1: Label 'Date';
        caption2: Label 'Voucher';
        caption3: Label 'Account';
        caption4: Label 'Product Name';
        caption5: label 'Brand';
        caption6: Label 'Quantity';
        caption7: Label 'Inr Rate';
        caption8: Label 'Debit Amt.Orig Curr.';
        caption9: label 'Credit Amount Orig Currency';
        caption10: Label 'Balance';
        caption11: Label 'REMARKS';
        j: Integer;
        caption_blank: Label '';
        item: Record Item;
        customer: Record Customer;
        debt: Decimal;
        balance: Decimal;
        credit: Decimal;
        totaldebit: Decimal;
        totalcredit: decimal;
        totalbal: Decimal;
        totalqty: Decimal;
        totaluc: Decimal;
        i: Integer;

    Local procedure Makeheader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CompanyName, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn('Sub-ledger ', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Customer Name", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Address", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('From', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Starting_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn('To', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ending_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption1, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption4, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption5, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption6, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption7, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption8, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption9, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption10, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption11, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure makeheading()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Customer Name", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Address", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure MakeBody()
    var
        myInt: Integer;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Posting Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Posting Description", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Sales Invoice Header"."Bal. Account Type", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Invoice Line".Description, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn(item.brand, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Sales Invoice Line".Quantity, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);
        TempExcelBuffer.AddColumn("Sales Invoice Line"."Unit Cost", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);
        TempExcelBuffer.AddColumn(debt, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(credit, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(balance, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
    end;

    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Sales Register');
        TempExcelBuffer.WriteSheet('Sales Register', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Sales Register');
        TempExcelBuffer.OpenExcel();
    end;
}