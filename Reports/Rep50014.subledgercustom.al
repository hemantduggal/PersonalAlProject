// report 50014 NewSubLedgerReports
// {
//     UsageCategory = Administration;
//     Caption = 'New Sub Ledger Report-Custom';
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'ReportLayout\SubLedgerReportsCustom.rdl';

//     dataset
//     {
//         dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
//         {
//             RequestFilterFields = "Customer No.";
//             DataItemTableView = sorting("Entry No.") order(ascending);
//             column(GLAccNo; GLAcc."No.") { }

//             column(startdate; format(startdate))
//             {

//             }
//             column(Enddate; format(Enddate))
//             {

//             }
//             column(Custno; "Customer Name")
//             {

//             }
//             column(Customer_No_; "Customer No.") { }
//             // column(Document_No_; "Document No.") { }
//             // column(Document_Type; "Document Type") { }

//             column(recCustname; recCust.Name)
//             {

//             }
//             column(CompanyInfoname; CompanyInfo.Name)
//             {

//             }
//             // column(Posting_Date; format("Posting Date"))
//             // { }



//             // column(Document_No; saleinvli."Document No.")
//             // { }
//             column(Document_No; "Document No.")
//             { }

//             column(Debit_Amt; "Debit Amount")
//             {

//             }
//             column(Credit_Amt; "Credit Amount")
//             {

//             }
//             column(prodname; ItemRec.Description)
//             {

//             }
//             column(OpeningBalance; OpeningBalance)
//             {

//             }
//             column(ItemRecINR; ItemRec."Buying Rate (INR)")
//             {

//             }
//             column(ItemRecBrand; ItemRec.Brand)
//             {

//             }

//             // column(rembal; Abs(rembal))
//             // {

//             // }
//             // column(Account; saleinvli.)
//             // {

//             // }
//             column(FreightAmount; freighamt)
//             {

//             }
//             column(SalLineAmt; SalLineAmt) { }
//             column(crMemoLineAmt; crMemoLineAmt) { }
//             // column(saleinvliItemNo; saleinvli."No.") { }
//             // column(saleinvliItemNo; saleinvli.Description) { }
//             column(saleinvliitemno; saleinvliitemno)
//             {

//             }
//             // column(saleinvliAmount; saleinvli.Amount) { };;
//             column(saleinvliAmount; saleinvliamount) { }
//             column(ItemQty; ItemQty) { }
//             column(saleinvli; saleinvli.Remarks) { }
//             // column(Unit_Price; saleinvli."Unit Price")
//             // {

//             // }
//             column(Unit_Price; Unit_Price)
//             {

//             }
//             column(saleinvh; saleinvh."Your Reference") { }
//             column(saleinvhCustName; saleinvh."Sell-to Customer Name") { }



//             column(saleper; saleper.Name) { }
//             column(saleperp; saleperp)
//             {

//             }
//             column(totalgstrate; totalgstrate) { }
//             column(TotalGST; TotalGST) { }
//             column(freighamt; freighamt) { }
//             //custom
//             column(brandname; brandname)
//             {

//             }
//             column(Posting_Date; "Posting Date")
//             {

//             }
//             column(Document_No_; "Document No.")
//             {

//             }
//             column(Document_Type; "Document Type")
//             {

//             }

//             dataitem("Sales Invoice Line"; "Sales Invoice Line")
//             {
//                 DataItemLinkReference = "Cust. Ledger Entry";
//                 DataItemLink = "document no." = field("document no.");
//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     Clear(freighamt);

//                     if "Sales Invoice Line".Type = "Sales Invoice Line".Type::"Charge (Item)" then begin
//                         freighamt += "Sales Invoice Line"."Line Amount";
//                     end;

//                     IGST_perc := 0;
//                     IGST_Amt := 0;
//                     CGST_perc := 0;
//                     CGST_Amt := 0;
//                     SGST_perc := 0;
//                     SGST_Amt := 0;
//                     TotalGST := 0;
//                     totalgstrate := 0;
//                     DetailedGSTLedgerEntry.RESET;
//                     DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
//                     DetailedGSTLedgerEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
//                     DetailedGSTLedgerEntry.SETRANGE("No.", "Sales Invoice Line"."No.");
//                     IF DetailedGSTLedgerEntry.FINDSET THEN
//                         REPEAT
//                             IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN BEGIN
//                                 IGST_perc := DetailedGSTLedgerEntry."GST %";
//                                 IGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
//                             END;
//                             IF DetailedGSTLedgerEntry."GST Component Code" = 'SGST' THEN BEGIN
//                                 SGST_perc := DetailedGSTLedgerEntry."GST %";
//                                 SGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
//                             END;
//                             IF DetailedGSTLedgerEntry."GST Component Code" = 'CGST' THEN BEGIN
//                                 CGST_perc := DetailedGSTLedgerEntry."GST %";
//                                 CGST_Amt += ABS(DetailedGSTLedgerEntry."GST Amount");
//                             END;
//                         UNTIL DetailedGSTLedgerEntry.NEXT = 0;
//                     CGST_Amt1 += CGST_Amt;
//                     SGST_Amt1 += SGST_Amt;
//                     IGST_Amt1 += IGST_Amt;
//                     totnet := "Sales Invoice Line"."Line Amount" + TotalGST;

