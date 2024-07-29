// report 50010 "Sale Register SML"
// {
//     UsageCategory = Administration;
//     Caption = 'Sales Register Report1';
//     ApplicationArea = all;
//     ProcessingOnly = true;
//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {
//             RequestFilterFields = "No.";


//             dataitem("Sales Invoice Line"; "Sales Invoice Line")
//             {
//                 DataItemLink = "Document No." = field("No.");



//                 trigger OnAfterGetRecord()
//                 var
//                 Begin
//                     IGST_perc := 0;
//                     IGST_Amt := 0;
//                     CGST_perc := 0;
//                     CGST_Amt := 0;
//                     SGST_perc := 0;
//                     SGST_Amt := 0;
//                     TotalGST := 0;
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
//                     CGST_Amt1 := CGST_Amt;
//                     SGST_Amt1 := SGST_Amt;
//                     IGST_Amt1 := IGST_Amt;
//                     totnet := "Sales Invoice Line"."Line Amount" + TotalGST;

//                     totalgst := CGST_Amt + SGST_Amt + IGST_Amt;
//                     totalgstrate := IGST_perc + CGST_perc + SGST_perc;

//                     ExcelBuffer.NewRow;
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Acknowledgement No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Acknowledgement Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Header".status, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."E-Inv. Cancelled Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//                     if "Sales Invoice Header"."Acknowledgement No." = '' then
//                         ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text)
//                     else
//                         ExcelBuffer.AddColumn('Generated IRN', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Nature of Supply", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('N', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('INV', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Order Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);

//                     reccust.Reset();
//                     if reccust.Get("Sales Invoice Header"."Sell-to Customer No.") then;
//                     ExcelBuffer.AddColumn(reccust."GST Registration No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                     ExcelBuffer.AddColumn(reccust.Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Salesperson 1", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Salesperson 2", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Address" + "Sales Invoice Header"."Sell-to Address 2" + "Sales Invoice Header"."Sell-to City" + "Sales Invoice Header"."Sell-to Post Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Line"."Location Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Post Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     state.Reset();
//                     if state.Get("Sales Invoice Header".State) then;
//                     ExcelBuffer.AddColumn(state."State Code (GST Reg. No.)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to Phone No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Sell-to E-Mail", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);



//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Ship-to GST Reg. No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Ship-to Name", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Ship-to Address", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Location Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Ship-to Post Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."GST Ship-to State Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Order No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Order Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);

//                     ExcelBuffer.AddColumn("Sales Invoice Header"."External Document No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."E-Way Bill No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Port Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Ship-to Country/Region Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."transporter ID", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Transporter Name", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Mode of Transport", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."LR/RR No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);

//                     ExcelBuffer.AddColumn("Sales Invoice Header"."LR/RR Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//                     ExcelBuffer.AddColumn("Sales Invoice Header"."Vehicle No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Line No." / 10000, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     RecItem.Reset();
//                     if RecItem.Get("Sales Invoice Line"."No.") then;
//                     ExcelBuffer.AddColumn(RecItem.Description, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn(recitem.IsServiceType, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice Line"."HSN/SAC Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn("Sales Invoice line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);

//                     ExcelBuffer.AddColumn(RecItem."Base Unit of Measure", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn(RecItem."Unit Price", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Line"."Line Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Line"."Line Discount Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn("Sales Invoice Line"."Line Amount" - "Line Discount Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(totalgstrate, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(IGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(CGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(SGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(totnet, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);



//                 End;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin


//             end;

//             trigger OnPreDataItem()
//             begin
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Sales Register', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;

//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('Acknowledgment No', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Acknowledgment Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Status', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Cancel Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Document Status', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Supply Type', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('IGST On Intra', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Document Type', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Document Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Document Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer GSTIN', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer Legal Name', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('SM', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('SR', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer Address 1', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer Location', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer PinCode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer State Code', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer Phone No', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Buyer E-Mail Id', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dispatch Company Name', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dispatch Address 1', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dispatch Location', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dispatch PinCode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dispatch StateCode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping GSTIN', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping LegalName', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping Address 1', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping Location', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping PinCode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping StateCode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('SO Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('SO Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Vendor PO Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Vendor PO Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping Bill Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Shipping Bill Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Port Code', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Country', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Export Duty', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Transporter Id', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Transporter Name', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Transport Mode', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('GR / LR Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('GR / LR Date', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Vehicle Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Serial Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Product Description', FALSE, '', TRUE, true, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Is Service', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item HSN Code', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Quantity', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Unit', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Unit Price', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Total Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Discount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item Assessable Amount', FALSE, '', TRUE, true, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item GST Rate', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item IGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item CGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Item SGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Total Item Value', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);


//             end;
//         }
//     }
//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 // field(startdate; startdate)
//                 // {
//                 //     Caption = 'Start Date';
//                 //     ApplicationArea = all;
//                 // }
//                 // field(Enddate; Enddate)
//                 // {
//                 //     Caption = 'End Date';
//                 //     ApplicationArea = all;
//                 // }
//             }
//         }
//     }
//     trigger OnPreReport()
//     var
//     begin
//         // "Sales Invoice Header".SetRange("Posting Date", startdate, Enddate);
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(CompanyInfo.Picture);
//         ExcelBuffer.DELETEALL
//     end;

//     trigger OnPostReport()
//     begin
//         ExcelBuffer.CreateNewBook('Sales Register');
//         ExcelBuffer.WriteSheet('Sales Register Sheet', CompanyName, UserId);
//         ExcelBuffer.CloseBook();
//         ExcelBuffer.SetFriendlyFilename(StrSubstNo('Sales Register', CurrentDateTime, UserId));
//         ExcelBuffer.OpenExcel();
//     end;

//     var
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
//         state: Record State;


// }
