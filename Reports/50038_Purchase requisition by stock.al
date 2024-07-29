
/// <summary>
/// Report Purchase Requisition By Status (ID 50038).
/// </summary>
report 50038 "Purchase Requisition By Status"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Purchase Requisition By Status.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(CompanyName; CompanyInfo.Name) { }
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            column(Currency_Code; "Currency Code") { }


            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Sno; Sno) { }
                column(itemNo_; "No.") { }
                column(Description; Description) { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Shipment_Date; "Shipment Date") { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Amount; Amount) { }

                trigger OnAfterGetRecord()
                var
                begin
                    Sno := Sno + 1;
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
        Sno := 0;



    end;


    var
        myInt: Integer;
        CompanyInfo: record "Company Information";
        Sno: integer;

}