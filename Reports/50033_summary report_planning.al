/// <summary>
/// Report SummaryReport (ID 50032).
/// </summary>
report 50033 "Summary Report Planning"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Summary Report Planning';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\SummaryReport.rdl';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            //column(Posting_Description; "Posting Description") { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {

            }
            column(Order_No_; "Order No.") { }
            column(No_; "No.") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Expected_Receipt_Date; "Expected Receipt Date") { }
            column(Posting_Date; "Posting Date") { }



            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(itemNo_; "No.") { }
                column(Quantity; Quantity) { }
                column(Line_Amount; "Line Amount") { }


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


    var
        myInt: Integer;
}