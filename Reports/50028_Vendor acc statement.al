/// <summary>
/// Report Vendor Account Statement Report (ID 50028).
/// </summary>
report 50028 "Vendor Account statementReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Vendor account statement report.rdl';
    dataset
    {
        dataitem(Vendor; Vendor)
        {



            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }


            column(CompanyPicture;
            CompanyInfo.Picture)
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {

            }


            column(Companycity; CompanyInfo.City) { }
            column(CompanyInfo; CompanyInfo."State Code") { }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {

            }
            column(startdate; startdate)
            {

            }
            column(enddate; enddate)
            {

            }

            trigger OnAfterGetRecord()
            var
            begin
                OpeningAmount := 0;

                VendLedgEntryRec.RESET;
                VendLedgEntryRec.SETRANGE(VendLedgEntryRec."Vendor No.", "No.");
                VendLedgEntryRec.SETFILTER(VendLedgEntryRec."Posting Date", '%1..%2', 0D, startdate - 1);
                IF VendLedgEntryRec.FIND('-') THEN BEGIN
                    REPEAT
                        VendLedgEntryRec.CALCFIELDS(VendLedgEntryRec.Amount);
                        OpeningAmount += VendLedgEntryRec.Amount;
                    UNTIL VendLedgEntryRec.NEXT = 0;
                END;
            end;


        }

        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(OpeningAmount; OpeningAmount) { }

            column(Posting_Date; "Posting Date")
            { }
            column(Document_No_; "Document No.")
            {

            }
            column(ClosingBalance1000000013; ClosingBalance)
            {

            }
            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            column(TotalAmount1000000009; TotalAmount)
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(OpeningAmountCaption1000000008; OpeningAmountCaption)
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Narration11000000021; Narration1)
            {

            }
            column(Description; Description)
            {

            }
            column(Total_TDS_Including_SHE_CESS; "Total TDS Including SHE CESS")
            {

            }
            column(InvoiceAmount1000000016; InvoiceAmount)
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }

            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }

            trigger OnPreDataItem()
            var
            begin

                "Vendor Ledger Entry".SETFILTER("Posting Date", '%1..%2', startdate, enddate);
                i := 0;
                TotalAmount := 0;
                CLEAR(ClosingBalance);
                CLEAR(ReverC);
                CLEAR(SumDebitAmount);
                CLEAR(SumCreditAmount);

            end;

            trigger OnAfterGetRecord()
            var
                vendledentry: Record "Vendor Ledger Entry";
            begin


                i += 1;
                SrNo += 1;
                DebitAmount := 0;
                CreditAmount := 0;
                CheckLedgEntryRec.RESET;
                CheckLedgEntryRec.SETRANGE(CheckLedgEntryRec."Document No.", "Vendor Ledger Entry"."Document No.");
                IF CheckLedgEntryRec.FIND('-') THEN;

                "Vendor Ledger Entry".CALCFIELDS("Debit Amount");
                DebitAmount := "Vendor Ledger Entry"."Debit Amount";

                "Vendor Ledger Entry".CALCFIELDS("Credit Amount");
                CreditAmount := "Vendor Ledger Entry"."Credit Amount";
                //IF (i = 1) THEN BEGIN
                TotalAmount := OpeningAmount - DebitAmount + CreditAmount;
                //END ELSE BEGIN
                TotalAmount := TotalAmount - DebitAmount + CreditAmount;
                SumDebitAmount += DebitAmount;
                SumCreditAmount += CreditAmount;
                 //END;
                ClosingBalance := OpeningAmount + SumDebitAmount - SumCreditAmount;
                Clear(OpeningAmount);
                vendledentry.SetRange("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                vendledentry.SetRange("Posting Date", 0D, startdate);
                if vendledentry.FindSet() then
                    repeat
                        vendledentry.CalcFields(Amount);
                        OpeningAmount += vendledentry.Amount;
                    until vendledentry.Next() = 0;
                // OpeningAmount += openingbalancevar;

                //MESSAGE('%1',ClosingBalance);

                DRCRtest := '';
                IF ClosingBalance > 0 THEN
                    DRCRtest := 'Dr.'
                ELSE
                    DRCRtest := 'Cr.';
                CLEAR(InvoiceAmount);
                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", "Document No.");
                IF PurchInvLine.FINDFIRST THEN
                    REPEAT
                        IF ReverC = FALSE THEN
                            InvoiceAmount += PurchInvLine."Line Amount" //+ PurchInvLine."Charges To Vendor" + PurchInvLine."Service Tax Amount"
                        ELSE
                            InvoiceAmount += PurchInvLine."Line Amount";///+  PurchInvLine."Charges To Vendor" + PurchInvLine."Service Tax Amount";
                    UNTIL PurchInvLine.NEXT = 0;

            end;








        }

    }





    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(startdate; startdate)
                    {
                        ApplicationArea = all;
                    }
                    field(enddate; enddate) { ApplicationArea = all; }

                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = all;
                        trigger OnValidate()
                        var
                        begin


                        end;
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
        startdate: Date;
        enddate: Date;



        VendorRec: Record 23;
        DebitAmount: Decimal;
        CreditAmount: Decimal;
        TotalAmount: Decimal;
        OpeningAmount: Decimal;
        CheckLedgEntryRec: Record 272;

        VendLedgEntryRec: Record 25;
        i: Integer;
        OpeningAmountCaption: Label 'ENN=Opening Amount';
        location: Record 14;
        ClosingBalance: Decimal;
        SumDebitAmount: Decimal;
        SumCreditAmount: Decimal;
        InvoiceAmount: Decimal;
        PurchInvLine: Record 123;
        //Rec: Record 16419;
        ReverC: Boolean;
        // PostedNarration: Record 16548;
        Narration1: Text;
        DateFilter: Text;
        SrNo: Integer;
        DRCRtest: Text;
        OpeningTest: Text;

        openingbalancevar: Decimal;




        CompanyInfo: Record "Company Information";

        PrintOnlyOnePerPage: Boolean;

        PageGroupNo: Integer;
        rep: Report "Vendor - Order Detail";




}