/// <summary>
/// Report Supply Inward Excel Buffer (ID 50135).
/// </summary>
report 50135 "Supply Inward Excel Buffer"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {


            }

            trigger OnPreDataItem()
            begin
                // Makeheder();
            end;

            trigger OnAfterGetRecord()
            begin
                MakeBody();
                IGST_amount := 1250;
                // SGST_Amount := 637.498;
                // CGST_Amount := 6377.498;
                If "Purch. Inv. Header".Get("Purch. Inv. Header"."Buy-from Vendor No.") then;
                Grand_total := Amount + IGST_amount + SGST_amount + CGST_amount + "Purch. Inv. Line".Amount + "Purch. Inv. Header".Amount;




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

                    field(ending_date1; ending_date)
                    {
                        ApplicationArea = all;

                    }
                    field(Starting_date1; Starting_date)
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
                action("Export to excel")
                {
                    ApplicationArea = All;


                    Image = Export;
                    trigger OnAction()
                    var
                    begin


                    end;

                }
            }
        }
    }

    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);


        if Starting_date = 0D then
            Error('Starting_date1 must not be blank');
        if ending_date = 0D then
            Error('ending_date1 must not be blank');
        Makeheder();






    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book
    end;








    var
        myInt: Integer;
        Grand_total: Decimal;


        IGST_amount: Decimal;


        SGST_amount: Decimal;
        CGST_amount: Decimal;

        Grand_total_Amount: Decimal;

        TempExcelBuffer: Record "Excel Buffer" temporary;
        companyinfo: Record "Company Information";

        caption: Label 'Supply Inward Register';
        caption2: Label 'Voucher Services : All';
        caption3: Label 'Document No.';
        caption4: Label ' Vendor Name';
        caption111: Label ' Total Amount';
        caption5: Label 'Invoice Amount ';
        caption6: Label 'IGST';
        caption7: Label 'SGST';
        caption8: Label 'CGST';

        caption_b1: Label '';
        caption_a2: Label '';
        caption_b2: Label '';

        caption_a3: Label '';
        caption11: label 'From Date : ';
        caption12: Label 'To Date : ';

        Starting_date: Date;
        ending_date: Date;
        posting_date: Label 'Posting Date';




    /// <summary>
    /// Makeheder.
    /// </summary>
    Local procedure Makeheder()
    var
        myInt: Integer;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(companyinfo.Picture, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_b1, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn(CompanyName, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption_a2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_b2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(companyinfo.Address, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption_a3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_a3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


        TempExcelBuffer.AddColumn(caption, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_a3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_b1, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption11, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);



        TempExcelBuffer.AddColumn(Starting_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(caption12, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ending_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(posting_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption4, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption111, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption5, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption6, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption7, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption8, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var
        myInt: Integer;


    begin
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn("Purch. Inv. Header"."Document Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);

        TempExcelBuffer.AddInfoColumn("Purch. Inv. Line"."Document No.", false, FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);


        TempExcelBuffer.AddColumn("Purch. Inv. Header"."Buy-from Vendor Name", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Grand_total, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);

        TempExcelBuffer.AddColumn("Purch. Inv. line".Amount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);



        TempExcelBuffer.AddColumn(IGST_amount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(CGST_amount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(SGST_amount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);






    end;


    /// <summary>
    /// CreateExcelBook.
    /// </summary>
    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Supply Inward Register');
        TempExcelBuffer.WriteSheet('Supply Inward Register', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Supply Inward Register');
        TempExcelBuffer.OpenExcel();
    end;



}