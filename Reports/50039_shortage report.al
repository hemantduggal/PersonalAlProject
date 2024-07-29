
/// <summary>
/// Report Shortage Report (ID 50039).
/// </summary>
report 50039 "Shortage Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\ShortageReport.rdl';
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Sno; Sno) { }
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                trigger OnAfterGetRecord()
                var
                begin
                    Sno := Sno + 1;
                end;

            }

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                column(Location_Code; "Location Code") { }
                column(Remaining_Quantity; "Remaining Quantity") { }
                trigger OnAfterGetRecord()
                var
                begin
                    Clear("Remaining Quantity");
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