/// <summary>
/// Report TDS Ledger Report (ID 50034).
/// </summary>
report 50034 "TDS Ledger Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\TDS LEDGER Report.rdl';

    dataset
    {
        dataitem("GST TDS/TCS Entry"; "GST TDS/TCS Entry")
        {
            column(sno; sno)
            {

            }
            column(startdate; startdate) { }
            column(enddate; enddate) { }
            column(GST_TDS_TCS_Amount__LCY_; "GST TDS/TCS Amount (LCY)") { }
            column(Posting_Date; "Posting Date") { }

            trigger OnAfterGetRecord()
            var
            begin
                Sno := Sno + 1;
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
                    field(startdate; startdate)
                    {
                        ApplicationArea = All;

                    }
                    field(enddate; enddate)
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
        Sno := 0;

    end;


    var
        myInt: Integer;
        sno: Integer;
        startdate: Date;
        enddate: date;
}