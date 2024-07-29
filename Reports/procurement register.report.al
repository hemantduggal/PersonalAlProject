/// <summary>
/// Report Procurement Register (ID 50133).
/// </summary>
report 50133 "Procurement Register Report "
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Procurement Register.rdl';
    Caption = 'Procurement Register';



    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";

            column(Company_name; CompanyInfo.Name)
            {

            }
            column(Company_address; CompanyInfo.Address)
            {

            }
            column(Company_image; CompanyInfo.Picture)
            {

            }
            column(Company_phone; CompanyInfo."Phone No.")
            {

            }
            column(Edition_no; edition_no)
            {

            }
            column(issue_date; issue_date)
            {

            }
            column(DOCUMENT_NO; DOCUMENT_NO)
            {

            }
            column(revision_no; revision_no)
            {

            }
            column(revision_date; revision_date)
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(trip_from; trip_from)
            {

            }
            column(trip_to; trip_to)
            {

            }
            column(No_of_days; No_of_days)
            {

            }
            column(No_of_crew; No_of_crew)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Vendor_GST_Reg__No_; "Vendor GST Reg. No.")
            {

            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {

            }
            column(starting_date1; starting_date1)
            {

            }
            column(ending_date1; ending_date1)
            {

            }

            column(Transport_Method; "Transport Method")
            {

            }
            column("Area"; "Area")
            {

            }
            column(colour; colour)
            {

            }
            column(Order_No_; "Order No.")
            {

            }
            column(Starting_Time; Starting_Time)
            {

            }
            column(Ending_time; Ending_time)
            {

            }





            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {





            }






            trigger OnAfterGetRecord()
            var
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
                group(Options)
                {
                    Caption = 'starting_date';
                    field("Starting Date"; starting_date)
                    {
                        ApplicationArea = all;

                    }
                    field(ending_date; ending_date)
                    {
                        ApplicationArea = all;

                    }
                    field(ending_date1; ending_date1)
                    {
                        ApplicationArea = all;

                    }
                    field(Starting_date1; Starting_date1)
                    {
                        ApplicationArea = All;
                    }
                    field(DOCUMENT_NO; DOCUMENT_NO)
                    {
                        ApplicationArea = all;

                    }
                    field(Edition_no; edition_no)
                    {
                        ApplicationArea = all;
                    }
                    field(issue_date; issue_date)
                    {
                        ApplicationArea = All;
                    }
                    field(revision_no; revision_no)
                    {
                        ApplicationArea = all;
                    }
                    field(revision_date; revision_date)
                    {
                        ApplicationArea = all;

                    }
                    field(Starting_Time; Starting_Time)
                    {
                        ApplicationArea = All;
                    }
                    field(Ending_time; Ending_time)
                    {
                        ApplicationArea = All;
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
        trip_from: label '  ';
        trip_to: Label ' ';
        No_of_days: Decimal;
        No_of_crew: Integer;
        starting_date: Date;
        ending_date: Date;
        Starting_date1: Date;
        ending_date1: Date;

        colour: Text[20];
        Starting_Time: Time;
        Ending_time: Time;
        DOCUMENT_NO: Integer;
        edition_no: Integer;
        issue_date: date;
        revision_no: Integer;
        revision_date: Date;










}