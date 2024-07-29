/// <summary>
/// Report Purchase Register Report (ID 50024).
/// </summary>
report 50026 "Purchase Register Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //ProcessingOnly = true;
    caption = 'Purchase Register Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Purchase register report.rdl';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Buy-from Vendor No.", "Posting Date";

            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(postingdatefilter; postingdatefilter)
            {

            }




            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {



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
                column(Unit_Price__LCY_; "Unit Price (LCY)")
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
                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGSTLedgerEntry.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGSTLedgerEntry.SETRANGE("No.", "Purch. Inv. Line"."No.");
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
                postingdatefilter := "Purch. Inv. Header".GetFilter("Posting Date");

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