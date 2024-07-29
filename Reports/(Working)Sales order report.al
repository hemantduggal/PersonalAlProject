/// <summary>
/// Report Sales order Report (ID 50126).
/// </summary>
report 50126 "Sales order Report"
{
    UsageCategory = Administration;
    Caption = 'Sales order report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\SO.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(User_ID; "User ID")
            {

            }
            
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(companyEmail; CompanyInfo."E-Mail")
            {

            }

            column(Document_Date; "Document Date")
            {

            }


            column(Bill_to_Address; "Bill-to Address")
            {

            }

            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Contact_No_; "Bill-to Contact No.")
            {

            }

            column(Order_Date; "Order Date")
            {

            }
            column(Order_No_; "Order No.")
            {

            }

            column(Quote_No_; "Quote No.")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Sell_to_Address; "Sell-to Address")
            {

            }
            column(Sell_to_Contact; "Sell-to Contact")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }

            column(Sell_to_E_Mail; "Sell-to E-Mail")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");




                column(Amount; Amount)
                {

                }
                column(Bill_to_Customer_No_; "Bill-to Customer No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(No_; "No.")
                {

                }
                column(Item_Category_Code; "Item Category Code")
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Line_Discount__; "Line Discount %")
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
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
}