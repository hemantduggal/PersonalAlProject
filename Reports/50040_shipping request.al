
/// <summary>
/// Report Shipping Request Report (ID 50040).
/// </summary>
report 50040 "Shipping Request Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\ShippingRequestReport.rdl';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            column(CompanyInfo; CompanyInfo.Address) { }





            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Sno; Sno) { }

                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Unit_Cost; "Unit Cost") { }





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
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        Sno := 0;



    end;


    var
        myInt: Integer;
        CompanyInfo: record "Company Information";
        Sno: integer;

}