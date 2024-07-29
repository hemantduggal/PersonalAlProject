/// <summary>
/// Report MyReport (ID 50148).
/// </summary>
report 50148 "Sales Orders Report"
{
    UsageCategory = Administration;
    Caption = 'Sales order report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Sales order.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(PH_AmountInWords; AmountInWords)
            {

            }
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
            column(Incoming_Document_Entry_No_; "Incoming Document Entry No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }

            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Address; "Bill-to Address")
            {

            }
            column(Bill_to_Address_2; "Bill-to Address 2")
            {

            }
            column(IC_Reference_Document_No_; "IC Reference Document No.")
            {

            }
            column(Bill_to_Name2; "Bill-to Name")
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
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(ship_to_address2; "Ship-to Address 2")
            {

            }
            column(Sell_to_Phone_No_; "Sell-to Phone No.")
            {

            }



            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(Document_No_; "Document No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount; Amount)
                {

                }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(ending_date; ending_date)
                {

                }
                column(starting_date; starting_date)
                {

                }
                column(AmountInWords; AmountInWords)
                {

                }

                trigger OnAfterGetRecord()
                var
                begin
                    RepCheck.InitTextVariable();
                    RepCheck.FormatNoText(NoText, ("Sales line"."Amount"),
                    'only');
                    AmountInWords := NoText[1];
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
                    field(starting_date; starting_date)
                    {
                        ApplicationArea = all;
                    }
                    field(ending_date; ending_date)
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
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        ending_date: Date;
        starting_date: Date;
        RepCheck: Report "Check";
        NoText: array[2] of Text;
        AmountInWords: Text;



}