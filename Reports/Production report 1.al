/// <summary>
/// Report Production1Report (ID 50000).
/// </summary>
report 50000 Production1Report
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\P-1.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(companyname; companyinfo.Name)
            {

            }
            column(starting_date; starting_date)
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(Bill_to_Address; "Bill-to Address")
            {

            }
            column(Bill_to_Address_2; "Bill-to Address 2")
            {

            }
            column(Bill_to_City; "Bill-to City")
            {

            }
            column(Bill_to_County; "Bill-to County")
            {

            }
            column(sR_today; sR_today)
            {

            }
            column(sR_todate; sR_todate)
            {

            }



            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");


            }
        }
    }


    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(starting_date; starting_date)
                    { ApplicationArea = all; }
                    field(sR_today; sR_today)
                    { ApplicationArea = all; }
                    field(sR_todate; sR_todate)
                    { ApplicationArea = all; }

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
        companyinfo.get();
    end;



    var
        myInt: Integer;
        companyinfo: Record "Company Information";
        starting_date: Date;
        sR_today: Date;
        sR_todate: Date;
}