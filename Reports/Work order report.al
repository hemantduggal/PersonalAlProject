/// <summary>
/// Report MyReport (ID 50125).
/// </summary>
report 50004 "Work order report"
{

    ApplicationArea = All;
    Caption = 'Work Order report';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Work order.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";

            column(No; "No.")
            {
            }
            column(startdate; startdate)
            {

            }

            column(Company_Name; companyinfo.Name)
            {

            }

            column(company_picture; companyinfo.Picture)
            {

            }


            column(Address; companyinfo.Address)
            {

            }
            column(Address2; companyinfo."Address 2")
            {

            }
            column(tel; companyinfo."Phone No.")
            {

            }
            column(fax; companyinfo."Fax No.")
            {

            }
            column(mail; companyinfo."E-Mail")
            {

            }

            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Buy_from_Address; "Buy-from Address")
            {

            }
            column(Buy_from_Address_2; "Buy-from Address 2")
            {

            }

            column(Buy_from_City; "Buy-from City")
            {

            }
            column(Buy_from_County; "Buy-from County")
            {

            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            {

            }

            column(Order_Date; "Order Date")
            {

            }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.")
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
            column(Buy_from_Contact; "Buy-from Contact")
            {

            }

            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }


            column(Ship_to_Address; "Ship-to Address")
            {

            }




            column(Document_Date; format("Document Date"))
            {

            }
            column(Document_Type; "Document Type")
            {

            }

            column(Buy_from_Contact_No_; "Buy-from Contact No.")
            {

            }

            column(Ship_to_Address_2; "Ship-to Address 2")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
            column(Ship_to_Contact; "Ship-to Contact")
            {

            }

            column(Ship_to_County; "Ship-to County")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }

            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }


            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(INo_; "No.")
                {

                }

                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }

                column(Amount; Amount)
                {

                }
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
                begin
                    grand_total += Amount;

                    CLEAR(AmountInWords);
                    Check.InitTextVariable;
                    Check.FormatNoText(AmountInWords, Round(grand_total), "Purchase Header"."Currency Code");

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
                    field(startdate; startdate)
                    {
                        applicationarea = all;
                    }

                }
            }
        }

        actions
        {
            area(processing)
            {

            }
        }
    }
    trigger OnPreReport()
    var
    begin
        companyinfo.get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;


    var
        Companyinfo: Record "Company Information";
        startdate: Date;
        AmountInWords: array[2] of Text;
        Check: Report "Check";
        NoText: array[2] of Text;
        grand_total: Decimal;
        AmtWithWordsTaxAmt: Text;

}