//                     totalgst += CGST_Amt + SGST_Amt + IGST_Amt;
//                     totalgstrate := IGST_perc + CGST_perc + SGST_perc;

//                 end;
//             }

//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 "Cust. Ledger Entry".SetRange("Posting Date", startdate, Enddate);
//                 if "Cust. Ledger Entry"."Customer No." <> '' then
//                     "Cust. Ledger Entry".SetFilter("Customer No.", CustomerNo);


//             end;

//             trigger OnAfterGetRecord()
//             var
//             begin
//                 Clear(OpeningBalance);
//                 RecCLE.Reset();
//                 RecCLE.SetFilter("Posting Date", '..%1', startdate);
//                 RecCLE.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
//                 if RecCLE.FindFirst() then begin
//                     repeat
//                         RecCLE.CalcFields(Amount);
//                         OpeningBalance += RecCLE.Amount;
//                     until RecCLE.Next() = 0;
//                     // Message('%1', OpeningBalance);
//                 end;

//                 if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Payment then begin
//                     saleinvliitemno := '';
//                     saleperp := '';
//                     saleinvliAmount := 0;
//                     ItemQty := 0;
//                     Unit_Price := 0;
//                     TotalGST := 0;

//                 end
//                 else
//                     if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then begin

//                         begin
//                             saleinvliitemno := saleinvliitemno;
//                             saleperp := saleperp;
//                             saleinvliAmount := saleinvliAmount;
//                             ItemQty := ItemQty;
//                             Unit_Price := Unit_Price;
//                             TotalGST := TotalGST;


//                         end;
//                         if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then begin

//                             begin
//                                 saleinvliitemno := itemNo;
//                                 saleperp := saleperp;
//                                 saleinvliAmount := crMemoLineAmt;
//                                 ItemQty := ItemQty;
//                                 // Unit_Price := up;
//                                 TotalGST := TotalGST;
//                                 // brandname := creditbrand;
//                                 saleinvliAmount := 0;








//                             end;
//                         end;



//                         saleinvh.Reset();
//                         saleinvh.SetRange("No.", "Cust. Ledger Entry"."Document No.");
//                         if saleinvh.FindFirst() then;
//                         if saleper.Get(saleinvh."Salesperson Code") then
//                             saleperp := saleper.Name;

//                         // Clear(OpeningBalance);
//                         // RecCLE.Reset();
//                         // RecCLE.SetFilter("Posting Date", '..%1', startdate);
//                         // RecCLE.SetRange("Customer No.", Custno);
//                         // if RecCLE.FindFirst() then begin
//                         //     repeat
//                         //         RecCLE.CalcFields(Amount);
//                         //         OpeningBalance += RecCLE.Amount;
//                         //     until RecCLE.Next() = 0;
//                         // end;




//                         saleinvli.Reset();
//                         saleinvli.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
//                         if saleinvli.FindFirst() then
//                             repeat
//                                 itemNo := saleinvli."No.";
//                                 ItemQty := saleinvli.Quantity;
//                                 saleinvliitemno := saleinvli.Description;
//                                 SalLineAmt := saleinvli.Quantity * saleinvli."Unit Price";
//                                 Unit_Price := saleinvli."Unit Price";
//                                 saleinvliAmount := saleinvli.Amount;

//                             until saleinvli.Next() = 0;
//                         if ItemRec.Get(saleinvli."No.") then
//                             Description := ItemRec.Description;

//                         CredMemo.Reset();
//                         CredMemo.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
//                         if CredMemo.FindFirst() then
//                             repeat
//                                 itemNo := CredMemo."No.";
//                                 ItemQty := CredMemo.Quantity;
//                                 crMemoLineAmt := CredMemo.Quantity * CredMemo."Unit Price";
//                                 up := CredMemo."Unit Price";
//                                 creditbrand := ItemRec.brand;



//                                 if ItemRec.Get(CredMemo."No.") then
//                                     Description := ItemRec.Description;
//                             until CredMemo.Next() = 0;
//                     end;
//             end;

//             // Clear(salepersonname);

