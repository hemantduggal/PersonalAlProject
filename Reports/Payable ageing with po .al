/// <summary>
/// Report Payable ageing with PO (ID 50001).
/// </summary>
report 50021 "Payable ageing with PO"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Payable ageing with po.rdl';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            // DataItemTableView = where("Document Type" = const(Invoice));
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(No_P; "No.")
            {

            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {

            }
            column(Due_Date; "Due Date")
            {

            }

            column(AGE; AGE)
            {

            }
            column(ToDate; ToDate)
            {

            }
            column(Amount1; Amount)
            {

            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                column(col1Days; col1Days)
                {

                }


                trigger OnAfterGetRecord()
                var
                    vendor: Record "Vendor Ledger Entry";

                begin




                    NoOfdays := (ToDate - "Purchase Header"."Due Date");
                    age := NoOfdays;

                    // if (NoOfdays >= 0) And (NoOfdays <= 30) then
                    //col1Days := "Purchase Line".Amount;
                    // Clear(col1Days);
                    // vendor.Reset();
                    // vendor.SetRange("Vendor No.", "No.");
                    // if vendor.FindSet() then
                    //     vendor.Amount := col1Days;
                    // vendor.Modify();







                end;

            }
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
                    field(document_type; "Purchase Header"."Document Type")
                    {
                        ApplicationArea = all;
                    }
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
}