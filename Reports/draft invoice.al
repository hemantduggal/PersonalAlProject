
/// <summary>
/// Report Draft Invoice Report (ID 50045).
/// </summary>
report 50045 "Draft Invoice Report"
{
    UsageCategory = Administration;
    Caption = 'Draft Invoice Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Draft Invoice Report.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";

            column(CompanyPicture; CompanyInfo.Picture) 
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