//             // Clear(OpeningBalance);
//             // if GLAcc.Get("G/L Account No.") then;
//             // RecCLE.Reset();
//             // RecCLE.SetFilter("Posting Date", '..%1', startdate);
//             // RecCLE.SetRange("Customer No.", Custno);
//             // if RecCLE.FindFirst() then begin
//             //     repeat
//             //         RecCLE.CalcFields(Amount);
//             //         OpeningBalance += RecCLE.Amount;
//             //     until RecCLE.Next() = 0;
//             // end;

//             //     saleinvh.Reset();
//             //     saleinvh.SetRange("No.", "Document No.");
//             //     if saleinvh.FindFirst() then;
//             //     Clear(freighamt);
//             //     saleinvli.Reset();
//             //     saleinvli.SetFilter("Sell-to Customer No.", Custno);
//             //     saleinvli.SetFilter(Type, '%1', saleinvli.Type::"Charge (Item)");
//             //     saleinvli.SetFilter("Posting Date", '%1..%2', startdate, Enddate - 1);
//             //     saleinvli.SetFilter("Document No.", "Document No.");
//             //     if saleinvli.FindFirst() then begin
//             //         repeat
//             //             // Message(saleinvli."No.");
//             //             freighamt += saleinvli.Amount;
//             //         until saleinvli.Next() = 0;

//             //         RecCLE.Reset();
//             //         RecCLE.SetFilter("Posting Date", '%1..%2', startdate, Enddate - 1);
//             //         RecCLE.SetRange("Customer No.", Custno);

//             //         if RecCLE.FindFirst() then begin
//             //             saleper.Reset();
//             //             saleper.SetRange(Code, RecCLE."Salesperson Code");
//             //             if saleper.FindFirst() then
//             //                 salepersonname := saleper.Name;
//             //             recCust.Reset();
//             //             if recCust.get(Custno) then;
//             //     end;

//         }
//     }
//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 field(startdate; startdate)
//                 {
//                     Caption = 'Start Date';
//                     ApplicationArea = all;
//                 }
//                 field(Enddate; Enddate)
//                 {
//                     Caption = 'End Date';
//                     ApplicationArea = all;
//                 }
//                 // field(CustomerNo; CustomerNo)
//                 // {
//                 //     Caption = 'Customer No';
//                 //     ApplicationArea = all;
//                 //     TableRelation = Customer."No.";
//                 // }
//             }
//         }
//     }
//     trigger OnPreReport()
//     var
//     begin
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(CompanyInfo.Picture);


//     end;

//     var
//         // CompanyInfo: Record "Company Information";
//         // startdate: date;
//         // Enddate: date;
//         // recCust: Record Customer;
//         RecCLE: Record "Cust. Ledger Entry";
//         // RecItem: Record Item;
//         Custno: Code[10];
//         saleinvliAmount: Decimal;

//         ItemRec: Record Item;
//         brandname: text[60];
//         Unit_Price: Decimal;
//         Cust: Record Customer;
//         OpeningBalance: Decimal;
//         bool: Boolean;
//         rembal: Decimal;
//         BAcc: Record "Bank Account";
//         accname: Text[100];
//         Paymetterm: Code[10];
//         salepersonname: Text[50];
//         saleper: Record "Salesperson/Purchaser";
//         acc: Text[100];
//         saleinvli: Record "Sales Invoice Line";
//         CLE: record "Cust. Ledger Entry";
//         saleinvh: record "Sales Invoice Header";
//         freighamt: decimal;
//         GLAcc: Record "G/L Account";
//         GLEntry: Record "G/L Entry";
//         docNo: Code[20];
//         SalLineAmt: Decimal;
//         crMemoLineAmt: Decimal;
//         CredMemo: Record "Sales Cr.Memo Line";
//         description: Text;
//         saleperp: text[100];
//         itemNo: Code[20];
//         ItemQty: Decimal;
//         CompanyInfo: Record "Company Information";
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
//         IGST_perc: Decimal;
//         IGST_Amt: Decimal;
//         CGST_perc: Decimal;
//         CGST_Amt: Decimal;
//         SGST_perc: Decimal;
//         SGST_Amt: Decimal;
//         TotalGST: Decimal;
//         ExcelBuffer: Record "Excel Buffer";
//         startdate: date;
//         Enddate: date;
//         RecItem: Record Item;
//         compinfo: Record "Company Information";

//         reccust: Record customer;
//         IGST_Amt1: Decimal;
//         CGST_Amt1: Decimal;
//         SGST_Amt1: Decimal;
//         totalgstrate: Decimal;
//         SNo: Integer;
//         totnet: Decimal;
//         Freight: Decimal;
//         state: Record State;
//         Custom: Record Customer;
//         CustomerNo: Text;
//         saleinvliitemno: Code[100];
//     // "Sales Invoice Line": Record "Sales Invoice Line";

// }






