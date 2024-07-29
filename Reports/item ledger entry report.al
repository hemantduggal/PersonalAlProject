/// <summary>
/// Report MyReport (ID 50129).
/// </summary>
report 50129 "Item ledger entry report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\IL.rdl';
    Caption = 'Item Ledger';


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Item No.";


            // column("StartDate"; StartDate)
            // {
            //     //ApplicationArea = all;
            //     //Caption = 'Start Date';
            // }
            // column("EndDate"; EndDate)
            // {
            //     //ApplicationArea = all;
            //     //Caption = 'End Date';
            // }




            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyCity; CompanyInfo.City)
            {

            }
            column(companyEmail; CompanyInfo."E-Mail")
            {

            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }

            column(Sno; Sno)
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }

            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)")
            {

            }
            trigger OnAfterGetRecord()
            var
                ILRec: Record "Item Ledger Entry";
            begin

                Sno := Sno + 1;

            end;

        }

    }

    requestpage
    {
        CardPageId = 38;
        SaveValues = true;
        ShowFilter = true;


        layout
        {
            area(Content)
            {
                group(options)
                {
                    field("Date Filter"; StartDate)
                    {
                        ApplicationArea = all;
                        Caption = 'Start Date';
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = all;
                        Caption = 'End Date';
                    }




                }
            }
        }

        actions
        {
            area(processing)
            {
                action(Custom)
                {
                    // ApplicationArea = All;
                    // Caption = 'custom report';

                    // Enabled = true;
                    // //RunObject=page "Item Ledger Entries";
                    // RunObject = report "Item ledger entry report";

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
        CompanyInfo: Record "Company Information";
        StartDate: Date;
        EndDate: Date;

        Sno: Integer;
}