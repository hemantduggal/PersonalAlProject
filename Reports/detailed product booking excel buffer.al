/// <summary>
/// Report Detailed product Report (ID 50006).
/// </summary>
report 50007 "Detailed product Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {

            RequestFilterFields = "Item Category Code";



        }

        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.");




            trigger OnPreDataItem()
            var
                itemL: Record "Item Ledger Entry";
            begin
                Makeheader();


                if itemL."Location Code" <> '' then
                    itemL.SetRange("Location Code", "Sales Line"."Location Code");
                i := 0;
                j := 0;



            end;

            trigger OnAfterGetRecord()
            var
                sl: Record "Sales Line";
                sal: Record "Sales Line";
            begin
                sal.Reset();
                clear(totalqty);
                sal.SetRange("Location Code", "Sales Line"."Location Code");
                if sal.FindSet() then
                    repeat

                        totalqty += "Sales Line".Quantity;
                        totalamount += "Sales Line".Amount;
                        totaladv += "Cust. Ledger Entry"."Adv.Prepayment Amount";
                    until sal.Next = 0;



                sl.Reset();
                if sl."no." <> '' then
                    sl.SetRange("No.", "Sales Line"."No.");
                if sl.FindSet() then
                    i := Sl.Count;
                j += 1;
                if j = 1 then
                    makeheading();
                if (j > 1) and (j <= i) then
                    MakeBody();

                if j > i then
                    j := 0;



            end;


        }
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {





            trigger OnPostDataItem() ////////for totals in last 
            begin

                TempExcelBuffer.NewRow();
                TempExcelBuffer.NewRow();
                TempExcelBuffer.NewRow();
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

                TempExcelBuffer.AddColumn('TotalS', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

                TempExcelBuffer.AddColumn(totalqty, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(totalamount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(totaladv, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);


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
                    field(Startdate; Startdate)
                    {
                        ApplicationArea = All;

                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = all;
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
        TempExcelBuffer.DELETEALL;

    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book

        tempExcelBuffer.CreateNewBook('Detailed Producyt booking excel buffer report');
        tempExcelBuffer.WriteSheet('Detailed Producyt booking excel buffer report', CompanyName, UserId);
        tempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Detailed Producyt booking excel buffer report', CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();


    end;




    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Startdate: Date;
        EndDate: Date;

        TempExcelBuffer: Record "Excel Buffer" temporary;
        i: Integer;
        j: Integer;

        totalqty: Decimal;
        totalamount: Decimal;
        totaladv: decimal;

        caption1: Label 'Site Code';
        caption2: Label 'Site Description';
        caption3: Label 'Item no';
        caption4: Label 'Item description';
        caption5: label 'Price';
        caption6: Label 'Quantity';
        caption7: Label 'Amount';
        caption8: Label 'Adv. Prepayment Amount';




    /// <summary>
    /// Makeheder.
    /// </summary>
    Local procedure Makeheader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CompanyInfo.Name, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn(CompanyInfo.Address, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


        TempExcelBuffer.AddColumn(CompanyInfo."Phone No.", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


        TempExcelBuffer.AddColumn(CompanyInfo."E-Mail", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


        TempExcelBuffer.AddColumn(CompanyInfo."GST Registration No.", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


        TempExcelBuffer.AddColumn('DETAILED PRODUCT BOOKING SUMMARY PER PRODUCT ', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Date Range', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Startdate, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn('To', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(EndDate, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.NewRow();

        TempExcelBuffer.AddColumn('Category', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Item Category Code", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(caption1, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption2, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption3, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption4, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption5, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption6, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption7, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(caption8, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);



    end;

    local procedure makeheading()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Location Code", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);


    end;


    local procedure MakeBody()
    var
        myInt: Integer;



    begin


        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Sales Line"."Location Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Line"."Location Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn("Sales Line"."No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn("Sales Line"."Description", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);

        TempExcelBuffer.AddColumn("Sales Line"."Unit Cost", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Line".Quantity, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Line".Amount, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Cust. Ledger Entry"."Adv.Prepayment Amount", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);






    end;




    /// <summary>
    /// CreateExcelBook.
    /// </summary>
    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Detailed Producyt booking excel buffer report');
        TempExcelBuffer.WriteSheet('Detailed Producyt booking excel buffer report', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Detailed Producyt booking excel buffer report');
        TempExcelBuffer.OpenExcel();
    end;



}





