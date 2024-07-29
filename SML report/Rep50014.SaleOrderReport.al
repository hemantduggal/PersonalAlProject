report 50014 "Sale Order Report"

{
    UsageCategory = Administration;
    Caption = 'Sales order report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\SalesorderR.rdl';

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
            column(custphone; cust."Phone No.")
            {

            }
            column(CompanyPIC; CompanyInfo.Picture)
            {

            }
            column(Bill_to_City; "Bill-to City")
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
            column(Ship_to_Contact; "Ship-to Contact")
            {


            }
            column(Ship_to_County; "Ship-to County")
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

                column(Unit_Price; "Unit Price")
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column("gstper"; "gst per")
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
                column(AmountInWords; AmountInWords[1])
                {

                }
                column(freighamt; freighamt)
                {

                }
                column(gsttotal; gsttotal)
                {

                }
                column(TotalAmt; TotalAmt)
                {

                }
                column(Companybankno; CompanyInfo."Bank Account No.")
                {

                }
                column(Companybankname; CompanyInfo."Bank Name")
                {

                }
                column(CompanyInfobranchno; CompanyInfo."Bank Branch No.")
                {

                }
                column(CompanyInfoswiftcode; CompanyInfo."SWIFT Code")
                {

                }

                trigger OnAfterGetRecord()
                var
                begin
                    if cust.get("Sell-to Customer No.") then;

                    SrNo += 1;
                    Clear(freighamt);


                    if "sales line".Type = "sales line".Type::"Charge (Item)" then begin

                        freighamt += "sales line"."Line Amount";
                    end;


                    IGST_perc := 0;
                    IGST_Amt := 0;
                    CGST_perc := 0;
                    CGST_Amt := 0;
                    SGST_perc := 0;
                    SGST_Amt := 0;
                    GSTSetup.Get();//PT
                    if "Sales Line".Type = "Sales Line".Type::Item then begin
                        TaxTransValue.Reset();
                        if TaxTransValue.FindSet() then
                            repeat
                                TaxComponentName := TaxTransValue.GetAttributeColumName();
                                //Message(TaxComponentName);
                                case TaxComponentName of
                                    'IGST':
                                        begin
                                            IGST_perc := TaxTransValue.Percent;
                                            evaluate(IGST_Amt, TaxTransValue."Column Value");
                                        end;
                                    'CGST':
                                        begin
                                            evaluate(CGST_Amt, TaxTransValue."Column Value");
                                            CGST_perc := TaxTransValue.Percent;
                                        end;
                                    'SGST':
                                        begin
                                            evaluate(SGST_Amt, TaxTransValue."Column Value");
                                            SGST_perc := TaxTransValue.Percent;
                                        end;
                                end;
                            until TaxTransValue.Next() = 0;
                    END;

                    gsttotal += IGST_Amt + CGST_Amt + SGST_Amt;
                    "gst per" := IGST_perc + SGST_perc + CGST_perc;
                    TotalAmt += "Sales Line".Amount + gsttotal + freighamt;





                    CLEAR(AmountInWords);
                    Check.InitTextVariable;
                    Check.FormatNoText(AmountInWords, Round(TotalAmt), "Sales Header"."Currency Code");

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
        "gst per": Decimal;
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
