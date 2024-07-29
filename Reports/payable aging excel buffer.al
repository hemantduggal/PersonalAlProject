/// <summary>
/// Report 50022.
/// </summary>
report 50022 "payable aging "
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("Buy-from Vendor No.");
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
            }
            trigger OnAfterGetRecord()
            var
                Purchinvline: Record "Purchase Header";
            begin
                NoOfdays := (ToDate - "Purchase Header"."Due Date");
                age := NoOfdays;
                Purchinvline.Reset();
                if "Purchase Line"."Buy-from Vendor No." <> '' then
                    Purchinvline.SetRange("Buy-from Vendor No.", "Purchase Header"."Buy-from Vendor No.");
                if Purchinvline.FindSet() then
                    i := Purchinvline.Count;
                j += 1;
                if j = 1 then
                    makeheading();
                if j > 1 then
                    makefooter();
                if (j > 1) and (j <= i) then
                    MakeBody();
                if j > i then
                    j := 0;
            end;

            trigger OnPreDataItem()
            begin
                Makeheader();
                if "No." <> '' then
                    SetRange("No.", "Buy-from Vendor No.");
                i := 0;
                j := 0;
            end;

            trigger OnPostDataItem()
            begin

                TempExcelBuffer.NewRow();
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn('Total', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);

                TempExcelBuffer.AddColumn('', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);

                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);

                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(totalbal, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
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

                    field(currecny_code; curren.code)
                    {
                        ApplicationArea = All;
                    }
                    // field(document_type; "Purchase Header"."Document Type")
                    // {
                    //     ApplicationArea = all;
                    // }
                    field(vendor_no; "Purchase Header"."Buy-from Vendor No.")
                    {
                        ApplicationArea = All;
                    }
                    field(vendor_n; vendor."No.")
                    {
                        ApplicationArea = All;
                    }
                    field(Purchase_order_list; po."No.")
                    {
                        ApplicationArea = all;
                    }
                    field("Vendor Posting Group"; po."Vendor Posting Group")
                    {
                        ApplicationArea = all;
                    }
                    field(EndingDate; ToDate)
                    {
                        ApplicationArea = All;

                    }
                    field(openentries; openentries)
                    {
                        ApplicationArea = All;
                    }
                    field("order date"; po."Order Date")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    var
    begin
        "Purchase Header".SetRange("Posting Date", ToDate);
        CompanyInfo.Get;
        TempExcelBuffer.DELETEALL
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book
        tempExcelBuffer.CreateNewBook('Payable aging  excel buffer report');
        tempExcelBuffer.WriteSheet('Payable aging excel buffer report', CompanyName, UserId);
        tempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Payable aging excel buffer report', CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();
    end;

    var
        ToDate: Date;
        myInt: Integer;
        col1Days: Decimal;
        NoOfdays: Integer;
        CompanyInfo: Record "Company Information";
        TOtalAMOUNT: Decimal;
        TOtalRemainAMt: Decimal;
        TOtalAMt1: Decimal;
        vendor: Record Vendor;
        Balance: Decimal;
        AGE: Integer;
        openentries: Boolean;
        curren: record Currency;
        po: record "Purchase Header";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        j: Integer;
        i: Integer;
        totalbal: Decimal;
        caption1: Label 'code';
        caption2: Label 'type';
        caption3: Label 'ref date';
        caption4: Label 'Num';
        caption5: label 'reference';
        caption6: Label 'due date';
        caption7: Label 'balance';
        caption8: Label 'age';


    /// <summary>
    /// Makeheader.
    /// </summary>
    Local procedure Makeheader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(CompanyName, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Aging Details As Of', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ToDate, false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Vendor', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Name', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Order date', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posting date', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Po no', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('External document due date', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('outstanding pending due date', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
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
        TempExcelBuffer.AddColumn("Purchase Header"."Buy-from Vendor No.", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Header"."Buy-from Vendor Name", false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();


    end;

    local procedure makefooter()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Totals', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);


        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);

        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);

        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(totalbal, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);



    end;


    local procedure MakeBody()
    var
        myInt: Integer;



    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.AddColumn("Purchase Header"."Document Type", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);

        TempExcelBuffer.AddColumn("Purchase Header"."Order Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);

        TempExcelBuffer.AddColumn("Purchase Header"."No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Purchase Header"."Vendor Invoice No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Purchase Header"."Due Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Purchase Header"."Amount Including VAT", false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(AGE, false, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::number);
    end;
    /// <summary>
    /// CreateExcelBook.
    /// </summary>
    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Payable Aging');
        TempExcelBuffer.WriteSheet('Payable Aging', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Payable Aging');
        TempExcelBuffer.OpenExcel();
    end;
}