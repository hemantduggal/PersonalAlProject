/// <summary>
/// Report DETAILED PRODUCT BOOKINGReport (ID 50006).
/// </summary>
report 50006 "DETAILED PRODUCT BOOKINGReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'ReportLayout\Detailed Product booking summary.rdl';
    DefaultLayout = RDLC;


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {

            RequestFilterFields = "Item Category Code";
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(companyPicture; companyinfo.Picture)
            {

            }
            column(comaddress; companyinfo.Address)
            {

            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {

            }
            column(CompanyInfo; CompanyInfo."GST Registration No.")
            {

            }
            column(Startdate; startdate)
            {

            }
            column(EndDate; EndDate)
            {

            }
            column(Item_Category_Code; "Item Category Code")
            {

            }
            // column(Location_Code; "Location Code")
            // {

            // }

            // column(Item_No_; "Item No.")
            // {

            // }
            // column(Description; Description)
            // {

            // }


        }

        dataitem("Sales Line"; "Sales Line")
        {

            column(Location_Code; "Location Code")
            {

            }

            column(No_; "No.") { }
            column(Description; Description) { }

            column(Unit_cost; "Unit cost")
            { }
            column(Quantity; Quantity) { }
            column(Amount; Amount)
            {

            }







        }
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {

            column(Adv_Prepayment_Amount; "Adv.Prepayment Amount") { }




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
                    field(Startdate; Startdate)
                    {
                        ApplicationArea = All;

                    }
                    field(EndDate; EndDate)
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
        CompanyInfo.get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;



    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Startdate: Date;
        EndDate: Date;




}

