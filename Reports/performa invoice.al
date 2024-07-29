/// <summary>
/// Report Performa Invoice Report (ID 50046).
/// </summary>
report 50046 "Performa Invoice Report"
{
    UsageCategory = Administration;
    Caption = 'Performa Invoice Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Performa Invoice Report.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(Order_Date; "Order Date") { }

            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_County; "Ship-to County")
            {

            }

            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }

            column(Bill_to_Address; "Bill-to Address")
            {

            }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Shipment_Method_Code; "Shipment Method Code")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }

            column(Sell_to_Contact; "Sell-to Contact")
            {

            }
            column(VAT_Registration_No_; "VAT Registration No.")
            {

            }








            dataitem("Sales Line"; "Sales Line")
            {

                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(No; "No.")
                {

                }

                column(Description; Description)
                {

                }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount; Amount)
                {

                }
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



    }
    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var

        CompanyInfo: Record "Company Information";
}