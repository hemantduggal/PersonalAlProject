
/// <summary>
/// Report Sub ledger report (ID 50103).
/// </summary>
report 50103 "Sub ledger report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Subledger.rdl';
    Caption = 'Sub Ledger';




    dataset
    {

        dataitem(copyloop; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(outputNo; "outputNO")
            {

            }

            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                RequestFilterFields = "Sell-to Customer No.";
                column(Company_name; CompanyInfo.Name)
                {

                }
                column(Sell_to_Customer_Name; "Sell-to Customer Name")
                {

                }
                column(Sell_to_Address; "Sell-to Address")
                {

                }
                column(StartingDate; StartingDate)
                {

                }
                column(EndingDate; EndingDate)
                {

                }
                column(Posting_Date; "Posting Date")
                {

                }
                column(Posting_Description; "Posting Description")
                {

                }
                column(Bal__Account_Type; "Bal. Account Type")
                {

                }


                column(brand; item.brand)
                {

                }

                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    DataItemLink = "Document No." = field("No.");

                    column(Quantity; Quantity)
                    {

                    }
                    column(Unit_Cost; "Unit Cost")
                    {

                    }
                    column(dr_amount; debt)
                    {

                    }
                    column(credit_amount; credit)
                    {

                    }
                    column(balance; balance)
                    {

                    }
                    column(item_name; Description)
                    {

                    }




                    trigger OnAfterGetRecord()
                    var
                    begin
                        Clear(debt);
                        Clear(credit);
                        Cust.Reset();
                        Cust.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                        Cust.SetRange("Customer No.", "Sales Invoice Line"."Sell-to Customer No.");

                        if cust.FindSet() then
                            repeat
                                Cust.CalcFields("Debit Amount", "Credit Amount");
                                debt += Cust."Debit Amount";
                                credit += Cust."Credit Amount";
                            until Cust.Next() = 0;
                        if customer.Get("Sales Invoice Line"."Sell-to Customer No.") then begin
                            customer.CalcFields(Balance);
                            balance := customer.Balance;
                        end;






                    end;


                }
            }
            trigger OnPreDataItem()
            begin
                NoOfCopies := 1;
                NoOfLoops := Abs(NoOfCopies) + 1;
                CopyText := 'original copy';
                SetRange(Number, 1, NoOfLoops);
                OutputNo := 1;
            end;

            trigger OnAfterGetRecord()
            begin
                if Number > 1 then
                    OutputNo += 1;
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

                    Caption = 'Options';
                    field(StartingDate; StartingDate)
                    {
                        ApplicationArea = all;
                        Caption = 'Starting Date';



                    }
                    field(EndingDate; EndingDate)
                    {
                        ApplicationArea = all;
                        Caption = 'Ending Date';



                    }

                    field(NoOfCopies; NoOfCopies)
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

    end;



    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        StartingDate: Date;
        EndingDate: Date;
        Cust: Record "Cust. Ledger Entry";
        customer: Record Customer;
        debt: Decimal;
        balance: Decimal;
        credit: Decimal;
        item: Record Item;







        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text;
        outputNo: Integer;
}