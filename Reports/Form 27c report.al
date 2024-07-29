/// <summary>
/// Report Form27C (ID 50102).
/// </summary>
report 50102 Form27C
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Form 27C report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Form27C.rdl';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Buy-from Vendor No.";
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(Companycity; CompanyInfo.City)
            {

            }
            column(companyEmail; CompanyInfo."E-Mail")
            {

            }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(pan; CompanyInfo."P.A.N. No.")
            {

            }
            column(Companystatus; CompanyInfo."P.A.N. Status")
            {

            }
            column(poa; CompanyInfo."PAO Code")
            {

            }
            column(deductorcatagory; companyinfo."Deductor Category")
            {

            }
            column(ministrycode; companyinfo."Ministry Code")
            {

            }
            column(Companypoa; CompanyInfo."PAO Registration No.")
            {

            }

            column(industrial; companyinfo."Industrial Classification")
            {

            }

            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Buy_from_Address; "Buy-from Address")
            {

            }
            column(Buy_from_Address_2; "Buy-from Address 2")
            {

            }
            column(Buy_from_City; "Buy-from City")
            {

            }
            column(email; vendorinfo."E-Mail")
            {

            }
            column(vendorpan; vendorinfo."P.A.N. No.")
            {

            }
            column(tan; vendorinfo."Phone No.")
            {

            }
            column(No_; "Purch. Inv. Header"."No.")
            {

            }
            column(date; "Purch. Inv. Header"."Document Date")
            {

            }





            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = sorting("No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(amount; "Purch. Inv. Line".Amount)
                {

                }
                column(no; "Purch. Inv. Line"."No.")
                {

                }


                trigger OnAfterGetRecord()
                var
                begin
                    if vendorinfo.Get("Purch. Inv. Header"."Buy-from Vendor No.") then;
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


    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        vendorinfo: record Vendor;
}