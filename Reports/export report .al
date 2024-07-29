/// <summary>
/// Report Export invoice Report (ID 50030).
/// </summary>
report 50032 "Export invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\ExportInvoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(CompanyName; companyinfo.name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; Companyinfo."Address 2")
            {

            }
            column(CompanyCity; CompanyInfo.City)
            {

            }
            column(CompanyPic; CompanyInfo.Picture)
            {

            }
            column(companyCode; companyinfo."Post Code")
            {

            }
            column(CompanyCountry; CompanyInfo.County)
            {

            }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(Companyfax; CompanyInfo."Fax No.")
            {

            }
            column(Companygst; CompanyInfo."GST Registration No.")
            {

            }

            column(Companybankname; CompanyInfo."Bank Name") { }
            column(Companyaccno; CompanyInfo."Bank Account No.") { }
            column(Companybranch; CompanyInfo."Bank Branch No.") { }





            column(No_; "No.") { }
            column(Order_Date; "Order Date") { }
            column(Customer_GST_Reg__No_; "Customer GST Reg. No.") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Bill_to_Post_Code; "Bill-to Post Code")
            {

            }
            column(Sell_to_Phone_No_; "Sell-to Phone No.") { }
            column(GetSellToCustomerFaxNo; GetSellToCustomerFaxNo) { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_County; "Ship-to County") { }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }


            dataitem("Sales Invoice Line";
            "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(Sno; Sno) { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Amount; Amount)
                {

                }
                column(AmountInWords; AmountInWords[1])
                {

                }
                column(grand_total; grand_total)
                {

                }


                trigger OnAfterGetRecord()
                var
                begin
                    Sno := Sno + 1;
                    CLEAR(AmountInWords);
                    Check.InitTextVariable;
                    Check.FormatNoText(AmountInWords, Round(grand_total), "Sales Invoice Header"."Currency Code");
                end;
            }
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

        Sno := 0;
        CompanyInfo.Get;
    end;



    var
        myInt: Integer;
        Sno: integer;
        CompanyInfo: record "Company Information";
        FormatDocument: Codeunit "Format Document";
        Check: Report Check;

        AmountInWords: array[2] of Text;
        RepCheck: Report "Check";
        NoText: array[2] of Text;
        grand_total: Decimal;
        AmtWithWordsTaxAmt: Text;
        NoTextTax: array[2] of Text;
}