report 50011 "Packing Details "
{
    ApplicationArea = All;
    Caption = 'Packing Details Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\PackingDetails.rdl';

    dataset
    {
        dataitem("Packing header"; "Packing header")
        {
            RequestFilterFields = "Document No.";

            column(CompanyInfopan; CompanyInfo."P.A.N. No.")
            {

            }
            column(CompanyInfogst; CompanyInfo."GST Registration No.")
            {

            }
            column(CompanyInfoEMAIL; CompanyInfo."E-Mail")
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(ComapanyAddress; CompanyInfo.Address)
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

            column(CompanyCountry; CompanyInfo.County)
            {

            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {

            }
            column(Companyinfofax; Companyinfo."Fax No.")
            {

            }

            column(CompanyPhone; CompanyInfo."Phone No.")
            {


            }

            column(Sell_to_Customer_No_; "Ship-to No.")
            {

            }
            column(Sell_to_Customer_Name; "Ship-To Name")
            {

            }
            column(Sell_to_Address; "Ship-To Address")
            {

            }
            column(Sell_to_Address_2; "Ship-To Address2")
            {

            }
            column(Sell_to_City; "Ship-To city")
            {

            }
            column(Sell_to_Post_Code; "Ship-To Post Code")
            {

            }
            column(Sell_to_County; "Ship-to Country/Region")
            {

            }

            column(Bill_to_Customer_No_; "Bill-to No.")
            {

            }
            column(Bill_to_Name; "Bill-To Name")
            {

            }
            column(Bill_to_Address; "Bill-To Address")
            {

            }
            column(Bill_to_Address_2; "Bill-To Address2")
            {

            }
            column(Bill_to_City; "Bill-To city")
            {

            }
            column(Bill_to_Post_Code; "Bill-To Post Code")
            {

            }
            column(Bill_to_County; "Bill-to Country/Region")
            {

            }
            column(No_; "Document No.")
            {

            }
            column(Posting_Date; "Date")
            {

            }
            column(External_Document_No_; "Customer PO Ref")
            {

            }
            column(Final_Destination; "Delivery Destination")
            {

            }
            column(Payment_Terms_Code; "Payment Terms")
            {

            }
            column(Total_CTNS; "Total CTNS")
            {

            }

        }
        dataitem("Packing Line"; "Packing Line")
        {
            DataItemLinkReference = "Packing Header";
            DataItemLink = "Document No." = field("No.");


            column(SrNo; "Marking")
            {

            }
            column(Description; Description)
            {

            }


            column(Quantity; "Total Qty")
            {

            }
            column(Gross_Weight; "Gross Weight(KG)")
            {

            }
            column(Net_Weight; "Net Weight(KG)")
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin

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
                }
            }
        }


    }

    trigger OnPreReport()
    var
        myInt: Integer;

    begin
        Companyinfo.Get();

    end;

    var
        Companyinfo: Record "Company Information";

}
