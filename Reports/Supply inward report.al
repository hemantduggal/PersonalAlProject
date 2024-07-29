/// <summary>
/// Report Supply Inward Report  (ID 50134).
/// </summary>
report 50134 "Supply Inward Report "
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Supply Inward report.rdl';
    Caption = 'Supply Inward report';



    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";

            column(Company_name; CompanyInfo.Name)
            {

            }
            column(Company_address; CompanyInfo.Address)
            {

            }
            column(Company_city; CompanyInfo.City)
            {

            }
            column(CompanyInfo; CompanyInfo."State Code")
            {

            }
            column(Company_image; CompanyInfo.Picture)
            {

            }
            column(Company_phone; CompanyInfo."Phone No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }

            column(starting_date1; starting_date1)
            {

            }
            column(ending_date1; ending_date1)
            {

            }

            column(Posting_Date; "Posting Date")
            {

            }







            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = WHERE(Type = FILTER(Item));
                DataItemLink = "Document No." = field("No.");

                column(Grand_total_Amount; Grand_total_Amount)
                {

                }
                column(Amount; Amount)
                {

                }
                // column(Amount_Including_VAT; "Amount Including VAT")
                // {

                // }

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
                column(Document_No_; "Document No.")
                {

                }



            }


            trigger OnAfterGetRecord()
            var
            begin
                IGST_perc := 0;
                IGST_amount := 1250;
                CGST_perc := 0;
                CGST_amount := 0;
                SGST_perc := 0;
                SGST_amount := 0;
                //Total_amount:=0;
                Grand_total_Amount := Amount + IGST_amount + CGST_amount + SGST_amount;

                DetailedGSTLedgerEntry.RESET;

                DetailedGSTLedgerEntry.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");

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
                //Total_amount := "Amount Including VAT" + IGST_amount + CGST_amount + SGST_amount;
                //Grand_total_Amount := IGST_amount + CGST_amount + SGST_amount + "Amount Including VAT";
            end;


        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'starting_date';

                    field(ending_date1; ending_date1)
                    {
                        ApplicationArea = all;

                    }
                    field(Starting_date1; Starting_date1)
                    {
                        ApplicationArea = All;
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
        CompanyInfo.CalcFields(CompanyInfo.Picture)
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Starting_date1: Date;
        ending_date1: Date;
        DetailedGSTLedgerEntry: Record "GST Ledger Entry";
        IGST_amount: Decimal;
        SGST_amount: Decimal;
        CGST_amount: Decimal;

        IGST_perc: Decimal;
        CGST_perc: Decimal;
        SGST_perc: Decimal;
        Grand_total_Amount: Decimal;
}