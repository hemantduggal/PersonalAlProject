/// <summary>
/// Page Employee subform page (ID 50112).
/// </summary>
page 50108 "Rolling Plan subform page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Rolling Plan Line";
    Caption = 'subform page';
    Description = 'This is a subfrom page ';
    AboutText = 'Subform PAge ';
    AboutTitle = 'This Is a Subform Page ';


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';
                field(itemno; Rec.itemno)
                {
                    ApplicationArea = All;
                    TableRelation = Item."No.";

                    trigger OnValidate()
                    var
                        recitem: record Item;
                    begin
                        if xRec.itemno <> Rec.itemno then begin
                            recitem.Reset();
                            if recitem.get(recitem."No.") then begin

                            end;

                        end;

                    end;

                }
                field(itemName; Rec.itemName)
                {
                    ApplicationArea = All;
                    TableRelation = Item.Description;

                    trigger OnValidate()
                    var
                        recitem: record Item;
                    begin
                        if xRec.itemName <> Rec.itemName then begin
                            recitem.Reset();
                            if recitem.get(recitem."description") then begin

                            end;

                        end;

                    end;

                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                    // TableRelation = "Sales Line"."Unit of Measure";

                    // trigger OnValidate()
                    // var
                    //     recsales: record "Sales Line";
                    // begin
                    //     if xRec.UOM <> Rec.UOM then begin
                    //         recsales.Reset();
                    //         if recsales.get(recsales."Unit of Measure") then begin

                    //         end;

                    //     end;

                    // end;


                }
                field(planningQty; Rec.planningQty)
                {
                    ApplicationArea = All;
                    // TableRelation = "Sales Line"."Qty. to Assign";

                    // trigger OnValidate()
                    // var
                    //     recsales: record "Sales Line";
                    // begin
                    //     if xRec.planningQty <> Rec.planningQty then begin
                    //         recsales.Reset();
                    //         if recsales.get(recsales."Qty. to Assign") then begin

                    //         end;

                    //     end;

                    // end;

                }

                field(SOqty; Rec.SOqty)
                {
                    ApplicationArea = All;
                    // TableRelation = "Sales Line".Quantity;

                    // trigger OnValidate()
                    // var
                    //     recsales: record "Sales Line";
                    // begin
                    //     if xRec.SOqty <> Rec.SOqty then begin
                    //         recsales.Reset();
                    //         if recsales.get(recsales.Quantity) then begin

                    //         end;

                    //     end;

                    // end;

                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;

                }
                field(remainingqty; rec.remainingqty)
                {

                }
                field(Charging_size; Rec.Charging_size)
                {
                    ApplicationArea = All;

                }
                field(Jominy; Rec.Jominy)
                {
                    ApplicationArea = All;

                }
                field(Rolling_size; Rec.Rolling_size)
                {
                    ApplicationArea = All;

                }
                field("No_of_belt/bloom"; Rec."No_of_belt/bloom")
                {
                    ApplicationArea = All;

                }
                field(Length; Rec.Length)
                {
                    ApplicationArea = All;

                }
                field("Size Tolerance"; Rec."Size Tolerance")
                {
                    ApplicationArea = All;

                }
                field(TDC; Rec.TDC)
                {
                    ApplicationArea = All;

                }
                field(Supply_condition; Rec.Supply_condition)
                {
                    ApplicationArea = All;

                }
                field(type; Rec.type)
                {
                    ApplicationArea = All;

                }
                field(Fulfilment_Through; Rec.Fulfilment_Through)
                {
                    ApplicationArea = All;

                }
                field(Route; Rec.Route)
                {
                    ApplicationArea = All;

                }
                field(Shape; Rec.Shape)
                {
                    ApplicationArea = All;

                }
                field(Charging_length; Rec.Charging_length)
                {
                    ApplicationArea = All;

                }
                field("Charging_mtr/wt"; Rec."Charging_mtr/wt")
                {
                    ApplicationArea = All;

                }
                field("charging Weight"; Rec."charging Weight")
                {
                    ApplicationArea = All;

                }
                field(jominy_sample_to_cut; Rec.jominy_sample_to_cut)
                {
                    ApplicationArea = All;

                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;

                }
                field(Burning_loss_in_kg; Rec.Burning_loss_in_kg)
                {
                    ApplicationArea = All;

                }
                field("Ending cutting loss for Round"; Rec."Ending cutting loss for Round")
                {
                    ApplicationArea = All;

                }
                field("RCS Radius"; Rec."RCS Radius")
                {
                    ApplicationArea = All;

                }
                field("Ending cutting loss for RCS"; Rec."Ending cutting loss for RCS")
                {
                    ApplicationArea = All;

                }
                field("Finsih Wt for round"; Rec."Finsih Wt for round")
                {
                    ApplicationArea = All;

                }
                field("Finsih Wt for rcs"; Rec."Finsih Wt for rcs")
                {
                    ApplicationArea = All;

                }
                field("total finsih length for round"; Rec."total finsih length for round")
                {
                    ApplicationArea = All;

                }
                field("Cutting length"; Rec."Cutting length")
                {
                    ApplicationArea = All;

                }
                field("Total Finish length for rcs"; Rec."Total Finish length for rcs")
                {
                    ApplicationArea = All;

                }
                field("Expected yield for round"; Rec."Expected yield for round")
                {
                    ApplicationArea = All;

                }
                field("Expected yield for RCS"; Rec."Expected yield for RCS")
                {
                    ApplicationArea = All;

                }
                field("Inspection priority"; Rec."Inspection priority")
                {
                    ApplicationArea = All;

                }
                field("Original Heat Customer"; Rec."Original Heat Customer")
                {
                    ApplicationArea = All;

                }
                field("Stack Colling/pit colling"; Rec."Stack Colling/pit colling")
                {
                    ApplicationArea = All;

                }
                field("SMS PROCESS REPORT"; Rec."SMS PROCESS REPORT")
                {
                    ApplicationArea = All;

                }
                field("Non confirming heat"; Rec."Non confirming heat")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }



            }
        }
    }




}