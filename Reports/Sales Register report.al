/// <summary>
/// Report Sales Register (ID 50130).
/// </summary>
report 50130 "Sales Register"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\SalesRegister.rdl';
    Caption = 'Sales Register';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            CalcFields = "Amount Including VAT";

            column(caption1; "caption1")
            {

            }
            column(No_; "No.")
            {

            }
            column(CustName; Cust.Name)
            {

            }
            column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.")
            {

            }
            column(CustNo; Cust."Registration Number")
            {

            }

            column(caption4; caption4)
            {

            }
            column(CompanyGST; CompanyInfo.GetRegistrationNumber())
            {

            }
            column(caption5; caption5)
            {

            }

            column(GSTN_No; "GSTN No")
            {

            }
            column(DetailedGSTLedgerEntry; DetailedGSTLedgerEntry."GST Base Amount")
            {

            }
            column(Location_GST_Reg__No_; "Location GST Reg. No.")
            {

            }



            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(StartingDate; StartingDate)
            {

            }
            column(EndingDate; EndingDate)
            {

            }








            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = WHERE(Type = FILTER(Item));
                DataItemLink = "Document No." = field("No.");



                column(Document_No_; "Document No.")
                {

                }

                column(Posting_Date; "Posting Date")
                {

                }
                column(gst_base_amount; gst_base_amount)
                {

                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }


                column(IGST_amount; IGST_amount)
                {

                }
                column(IGST_perc; IGST_perc)
                {

                }

                column(CGST_amount; CGST_amount)
                {

                }
                column(CGST_perc; CGST_perc)
                {

                }
                column(SGST_amount; SGST_amount)
                {

                }
                column(SGST_perc; SGST_perc)
                {

                }
                column(Total_amount; Total_amount)
                {

                }







                trigger OnAfterGetRecord()
                var





                begin





                    IGST_perc := 0;
                    IGST_amount := 0;
                    CGST_perc := 0;
                    CGST_amount := 0;
                    SGST_perc := 0;
                    SGST_amount := 0;
                    //Total_amount:=0;

                    DetailedGSTLedgerEntry.RESET;

                    DetailedGSTLedgerEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    //DetailedGSTLedgerEntry.SETRANGE("No.", "Sales Invoice Line"."No.");
                    IF DetailedGSTLedgerEntry.FINDSET THEN
                        REPEAT
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN BEGIN
                                //IGST_perc := DetailedGSTLedgerEntry."GST %";
                                IGST_amount += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'SGST' THEN BEGIN
                                // SGST_perc := DetailedGSTLedgerEntry."GST %";
                                SGST_amount += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'CGST' THEN BEGIN
                                // CGST_perc := DetailedGSTLedgerEntry."GST %";
                                CGST_amount += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;






                    Total_amount := "Amount Including VAT" + IGST_amount + CGST_amount + SGST_amount;

                end;


            }

            trigger OnAfterGetRecord()
            var
            begin

                If Cust.Get("Sales Invoice Header"."Sell-to Customer No.") then;

            end;
        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartingDate; StartingDate)
                    {
                        ApplicationArea = all;
                        Caption = 'Starting Date';



                    }
                    field(EndingDate; EndingDate)
                    {
                        ApplicationArea = all;
                        Caption = 'Ending Date';



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


    end;





    var
        caption1: Label 'Sales Register';
        CompanyInfo: Record "Company Information";




        caption4: Label 'From';
        caption5: Label 'To';


        "GSTN No": Code[20];

        StartingDate: Date;
        EndingDate: Date;

        gst_base_amount: Decimal;

        IGST_amount: Decimal;
        SGST_amount: Decimal;
        CGST_amount: Decimal;

        IGST_perc: Decimal;
        CGST_perc: Decimal;
        SGST_perc: Decimal;


        Total_amount: Decimal;
        // customerinfo: Record Customer;
        Cust: Record "Customer";

        //"DetailedCust.ledg.Entry": Record "DetailedCust.ledg.Entry";
        DetailedGSTLedgerEntry: Record "GST Ledger Entry";


}