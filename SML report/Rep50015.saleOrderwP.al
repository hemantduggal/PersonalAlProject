report 50015 "sale Order wP"
{
    Caption = 'sale Order wP';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\SalesorderRWP.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(companyaddress2; companyinfo."Address 2")
            {

            }
            column(company_city; companyinfo.City)
            {

            }
            column(Companypost; CompanyInfo."Post Code")
            {

            }
            column(CompanyInfostate; CompanyInfo."State Code")
            {

            }
            column(CompanyInfostatecode; CompanyInfo."State Code")
            {

            }
            column(Compcountrycode; CompanyInfo."Country/Region Code")
            {

            }
            // column(CompWebsite; CompanyInfo.website)
            // {

            // }
            column(Companyemail; CompanyInfo."E-Mail")
            {

            }
            column(Companygst; CompanyInfo."GST Registration No.")
            {

            }
            column(Companyphone; CompanyInfo."Phone No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Address; "Bill-to Address")
            {

            }
            column(Bill_to_City; "Bill-to City")
            {

            }

            column(Bill_to_Address_2; "Bill-to Address 2")
            {

            }
            column(Bill_to_Address2; "Bill-to Address")
            {

            }
            column(Bill_to_Address_22; "Bill-to Address 2")
            {

            }
            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(Bill_to_Post_Code; "Bill-to Post Code")
            {

            }
            column(Bill_to_Contact_No_; "Bill-to Contact No.")
            {

            }
            column(custgst; cust."GST Registration No.")
            {

            }
            column(custpan; cust."P.A.N. No.")
            {

            }
            column(custemail; cust."E-Mail")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(ship_to_address2; "Ship-to Address 2")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
            column(custphone; cust."Phone No.")
            {

            }
            column(Ship_to_Contact; "Ship-to Contact")
            {


            }
            column(Ship_to_County; "Ship-to County")
            {

            }
            column(CompanyPIC; CompanyInfo.Picture)
            {

            }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code")
            {

            }
            column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.")
            {

            }
            column(Customer_GST_Reg__No_; "Customer GST Reg. No.")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(Quote_No_; "Quote No.")
            {

            }

            column(Requested_Delivery_Date; "Requested Delivery Date")
            {

            }






            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(SrNo; SrNo)
                {

                }

                column(Document_No_; "Document No.")
                {

                }
                column(itemNo_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }


                column(ending_date; ending_date)
                {

                }
                column(starting_date; starting_date)
                {

                }

                trigger OnAfterGetRecord()
                var
                begin
                    if cust.get("Sell-to Customer No.") then;

                    SrNo += 1;


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
                    // field(starting_date; starting_date)
                    // {
                    //     ApplicationArea = all;
                    // }
                    // field(ending_date; ending_date)
                    // {
                    //     ApplicationArea = all;
                    // }
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
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        ending_date: Date;
        starting_date: Date;
        Check: Report "Check";
        cust: record customer;
        AmountInWords: array[2] of Text;
        TotalAmt: Decimal;
        SrNo: Integer;
        "gst per": code[20];
        freighamt: Decimal;
        TaxTransValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
        TaxComponentName: Text;
        gsttotal: Decimal;
        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        sgst_amt: Decimal;



}

