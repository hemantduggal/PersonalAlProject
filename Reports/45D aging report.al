/// <summary>
/// Report 45D Ageing Report (ID 50023).
/// </summary> 
report 50023 "30Days Ageing Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\45DReceivableAging.rdl';
    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = where("Document Type" = const(Invoice), Open = const(true));
            column(Document_No_; "Document No.")
            {

            }
            column(cust_bal; cust.CalcFields("Balance (LCY)"))
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Balance; Balance)
            {

            }
            column(Posting_Date; format("Posting Date"))
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {

            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {

            }
            column(Due_Date; format("Due Date"))
            {

            }
            column(Original_Amount; "Original Amount")
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(col1Days; col1Days)
            {

            }
            column(col2Days; col2Days)
            {

            }
            column(col3Days; col3Days)
            {

            }
            column(col4Days; col4Days)
            {

            }
            column(col5Days; col5Days)
            {

            }
            column(col6Days; col6Days)
            {

            }
            column(TOtalAMOUNT; TOtalAMOUNT)
            {

            }
            column(TOtalAMt1; TOtalAMt1)
            {

            }
            trigger OnAfterGetRecord()
            var

            begin

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



                TOtalAMOUNT += "Original Amount";
                TOtalRemainAMt += "Remaining Amount";
                TOtalAMt1 += col1Days;
                TOtalAMt2 += col2Days;
                TOtalAMt3 += col3Days;
                TOtalAMt4 += col4Days;
                TOtalAMt5 += col5Days;
                TOtalAMt6 += col6Days;

                cust.Reset();
                if cust.get("Customer No.") then begin
                    cust.CalcFields("Balance (LCY)");
                    Balance := cust."Balance (LCY)";
                end;
            end;




            trigger OnPreDataItem()
            var
            begin
                if ToDate = 0D then begin
                    ToDate := Today;
                    SetRange("Due Date");
                end else
                    SetRange("Due Date", 0D, ToDate);
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(OPTIONS)
                {

                    field(Todate; todate)
                    {
                        ApplicationArea = all;
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

    end;




    var
        ToDate: Date;
        col1Days: Decimal;
        col2Days: Decimal;
        col3Days: Decimal;
        col4Days: Decimal;
        col5Days: Decimal;
        col6Days: Decimal;
        NoOfdays: Integer;
        CompanyInfo: Record "Company Information";
        TOtalAMOUNT: Decimal;
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




}