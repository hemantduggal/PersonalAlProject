/// <summary>
/// Report MyReport (ID 50003).
/// </summary>
report 50003 Report
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\nnn.rdl';

    dataset
    {
        dataitem("G/L Budget Entry"; "G/L Budget Entry")
        {

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