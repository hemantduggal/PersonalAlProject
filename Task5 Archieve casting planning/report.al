/// <summary>
/// Report Archive Casting PlanningReport (ID 50322).
/// </summary>
report 50322 "Archive Casting PlanningReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Archive Casting PlanningReport.rdl';


    dataset
    {
        dataitem("Archive Casting PlanningHeader"; "Archive Casting PlanningHeader")
        {
            RequestFilterFields = "Casting Plan No";



            column(Sno; Sno)
            {

            }

            column(Casting_Plan_No; "Casting Plan No")
            {

            }
            column(Casting_Plan_Date; "Casting Plan Date")
            {

            }
            column(Department_Code; "Department Code")
            {

            }
            column(Userid; Userid)
            {

            }
            column(soNO; soNO)
            {

            }


            column(customerNo; customerNo)
            {

            }
            column(customerName; customerName)
            {

            }






            // dataitem("Sales Header"; "Sales Header")
            // {

            //     column(sales_order_no; "No.")
            //     {

            //     }
            //     column(customerno; "Sell-to Customer No.")
            //     {

            //     }
            //     column(Customer_Name; "Sell-to Customer Name")
            //     {

            //     }


            //     dataitem("Sales Line"; "Sales Line")
            //     {
            //         DataItemTableView = sorting("Document No.", "Line No.");
            //         DataItemLink = "Document No." = field("No.");
            //         column(qty; Quantity)
            //         {

            //         }
            //         column(Uom; "Unit of Measure Code")
            //         {

            //         }
            //         column(planning_qty; "Reserved Quantity")
            //         {

            //         }
            //         column(remainingqty; "Outstanding Quantity")
            //         {

            //         }


            dataitem("Archive Casting PlanningLine"; "Archive Casting PlanningLine")
            {
                column(itemno; item_no) { }
                column(Decription; Decription) { }
                column(Grade; Grade)
                {

                }
                column(Billet_size; "Billet size")
                {

                }
                column(Rolling_size;
                Rolling_size)
                { }
                column(SOqty; SOqty)
                {

                }
                column(UOM; UOM)
                {

                }
                column(planningQty; planningQty)
                {

                }
                column(remainingqty; remainingqty)
                {

                }
                column(No_of_Heat; No_of_Heat) { }
                column(TDC; TDC)
                {

                }
                column(Jominy; Jominy)
                {

                }
                column(Length; Length)
                {

                }


                column(Supply_condition; Supply_condition)
                {

                }
                column(type; type)
                {

                }
                column(MFR_NO; "MFR NO")
                {

                }
                column(CE_VALUE; "CE VALUE") { }
                column(DL_VALUE; "DL VALUE") { }
                column(Fulfilment_Through; Fulfilment_Through)
                {

                }
                column(Route; Route)
                {

                }
                column(Shape; Shape)
                {

                }
                column(BILLET_Bloom; "BILLET/Bloom") { }
                column(PRIORITY; PRIORITY) { }
                column(Remarks; Remarks)
                {

                }




            }







            trigger OnPreDataItem()
            var
            begin


            end;

            trigger OnAfterGetRecord()
            var
            begin


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



    var
        myInt: Integer;


}