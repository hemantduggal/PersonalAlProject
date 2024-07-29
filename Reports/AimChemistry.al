report 50047 AimChemistry
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Aim Chemistry Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\AimChemistry.rdl';

    dataset
    {
        dataitem("Aim Chemistry Header"; "Aim Chemistry Header")
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