report 50165 Dailytincoming
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    caption = 'Daily incoming material report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Dailyincoming.rdl';


    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.";
            //DataItemTableView = sorting("No.");
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {

            }
            column(Companycity; CompanyInfo.City) { }
            column(CompanyInfo; CompanyInfo."Post Code") { }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {

            }
            column(startdate; startdate)
            {

            }
            column(enddate; enddate)
            {

            }

            column(No_; "No.")
            {

            }
            column(Order_No_; "Order No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Document_Date; "Document Date")
            {

            }

            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {

                DataItemLink = "Document No." = field("No.");
                // DataItemTableView = where(undo = const(false));

                column("No_i"; "No.")
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
                column(Location_Code; "Location Code")
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }
                column(value; value)
                {

                }
                column(pendingqty; pendingqty)
                {

                }
                column(Appl__to_Item_Entry; "Appl.-to Item Entry")
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;

                begin
                    value := Quantity * "Unit Cost";
                    pendingqty := Quantity - "Quantity Invoiced";






                end;
            }
            trigger OnAfterGetRecord()
            var
            begin
                // d := Date2DWY("Purch. Rcpt. Header"."Document Date", 2);
            end;

            trigger OnPreDataItem()
            var
            begin
                Clear(pendingqty);
                "Purch. Rcpt. Header".SetRange("Posting Date", 0D, enddate);
                if "Purch. Rcpt. Header".FindSet() then;
                //Purch. Rcpt. Header".SETFILTER("Posting Date", '%1..%2', startdate, enddate);
                // "Purch. Rcpt. Line".SetRange("Posting Date", 0D, enddate);
                // if "Purch. Rcpt. Line".FindSet() then;
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
                    field(startdate; startdate)
                    {
                        ApplicationArea = All;

                    }
                    field(enddate; enddate)
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
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        undo: Boolean;

        pL: record "Purch. Rcpt. Line";
        pendingqty: Decimal;
        value: Decimal;
        myInt: Integer;
        startdate: date;
        enddate: date;
        CompanyInfo: Record "Company Information";
        d: Integer;
}