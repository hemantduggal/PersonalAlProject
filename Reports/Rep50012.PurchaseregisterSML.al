report 50012 "Purchase register SML"
{
    ApplicationArea = All;
    Caption = 'Purchase register SML';
    UsageCategory = Administration;
    ProcessingOnly = true;
    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                trigger OnAfterGetRecord()
                var
                Begin
                    SNo += 1;
                    IGST_perc := 0;
                    IGST_Amt := 0;
                    CGST_perc := 0;
                    CGST_Amt := 0;
                    SGST_perc := 0;
                    SGST_Amt := 0;
                    TotalGST := 0;
                    totalgstrate := 0;
                    DetailedGSTLedgerEntry.RESET;
                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Purch. Inv. Line"."Line No.");
                    DetailedGSTLedgerEntry.SETRANGE("Document No.", "Purch. Inv. Line"."Document No.");
                    DetailedGSTLedgerEntry.SETRANGE("No.", "Purch. Inv. Line"."No.");
                    DetailedGSTLedgerEntry.SetFilter("No.", '..%1', "Purch. Inv. Line"."Document No.");
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
                    totnet := "Purch. Inv. Line"."Line Amount" + TotalGST;

                    totalgst := CGST_Amt + SGST_Amt + IGST_Amt;
                    totalgstrate := IGST_perc + CGST_perc + SGST_perc;

                    ExcelBuffer.NewRow();



                    recvend.Reset();
                    if recvend.Get(PurchInvHeader."Buy-from Vendor No.") then;
                    ExcelBuffer.AddColumn(recvend."GST Registration No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(recvend.Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn(PurchInvHeader."Purchaser Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(PurchInvHeader."Nature of Supply", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn(PurchInvHeader."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn(PurchInvHeader."Order Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
                    ExcelBuffer.AddColumn(PurchInvHeader."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
                    excelBuffer.AddColumn(PurchInvHeader."Order No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn('INV', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn("Purch. Inv. Line"."GST Reverse Charge", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::text);
                    ExcelBuffer.AddColumn("Line No." / 10000, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                    RecItem.Reset();
                    if RecItem.Get("Purch. Inv. Line"."No.") then;
                    ExcelBuffer.AddColumn(RecItem.Description, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(RecItem."Inventory Posting Group", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Purch. Inv. Line"."HSN/SAC Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Purch. Inv. Line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(RecItem."Base Unit of Measure", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(RecItem."Unit Cost", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn("Purch. Inv. Line"."Line Amount", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(totalgstrate, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(IGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(CGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(SGST_Amt, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(totnet, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Purch. Inv. Line"."Gen. Prod. Posting Group", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(PurchInvHeader.Remarks, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                End;
            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin


            end;

            trigger OnPreDataItem()
            begin
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Purchase Register', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.NewRow;

                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('SUPPLIER GSTIN', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('SUPPLIER Legal Name', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Purchaser code', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Supply Type', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('INVOICE NO', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('INVOICE DATE', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('INVOICE POSTING DATE', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('P.O. NO', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Document Type', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Regular or Reverse Charge', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Serial Number', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Product Description', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Inventory posting Group', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item HSN Code', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Quantity', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Unit', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Unit Price', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item Assessable Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item GST Rate', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item IGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item CGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Item SGST Amount', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Total Item Value', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('GRN NO', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Gen Prod Posting Group', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Remarks', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);

            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {

            }
        }
    }
    trigger OnPreReport()
    var
    begin
        SNo := 0;
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        ExcelBuffer.DELETEALL
    end;

    trigger OnPostReport()
    begin
        ExcelBuffer.CreateNewBook('Purchase Register');
        ExcelBuffer.WriteSheet('Purchase Register Sheet', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(StrSubstNo('Purchase Register', CurrentDateTime, UserId));
        ExcelBuffer.OpenExcel();
    end;

    var
        CompanyInfo: Record "Company Information";
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        ExcelBuffer: Record "Excel Buffer";
        compinfo: Record "Company Information";
        RecItem: Record Item;
        recvend: Record Vendor;

        IGST_Amt1: Decimal;
        CGST_Amt1: Decimal;
        SGST_Amt1: Decimal;

        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        SGST_Amt: Decimal;
        TotalGST: Decimal;
        totalgstrate: Decimal;
        SNo: Integer;
        totnet: Decimal;

}