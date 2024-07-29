/// <summary>
/// Report sales invoice report (ID 50103).
/// </summary>
report 50104 "sales invoice report"
{
    UsageCategory = Administration;
    Caption = 'Sales invoice report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Sales invoice.rdl';


    dataset
    {

        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(PH_AmountInWords; AmountInWords)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(company_address2; companyinfo."Address 2")
            {

            }
            column(companyEmail; CompanyInfo."E-Mail")
            {

            }

            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(city; companyinfo.City)
            {

            }
            column(pan; companyinfo."P.A.N. No.")
            {

            }
            column(gst; companyinfo."GST Registration No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(No_; "No.")
            {

            }
            column(Order_No_; "Order No.")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Sell_to_Address; "Sell-to Address")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }
            column(Customer_GST_Reg__No_; "Customer GST Reg. No.")
            {

            }
            column(GST_Bill_to_State_Code; "GST Bill-to State Code")
            {

            }
            column(bank; companyinfo."Bank Name")
            {

            }
            column(bank_no; companyinfo."Bank Account No.")
            {

            }
            column(bank_code; companyinfo."Bank Branch No.")
            {

            }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(No; "Sales Invoice Line"."No.")
                {

                }
                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column(GST__; "GST %")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }
                column(Amount; Amount)
                {

                }
                column(AmountInWords; AmountInWords)
                {

                }
                column(grand_total; grand_total)
                {

                }
                column(Sno; Sno)
                {

                }
                column(AmtWithWordsTaxAmt; AmtWithWordsTaxAmt)
                { }

                trigger OnAfterGetRecord()
                var
                    SIL: Record "Sales Invoice Line";

                Begin


                    Sno := Sno + 1;
                    grand_total += Amount;

                    SIL.Reset();
                    SIL.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    IF SIL.FindLast() then;
                    IF "Line No." = SIL."Line No." then begin
                        RepCheck.InitTextVariable();
                        RepCheck.FormatNoText(NoTextTax, grand_total, '');
                        AmtWithWordsTaxAmt := NoTextTax[1];

                    End;
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        Sno := 0;

    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Sno: Integer;
        AmountInWords: Text;
        RepCheck: Report "Check";
        NoText: array[2] of Text;
        grand_total: Decimal;
        AmtWithWordsTaxAmt: Text;
        NoTextTax: array[2] of Text;

}



