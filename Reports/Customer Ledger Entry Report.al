/// <summary>
/// Report Customer Ledger Entry Report (ID 50127).
/// </summary>
report 50127 "Customer Ledger Entry Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\CLe.rdl';
    Caption = 'Customer Ledger';



    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Customer No.", "Document Type";


            CalcFields = Amount;

            column(starting_date1; starting_date1)
            {

            }
            column(ending_date1; ending_date1)
            {

            }




            column(CompanyName; CompanyInfo.Name)
            {

            }






            column(Customer_Name; "Customer Name")
            {

            }




            column(Document_No_; "Document No.")
            {

            }
            column(Document_Type; "Cust. Ledger Entry".Description)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }


            column(Amount; Amount)
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }

            column(Days0To30; Days0To30)
            {



            }
            column(Days31To60; Days31To60)
            {

            }
            column(Days61To90; Days61To90)
            {

            }
            column(Days91To180; Days91To180)
            {

            }

            column(DaysOver180; DaysOver180)
            {

            }
            trigger OnPreDataItem()
            begin
                TodayDate_1 := TODAY;
            end;

            trigger OnAfterGetRecord()
            var
            //detailedcustomer--filter lga kr--sum krakr var m assign customer --on after pr 
            // detailed customer ledger entry p filter lga kr upto 30 days assign krduga sum ko

            // variable m assign calc sum set filter , flow filter ,
            // 4 o b br reset variable loop chlta rhega......
            begin

                Days0To30 := Amount - Days0To30;
                Days31To60 := Amount - Days0To30;
                Days61To90 := "Amount" - Days61To90;
                Days91To180 := "Amount" - Days91To180;

                DaysOver180 := "Amount" - DaysOver180;


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
                    field(Starting_date1; Starting_date1)
                    {
                        ApplicationArea = All;
                    }
                    field(ending_date1; ending_date1)
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);


    end;




    var
        TodayDate_1: Date;

        Days0To30: Decimal;
        Days31To60: Decimal;
        Days61To90: Decimal;
        Days91To180: Decimal;

        DaysOver180: Decimal;



        Starting_date1: Date;
        ending_date1: Date;





        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        TotalRemainingAmount: Decimal;


        myInt: Integer;
        CompanyInfo: Record "Company Information";


}