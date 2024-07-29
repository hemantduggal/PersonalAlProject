/// <summary>
/// Report .
/// </summary>
report 50035 "Bank Payment Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Bank Payment Report.rdl';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            column(Amount; Amount)
            {

            }
            column(No_; "No.") { }

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



    end;


    var
        myInt: Integer;
        CompanyInfo: record "Company Information";

}