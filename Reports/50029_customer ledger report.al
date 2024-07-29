/// <summary>
/// Report Customer ledger Report (ID 50029).
/// </summary>
report 50029 "Customer ledger Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Customer ledgers report.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(City; City)
            {
            }
            column(Comp_picture; CompInfo.Picture)
            {
            }
            column(CompNmae; CompInfo.Name)
            {

            }
            column(CompAddress; CompInfo.Address)
            {

            }
            column(Compaddress2; CompInfo."Address 2")
            {

            }
            column(Compcity; CompInfo.City)
            {

            }
            column(CompPostcode; CompInfo."Post Code")
            {

            }
            column(Compstate; CompInfo."State Code")
            {

            }
            column(Compphone; CompInfo."Phone No.")
            {

            }
            column(CompEmail; CompInfo."E-Mail")
            {
            }

        }
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Due_Date; "Due Date")
            {

            }

            column(Document_Date; "Document Date")
            {

            }

            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Description; Description)
            {

            }
            column(OpeningAmount; OpeningAmount)
            {

            }
            column(startdate; startdate)
            {

            }
            column(enddate; enddate)
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }

            trigger OnAfterGetRecord()
            var
                custledgentry: record "Cust. Ledger Entry";
            begin
                Clear(OpeningAmount);
                custledgentry.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
                custledgentry.SetRange("Posting Date", 0D, startdate);
                if custledgentry.FindSet() then
                    repeat
                        custledgentry.CalcFields(Amount);
                        OpeningAmount += custledgentry.Amount;
                    until custledgentry.Next() = 0;
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
                    field(startdate; startdate)
                    {
                        ApplicationArea = all;
                    }
                    field(enddate; enddate)
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
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        myInt: Integer;
        BalDebit: Decimal;
        BalCredit: Decimal;
        CustAddress: Text[250];
        CompInfo: Record 79;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        SGST_Amt: Decimal;
        TotalGST: Decimal;
        OpeningAmount: Decimal;
        startdate: date;
        enddate: date;
}