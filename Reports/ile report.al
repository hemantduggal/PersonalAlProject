/// <summary>
/// Report Sales order Report (ID 50110).
/// </summary>
report 50147 "Stock Status Report"
{
    UsageCategory = Administration;
    Caption = 'Stock Status Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Stock status.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Posting Date";



            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyCity; CompanyInfo.City)
            {

            }

            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(item_categorycode; itemR."Item Category Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(itemsUOM; itemR."Base Unit of Measure")
            {

            }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)")
            {

            }
            column(Cost_Amount__expected_; "Cost Amount (Expected)")
            {

            }
            column(startingdate; startingdate)
            {

            }
            column(landed_price; landed_price)
            {

            }
            column(landed_amount; landed_amount)
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin

                if itemR.Get("Item Ledger Entry"."Item No.") then;
                if "Item No." = "Item No." then
                    Quantity += Quantity;




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
                    field(toDAte; Startingdate)
                    {
                        ApplicationArea = All;

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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        startingdate: Date;
        itemR: Record Item;
        landed_amount: Decimal;
        landed_price: Decimal;
}