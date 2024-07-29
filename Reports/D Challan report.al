
report 50200 "Delivery Challan report1"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\DeliveryChallan1.rdl';


    dataset
    {

        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            RequestFilterFields = "No.";
            column(companyName; companyinfo.Name)
            {

            }

            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(address; companyinfo.Address)
            {

            }
            column(address2; companyinfo."Address 2")
            {

            }
            column(city; companyinfo.City)
            {

            }
            column(pincode; companyinfo."Post Code")
            {

            }

            column(phone; companyinfo."Phone No.")
            {

            }
            column(gst; companyinfo."GST Registration No.")
            {

            }

            column(Challan_Date; "Shipment Date")
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
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }
            column(Location_State_Code; "Location State Code")
            {

            }
            column(Bill_to_Contact_No_; "Bill-to Contact No.")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }

            column(Posting_Date; "Posting Date")
            {

            }
            column(No_; "No.")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }

            column(Mode_of_Transport; "Mode of Transport")
            {

            }
            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(billaddress; cust.Address)
            {

            }
            column(address2_bill; cust."Address 2")
            {

            }
            column(billcity; cust.City)
            {

            }
            column(billpost; cust."Post Code")
            {

            }
            column(billstate; cust."State Code")
            {

            }
            column(billname; cust.Name)
            {

            }

            column(Sell_to_Phone_No_; "Sell-to Phone No.")
            {

            }






            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");


                column(Sno; Sno)
                {

                }

                column(No; "No.")
                {

                }

                column(Description; Description)
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }




                // column(Amount; Amount)
                // {

                // }
                column(AmtWithWordsTaxAmt; AmtWithWordsTaxAmt)
                {

                }
                column(AmountInWords; AmountInWords[1])
                {

                }
                column(grand_total; grand_total)
                {

                }


                trigger OnAfterGetRecord();
                var
                    SIL: Record "Sales Shipment Line";
                begin
                    Sno := Sno + 1;
                    //grand_total += Amount;

                    CLEAR(AmountInWords);
                    Check.InitTextVariable;
                    Check.FormatNoText(AmountInWords, Round(grand_total), "Sales Shipment Header"."Currency Code");




                    if cust.get("Sales Shipment Header"."Bill-to Customer No.") then;




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
        companyinfo.get;
        Sno := 0;
    end;



    var
        cust: record Customer;
        myInt: Integer;
        Check: Report Check;

        FormatDocument: Codeunit "Format Document";
        abc: Text;
        companyinfo: Record "Company Information";

        Sno: Integer;

        IGST_perc: Decimal;
        CGST_perc: Decimal;
        SGST_perc: Decimal;

        AmountInWords: array[2] of Text;
        RepCheck: Report "Check";
        NoText: array[2] of Text;
        grand_total: Decimal;
        AmtWithWordsTaxAmt: Text;
        NoTextTax: array[2] of Text;

}