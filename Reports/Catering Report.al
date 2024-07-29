report 50009 cateringReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Catering Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\CateringReport.rdl';

    dataset
    {
        dataitem("Purch. Comment Line"; "Purch. Comment Line")
        {

            column(CompanyName; CompanyInfo.Name)
            {

            }
            trigger OnAfterGetRecord();
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
        Sno: Integer;
        CompanyInfo: Record "Company Information";
}