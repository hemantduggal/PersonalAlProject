/// <summary>
/// Report Sales Register Report (ID 50027).
/// </summary>
report 50027 "Sales Register Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //ProcessingOnly = true;
    caption = 'Sales Register Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Sales register report.rdl';



    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Bill-to Customer No.", "Posting Date";
            column(CompanyName;
            CompanyInfo.Name)
            {

            }
            column(Order_No_; "no.")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.") { }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(postingdatefilter; postingdatefilter)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }




            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
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
                column(IGST_Amt; IGST_Amt)
                {

                }
                column(CGST_Amt; CGST_Amt)
                {

                }
                column(SGST_Amt; SGST_Amt)
                {

                }








                trigger OnAfterGetRecord()
                var

                Begin

                    IGST_perc := 0;
                    IGST_Amt := 0;
                    CGST_perc := 0;
                    CGST_Amt := 0;
                    SGST_perc := 0;
                    SGST_Amt := 0;
                    TotalGST := 0;
                    DetailedGSTLedgerEntry.RESET;
                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                    DetailedGSTLedgerEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGSTLedgerEntry.SETRANGE("No.", "Sales Invoice Line"."No.");
                    IF DetailedGSTLedgerEntry.FINDSET THEN
                        REPEAT
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN BEGIN
                                IGST_perc := DetailedGSTLedgerEntry."GST %";
                                IGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'SGST' THEN BEGIN
                                SGST_perc := DetailedGSTLedgerEntry."GST %";
                                SGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                            IF DetailedGSTLedgerEntry."GST Component Code" = 'CGST' THEN BEGIN
                                CGST_perc := DetailedGSTLedgerEntry."GST %";
                                CGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
                            END;
                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;

                    totalgst := CGST_Amt + SGST_Amt + IGST_Amt;
                end;
            }
            trigger OnPreDataItem()
            begin
                postingdatefilter := "Sales Invoice Header".GetFilter("Posting Date");

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
        myInt: Integer;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        SGST_Amt: Decimal;
        TotalGST: Decimal;

        postingdatefilter: Text;
        CompanyInfo: Record "Company Information";
}