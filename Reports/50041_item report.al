/// <summary>
/// Report itemReport (ID 50041).
/// </summary>
report 50042 "CustomerReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Customer Grouping report ';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Customer Grouping.rdl';



    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Document Type";
            column(Comp_picture; CompInfo.Picture)
            {

            }
            column(CompNmae; CompInfo.Name)
            {

            }
            column(CompAddress; CompInfo.Address)
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
            column(Location_Code; "Location Code") { }
            column(Amount; Amount) { }
            column(Customer_No_; "Customer No.") { }
            column(Customer_Name; "Customer Name") { }
            column(Address; cust.Address) { }
            column(phoneno; cust."Phone No.") { }
            column(city; cust.City) { }


            trigger OnAfterGetRecord()
            var

            begin
                if cust.get("Cust. Ledger Entry"."Customer No.") then;


            end;







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
        CompInfo: Record "Company Information";
        cust: record Customer;
}