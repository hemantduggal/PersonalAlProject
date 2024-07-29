report 50008 "Stock Transfer Report"
{
    ApplicationArea = All;
    Caption = 'Stock Transfer Report';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Stock transfer.rdl';
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING("Number");
            column(companypic; companyinfo.Picture)
            {

            }
            column(OutputNo; OutputNo)
            {

            }

            column(Number_Copies; Number)
            {

            }
            column(Copy_Text; CopyText)
            {

            }
            dataitem(TransferReceiptHeader; "Transfer Receipt Header")
            {
                RequestFilterFields = "No.";
                column(companyName; companyinfo.Name)
                {

                }
                column(address; companyinfo.Address)
                {

                }
                column(address2; companyinfo."Address 2")
                {

                }
                column(city; companyinfo.City)
                {

                }
                column(pincode; companyinfo."Post Code")
                {

                }
                column(country; companyinfo.County)
                {

                }
                column(phone; companyinfo."Phone No.")
                {

                }
                column(gst; companyinfo."GST Registration No.")
                {

                }
                column(fax; companyinfo."Fax No.")
                {

                }
                column(No; "No.")
                {
                }
                column(PostingDate; "Posting Date")
                {
                }
                column(TransferfromCode; "Transfer-from Code")
                {
                }
                column(TransferfromName; "Transfer-from Name")
                {
                }
                column(TransferfromName2; "Transfer-from Name 2")
                {
                }
                column(TransferfromAddress; "Transfer-from Address")
                {
                }
                column(TransferfromAddress2; "Transfer-from Address 2")
                {
                }
                column(TransferfromPostCode; "Transfer-from Post Code")
                {
                }
                column(TransferfromCity; "Transfer-from City")
                {
                }
                column(TransferfromCounty; "Transfer-from County")
                {
                }
                column(TrsffromCountryRegionCode; "Trsf.-from Country/Region Code")
                {
                }
                column(TransfertoCode; "Transfer-to Code")
                {
                }
                column(TransfertoName; "Transfer-to Name")
                {
                }
                column(TransfertoName2; "Transfer-to Name 2")
                {
                }
                column(TransfertoAddress; "Transfer-to Address")
                {
                }
                column(TransfertoAddress2; "Transfer-to Address 2")
                {
                }
                column(TransfertoPostCode; "Transfer-to Post Code")
                {
                }
                column(TransfertoCity; "Transfer-to City")
                {
                }
                column(TransfertoCounty; "Transfer-to County")
                {
                }
                column(TrsftoCountryRegionCode; "Trsf.-to Country/Region Code")
                {
                }
                column(Sno; Sno)
                {

                }

                dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    DataItemLinkReference = TransferReceiptHeader;
                    DataItemLink = "Document No." = field("No.");

                    column(Item_No_; "Item No.")
                    {

                    }

                    column(Description; Description)
                    {

                    }
                    column(HSN_SAC_Code; "HSN/SAC Code")
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(rate; rate)
                    {

                    }
                    column(dis; dis)
                    {

                    }
                    column(Amount; Amount)
                    {

                    }
                    column(AmtWithWordsTaxAmt; AmtWithWordsTaxAmt)
                    {

                    }
                    column(AmountInWords; AmountInWords[1])
                    {

                    }
                    column(grand_total; grand_total)
                    {

                    }
                    trigger OnAfterGetRecord()
                    var
                        item: Record item;
                        currency: record Currency;
                    begin
                        Sno := 1;
                        dis := 0;
                        if item.Get("Transfer Receipt Line"."Item No.") then
                            rate := item."Unit Cost";
                        CLEAR(AmountInWords);
                        grand_total += Amount;
                        Check.InitTextVariable;
                        Check.FormatNoText(AmountInWords, Round(grand_total), currency.Code);
                    end;
                }

            }
            trigger OnPreDataItem()
            var
            begin
                if NoOfCopies > 1 then
                    SetRange(Number, 1, NoOfCopies)
                else
                    SetRange(Number, 1, 1);

            end;

            trigger OnAfterGetRecord()
            var
                myint: Integer;
            begin
                if Number = 1 then
                    CopyText := 'Original customer copy';

#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667

                    OutputNo += 1;
                if Number = 2 then
                    CopyText := 'Transporter customer copy';

#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667

                    OutputNo += 1;
                if Number = 3 then
                    CopyText := 'Seller customer copy';

#pragma warning disable AL0667
                IF ISSERVICETIER THEN    // Added line
#pragma warning restore AL0667

                    OutputNo += 1;
                if Number = 4 then
                    CopyText := 'Duplicate copy';


            end;

        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, suite;
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        dis := 0;

        companyinfo.get;
        companyinfo.CalcFields(companyinfo.Picture);



    end;

    var

        Sno: Integer;
        dis: Integer;
        rate: Decimal;
        AmountInWords: array[2] of Text;
        RepCheck: Report "Check";
        NoText: array[2] of Text;
        grand_total: Decimal;
        Check: Report Check;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        abc: Text;
        companyinfo: Record "Company Information";
        AmtWithWordsTaxAmt: Text;
}
