report 50115 "Requisition Report"
{
    ApplicationArea = All;
    Caption = 'Requisition Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Purchreq.rdl';

    // ProcessingOnly = true;
    // UseRequestPage = false;
    // ProcessingOnly = false;

    dataset
    {
        dataitem("posted Purchase req header"; "posted Purchase req header")
        {
            RequestFilterFields = "No.";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {

            }


            column(Companycity; CompanyInfo.City) { }
            column(CompanyInfo; CompanyInfo."Post Code") { }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {

            }
            column(Document_Date;
            Document_Date)
            {
            }
            column(Location_Code; Location_Code)
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Posting_date; Posting_date)
            {
            }
            column(ReferenceNo; "Reference No")
            {
            }
            column(Vendor_No; Vendor_No)
            {
            }
            column(status; status)
            {
            }
            column(vend_address; vend_address)
            {
            }
            column(vendor_name; vendor_name)
            {
            }
            dataitem(PostedPurchreqline; PostedPurchreqline)
            {
                DataItemTableView = sorting("Document No", "line No");
                DataItemLink = "Document No" = field("No.");
                DataItemLinkReference = "posted Purchase req header";
                column(Document_No; "Document No")
                {

                }
                column(line_No; "line No")
                {

                }
                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_cost; "Unit cost")
                {

                }
                column(quantity; quantity)
                {

                }
                column(Amount; Amount)
                {

                }
                column(Remarks; Remarks)
                {

                }
            }
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

                }
            }
        }

    }
    trigger OnPreReport()
    var
    begin
        // UseRequestPage(false);
        companyinfo.get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;

    trigger OnInitReport()
    var

    begin
        // UseRequestPage(false);

    end;

    var
        companyinfo: Record "Company Information";

}
