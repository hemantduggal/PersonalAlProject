/// <summary>
/// Report MyReport (ID 50107).
/// </summary>
report 50112 "Rolling Planning Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Rolling Planning.rdl';


    dataset
    {
        dataitem("Rolling Plan Header"; "Rolling Plan Header")
        {
            RequestFilterFields = "Rolling Plan No";



            column(Sno; Sno)
            {

            }

            column(Rolling_Plan_No; "Rolling Plan No")
            {

            }
            column(Date; Date)
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

            column(Heat_No; Heat_No)
            {

            }
            column(Suffix; Suffix)
            {

            }
            column(customerNo; customerNo)
            {

            }
            column(customerName; customerName)
            {

            }



            // column(itemR; itemR.Description)
            // {

            // }

            // column(Grade; Grade)
            // {

            // }
            // column(Charging_size; Charging_size)
            // {

            // }

            // column(Jominy; Jominy)
            // {

            // }
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


            dataitem("Rolling Plan Line"; "Rolling Plan Line")
            {
                column(itemno; itemno) { }
                column(itemName; itemName) { }
                column(Grade; Grade)
                {

                }
                column(Charging_size; Charging_size)
                {

                }
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
                column(Jominy; Jominy)
                {

                }




                column(Rolling_size;
                Rolling_size)
                {

                }
                column(No_of_belt_bloom; "No_of_belt/bloom")
                {

                }
                column(Length; Length)
                {

                }
                column(Size_Tolerance; "Size Tolerance")
                {

                }
                column(TDC; TDC)
                {

                }
                column(Supply_condition; Supply_condition)
                {

                }
                column(type; type)
                {

                }
                column(Fulfilment_Through; Fulfilment_Through)
                {

                }
                column(Route; Route)
                {

                }
                column(Shape; Shape)
                {

                }
                column(Charging_length; Charging_length)
                {

                }
                column(Charging_mtr_wt; "Charging_mtr/wt")
                {

                }
                column(charging_Weight; "charging Weight")
                {

                }
                column(jominy_sample_to_cut; jominy_sample_to_cut)
                {

                }
                column(Remarks; Remarks)
                {

                }
                column(Burning_loss_in_kg; Burning_loss_in_kg)
                {

                }
                column(Ending_cutting_loss_for_Round; "Ending cutting loss for Round")
                {

                }
                column(RCS_Radius; "RCS Radius")
                {

                }
                column(Ending_cutting_loss_for_RCS; "Ending cutting loss for RCS")
                {

                }
                column(Finsih_Wt_for_round; "Finsih Wt for round")
                {

                }
                column(Finsih_Wt_for_rcs; "Finsih Wt for rcs")
                {

                }
                column(total_finsih_length_for_round; "total finsih length for round")
                {

                }
                column(Total_Finish_length_for_rcs; "Total Finish length for rcs")
                {

                }
                column(Cutting_length; "Cutting length")
                {

                }
                column(Target_No_ofFinish_BarForRound; "Target No.ofFinish BarForRound")
                {

                }
                column(Target_No_ofFinish_Bar_For_RCS; "Target No.ofFinish Bar For RCS")
                {

                }
                column(Expected_yield_for_round; "Expected yield for round")
                {

                }
                column(Expected_yield_for_RCS; "Expected yield for RCS")
                {

                }
                column(Inspection_priority; "Inspection priority")
                {

                }
                column(Original_Heat_Customer; "Original Heat Customer")
                {

                }
                column(Stack_Colling_pit_colling; "Stack Colling/pit colling")
                {

                }
                column(SMS_PROCESS_REPORT; "SMS PROCESS REPORT")
                {

                }
                column(Non_confirming_heat; "Non confirming heat")
                {

                }
                column(Status; Status)
                {

                }



                trigger OnAfterGetRecord();
                var

                begin
                    // Sno := Sno + 1;
                    // if itemR.Get(itemR."No.") then;
                    // if salesinfo.get(salesinfo."No.") then;
                    // if salesL.get(salesl.Quantity) then;
                    //sales line m no.get
                    //if itemR.get("Sales Line"."No.") then;

                end;
            }
            trigger OnPreDataItem()
            var
            begin


            end;

            trigger OnAfterGetRecord()
            var
            begin
                //Sno := 0;

            end;
        }
    }
    //}

    //}


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
    //Sno: Integer;
    // salesinfo: Record "Sales Header";
    // salesL: Record "Sales Line";
    //itemR: Record "item";

}