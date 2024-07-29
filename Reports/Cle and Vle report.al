/// <summary>
/// Report MyReport (ID 50136).
/// </summary>
report 50136 " CLE AND VLE Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\CLE AND VLE Report.rdl';


    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Document Type", "Customer No.");
            RequestFilterFields = "Customer No.";


            column(Company_name; CompanyInfo.Name)
            {

            }
            column(Company_address; CompanyInfo.Address)
            {

            }
            column(Company_city; CompanyInfo.City)
            {

            }
            column(CompanyInfo; CompanyInfo."State Code")
            {

            }
            column(Company_image; CompanyInfo.Picture)
            {

            }
            column(Company_phone; CompanyInfo."Phone No.")
            {

            }
            column(Company_Gst; CompanyInfo."GST Registration No.")
            {

            }
            column(Company_Reg; CompanyInfo."Registration No.")
            {

            }
            column(Company_address2; CompanyInfo."Address 2")
            {

            }
            column(company_postcode; companyinfo."Post Code")
            {

            }
            column(company_email; companyinfo."E-Mail")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Closed_at_Date; "Closed at Date")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }


            column(Cust_email; cust."Phone No.")
            {

            }
            column(Cust_fax; Cust."Fax No.")
            {

            }
            column(Cust_contact; Cust.Contact)
            {

            }
            column(Cust_phone; Cust."Mobile Phone No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Amount; Amount)
            {

            }
            column(Cust; Cust.Balance)
            {

            }
            column(starting_date1; starting_date1)
            {

            }
            column(ending_date1; ending_date1)
            {

            }
            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }


            trigger OnAfterGetRecord()
            var

            begin

                If Cust.Get("Cust. Ledger Entry"."Customer No.") then;



            end;

        }

        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Document Type", "vendor no.");

            RequestFilterFields = "Vendor No.";

            column(Document_DateV; "Document Date")
            {

            }
            column(Document_No_V; "Document No.")
            {

            }
            column(DescriptionV; Description)
            {

            }
            column(Amount_V; Amount)
            {

            }
            column(Entry_No_; "Entry No.")
            {

            }
            column(Credit_Amount_v; "Credit Amount")
            {

            }

            trigger OnAfterGetRecord()
            var

            begin

                If "Vendor Ledger Entry".Get("Vendor Ledger Entry"."Vendor No.") then;



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

        CompanyInfo.CalcFields(CompanyInfo.Picture)
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Cust: Record "Customer";
        Starting_date1: Date;
        ending_date1: Date;
        balance: Decimal;


}