/// <summary>
/// Report MyReport (ID 50132).
/// </summary>
report 50132 MyReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Customer No.";



            trigger OnPreDataItem()
            begin
                Makeheader();
            end;


            trigger OnAfterGetRecord()
            begin
                MakeBody();
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
                    field(Starting_date; Starting_date)
                    {
                        ApplicationArea = all;

                    }
                    field(ending_date; ending_date)
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

    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book

    end;


    var
        myInt: Integer;
        starting_date: Date;
        ending_date: Date;
        CompanyInfo: Record "Company Information";
        TempExcelBuffer: Record "Excel Buffer" temporary;

        caption1: Label 'Date';
        caption2: Label 'Voucher';
        caption3: Label 'Account';
        caption4: Label 'Product Name';
        caption5: label 'Brand';
        caption6: Label 'Quantity';
        caption7: Label 'Inr Rate';
        caption8: Label 'Debit Amt.Orig Curr.';
        caption9: label 'Credit Amount Orig Currency';
        caption10: Label 'Balance';
        caption11: Label 'REMARKS';

        caption_blank: Label '';





    /// <summary>
    /// Makeheder.
    /// </summary>
    Local procedure Makeheader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CompanyName, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption_blank, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);



        TempExcelBuffer.AddColumn(companyinfo.Address, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Starting_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(ending_date, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn(caption1, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption4, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption5, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption6, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption7, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption8, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption9, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption10, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption11, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

    end;



    local procedure MakeBody()
    var
        myInt: Integer;


    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Document Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);

        ////voucher no has to added
        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Customer Name", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Cust. Ledger Entry".Description, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        //brand name 
        //TempExcelBuffer.AddColumn("Cust. Ledger Entry".brand_name, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        //qty---done
        //TempExcelBuffer.AddColumn("Cust. Ledger Entry".qty, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);
        //rate
        //TempExcelBuffer.AddColumn("Cust. Ledger Entry".rate, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);

        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Debit Amount (LCY)", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Credit Amount (LCY)", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Remaining Amount", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);




    end;




    /// <summary>
    /// CreateExcelBook.
    /// </summary>
    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Sales Register');
        TempExcelBuffer.WriteSheet('Sales Register', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Sales Register');
        TempExcelBuffer.OpenExcel();
    end;



}