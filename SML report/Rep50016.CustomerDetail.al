report 50016 "Salesinvoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Salesinvoice.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number);
            column(OutputNo; OutputNo)
            {

            }
            column(Number; Number)
            {

            }
            column(NoOfCopies; NoOfCopies)
            {

            }
            column(CopyText; CopyText)
            {

            }

            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                RequestFilterFields = "No.";

                column(Order_No_; "Order No.")
                {


                }
                column(Bill_to_Address; "Bill-to Address")
                {

                }
                // column(Bill_to_Customer_No_;"Bill-to Customer No."){}
                column(SNo; SNo)
                {

                }
                column(Order_Date; "Order Date")
                {

                }
                column(Posting_Date; "Posting Date")
                {

                }
                column(Bal__Account_No_; "Bal. Account No.")
                {

                }
                column(IRN_Hash; "IRN Hash") { }
                column(Acknowledgement_No_; "Acknowledgement No.") { }
                column(DocumentNo; DocumentNo) { }
                column(E_Way_Bill_No_; "E-Way Bill No.") { }
                column(No_; "No.") { }
                column(Acknowledgement_Date; "Acknowledgement Date") { }
                column(Document_Date; "Document Date") { }
                column(Reversed; Reversed) { }
                column(Due_Date; "Due Date") { }
                column(Payment_Date; "Payment Date") { }
                column(Shipment_Date; "Shipment Date") { }
                column(Bill_to_Address_2; "Bill-to Address 2") { }
                column(Bill_to_City; "Bill-to City") { }
                column(Bill_to_Contact; "Bill-to Contact") { }
                column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }
                column(Bill_to_County; "Bill-to County") { }
                column(Bill_to_Customer_No_; "Bill-to Customer No.") { }
                column(Bill_to_Name; "Bill-to Name") { }
                column(Bill_to_Post_Code; "Bill-to Post Code") { }
                column(GST_Bill_to_State_Code; "GST Bill-to State Code") { }
                column(Ship_to_Address; "Ship-to Address") { }
                column(Ship_to_Address_2; "Ship-to Address 2") { }
                column(Ship_to_City; "Ship-to City") { }
                column(Ship_to_Code; "Ship-to Code") { }
                column(Ship_to_Contact; "Ship-to Contact") { }
                column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
                column(Ship_to_County; "Ship-to County") { }
                column(Ship_to_Customer; "Ship-to Customer") { }
                column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
                column(Ship_to_Name; "Ship-to Name") { }
                column(Ship_to_Post_Code; "Ship-to Post Code") { }
                column(GST_Customer_Type; "GST Customer Type") { }
                column(custgst; cust."GST Registration No.")
                {

                }
                column(custpan; cust."P.A.N. No.")
                {

                }
                column(custgsttype; cust."GST Customer Type")
                {

                }
                column(cust2gst; cust."GST Registration No.")
                {

                }
                column(cust2pan; cust."P.A.N. No.")
                {

                }
                column(cust2gsttype; cust."GST Customer Type")
                {

                }
                column(companypan; companyinfo."P.A.N. No.")
                {

                }
                column(GST_Ship_to_State_Code; "GST Ship-to State Code")
                {

                }










                column(CompanyName; CompanyInfo.Name)
                {

                }
                column(companyAddress; companyinfo.Address)
                {

                }
                column(ifsc; bank."IFSC Code")
                {

                }
                column(companyAddress2; companyinfo."Address 2")
                {

                }
                column(companycity; companyinfo.City)
                {

                }
                column(companystate; companyinfo."Post Code")
                {

                }
                column(companyphone; companyinfo."Phone No.")
                {

                }
                column(companypicture; companyinfo.Picture)
                {

                }
                column(Companygst; CompanyInfo."GST Registration No.") { }
                column(Companybank; CompanyInfo."Bank Account No.") { }
                column(CompanybankName; CompanyInfo."Bank Name") { }
                column(Companyemail; CompanyInfo."E-Mail") { }
                column(companyphoneno; companyinfo."Phone No.") { }
                column(Mode_of_Transport; "Mode of Transport")
                {

                }
                column(Vehicle_No_; "Vehicle No.")
                {

                }


                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    //       dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    // {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    DataItemLink = "Document No." = field("No.");
                    DataItemLinkReference = "Sales Invoice Header";


                    column(Item_Category_Code;
                    "Item Category Code")
                    {

                    }
                    column(totalgst; totalgst)
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(Amount; Amount)
                    {

                    }

                    column(Unit_Cost__LCY_; "Unit Cost (LCY)")
                    {

                    }
                    column(hsn; hsn)
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }



                    column(totnet; totnet)
                    {

                    }
                    column(HSN_SAC_Code; "HSN/SAC Code") { }
                    column(Unit_of_Measure; "Unit of Measure") { }
                    column(Unit_Cost; "Unit Price") { }
                    column(Tax_Liable; "Tax Liable") { }
                    column(Amountinwords; Amountinwords[1]) { }
                    column(TAmountinwords; TAmountinwords[1]) { }
                    column(CGST_Amt1; CGST_Amt1) { }
                    column(SGST_Amt1; SGST_Amt1) { }
                    column(IGST_Amt1; IGST_Amt1) { }

                    column(SGST_perc1; sgst_per1) { }
                    column(CGST_perc1; cgst_per1) { }
                    column(IGST_perc1; igst_per1) { }
                    column(Transport_Method; "Transport Method") { }

                    // column(ifsc)














                    trigger OnAfterGetRecord()
                    var
                        vend: Record Vendor;
                        Cust: record Customer;




                    begin

                        if bank.get(companyinfo."Bank Name") then;

                        // SNo := SNo + 1;
                        // hsn := '019081';
                        SNo := SNo + 1;

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
                        CGST_Amt1 := CGST_Amt;
                        SGST_Amt1 := SGST_Amt;
                        IGST_Amt1 := IGST_Amt;
                        igst_per1 := IGST_perc;
                        sgst_per1 := SGST_perc;
                        cgst_per1 := CGST_perc;

                        totnet := "Sales Invoice Line"."Line Amount" + TotalGST;

                        totalgst := CGST_Amt1 + SGST_Amt1 + IGST_Amt1;
                        // totalgstrate := igst_per1 + CGST_perc1 + SGST_perc1;

                        if vend.Get("Sales Invoice Header"."Order No.") then;

                        // totalamt += Amount;
                        Clear(Amountinwords);
                        check.InitTextVariable();
                        check.FormatNoText(Amountinwords, Round(totnet), "Sales Invoice Header"."Currency Code");
                        Clear(TAmountinwords);
                        check.InitTextVariable();
                        check.FormatNoText(TAmountinwords, Round(TotalGST), "Sales Invoice Header"."Currency Code");


                    end;

                }
                trigger OnAfterGetRecord()
                var

                begin
                    if cust.get("Sales Invoice Header"."Bill-to Customer No.") then;
                    if cust2.get("Sales Invoice Header"."Ship-to Customer") then;

                end;
            }
            trigger OnPreDataItem()
            var
            begin
                //     NoOfLoops := ABS(NoOfCopies) + 1;
                // CopyText := 'Original';
                // SETRANGE(Number, 1, NoOfLoops);
                // OutputNo := 1;
                if Noofcopies > 1 then
                    setrange(Number, 1, NoOfCopies)
                else
                    SetRange(Number, 1, 1);


            end;

            trigger OnAfterGetRecord();
            begin
                "Serial No." := 0;
                OutputNo += 1;
                if OutputNo = 1 then
                    CopyText := 'Original for Recipient'
                else
                    CopyText := 'Duplicate Copy';
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
    procedure Amountinwordss(Amounts: Decimal)
    var

    begin

    end;

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
    end;

    var
        companyinfo: Record "Company Information";


        "SNo": Integer;

        DocumentNo: Code[20];
        hsn: Text[20];
        Amountinwords: array[2] of Text[80];
        reportcheck: Report "Check";
        TAmountinwords: array[2] of Text[80];
        totalamt: Decimal;
        check: Report Check;
        postedpurinvoice: Record "Purch. Inv. Header";
        cust: record customer;

        IGST_perc: decimal;
        IGST_Amt: decimal;
        CGST_perc: decimal;
        CGST_Amt: decimal;
        SGST_perc: decimal;
        SGST_Amt: decimal;
        TotalGST: decimal;

        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";

        PurchLine: Record "Purch. Inv. Line";
        CGST_Amt1: Decimal;
        SGST_Amt1: Decimal;
        cust2: record Customer;
        comp: record Company;
        IGST_Amt1: Decimal;
        igst_per1: Decimal;
        sgst_per1: decimal;
        cgst_per1: Decimal;

        totnet: Decimal;

        totalgstrate: Decimal;
        bank: record "Bank Account";
        sdate: Date;
        edate: Date;
        tdsentry: Record "GST TDS/TCS Entry";
        tdsAmt: Decimal;
        purchInvLinAmt: Decimal;
        "Serial No.": Integer;
        printcopies: Integer;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        Number: Decimal;
        abc: Text;
        FormatDocument: Codeunit "Format Document";
        "Purch. InvLine": Record "Purch. Inv. Line";
        purchInvHead: Record "Purch. Inv. Header";
        sinvh: record "Sales Invoice Header";
        sinvl: Record "Sales Invoice Line";
        saleinvlineam: Decimal;
    // re: Record formatdo






}