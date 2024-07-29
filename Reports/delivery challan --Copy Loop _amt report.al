/// <summary>
/// Report Delivery Challan (ID 50110).
/// </summary>
report 50111 "Delivery Challan report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = 'ReportLayout\DeliveryReport.rdl';
    RDLCLayout = 'ReportLayout\Delivery_Challan.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING("Number");
            column(OutputNo; OutputNo)
            {

            }

            column(Number_Copies; Number)
            {

            }
            column(Copy_Text; CopyText)
            {

            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                RequestFilterFields = "No.";
                column(companyName; companyinfo.Name)
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
                column(country; companyinfo.County)
                {

                }
                column(phone; companyinfo."Phone No.")
                {

                }
                column(gst; companyinfo."GST Registration No.")
                {

                }
                column(fax; companyinfo."Fax No.")
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
                column(Delivery_Challan_No_; "Bill-to Contact No.")
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



                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    DataItemLinkReference = "Sales Invoice Header";
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
                    column(HSN_SAC_Code; "HSN/SAC Code")
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(Unit_Cost; "Unit Cost")
                    {

                    }
                    column(Line_Discount_Amount; "Line Discount Amount")
                    {

                    }

                    column(IGST_perc; IGST_perc)
                    {

                    }


                    column(CGST_perc; CGST_perc)
                    {

                    }

                    column(SGST_perc; SGST_perc)
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
                        SIL: Record "Sales Invoice Line";
                    begin
                        Sno := Sno + 1;
                        grand_total += Amount;

                        CLEAR(AmountInWords);
                        Check.InitTextVariable;
                        Check.FormatNoText(AmountInWords, Round(grand_total), "Sales Invoice Header"."Currency Code");

                        IGST_perc := 0.00;

                        CGST_perc := 0.00;

                        SGST_perc := 0.00;

                    end;

                }
                trigger OnPreDataItem()
                var
                begin
                    companyinfo.get;

                end;

                trigger OnAfterGetRecord()
                var
                begin
                    Sno := 0;

                end;
            }
            trigger OnPreDataItem()
            var
            begin
                if NoOfCopies > 1 then
                    SetRange(Number, 1, NoOfCopies)
                else
                    SetRange(Number, 1, 1);

            end;

            trigger OnAfterGetRecord()
            var
                myint: Integer;
            begin
                if Number = 1 then
                    CopyText := 'Original customer copy';
#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667
                    OutputNo += 1;
                if Number = 2 then
                    CopyText := 'Transporter customer copy';
#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667
                    OutputNo += 1;
                if Number = 3 then
                    CopyText := 'Seller customer copy';
#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667
                    OutputNo += 1;

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
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, suite;
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
    // trigger OnPreReport()
    // var
    // begin
    //     companyinfo.get;
    //     Sno := 0;
    // end;



    var
        myInt: Integer;
        Check: Report Check;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
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