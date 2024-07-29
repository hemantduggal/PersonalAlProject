/// <summary>
/// Page ArchiveCastingPlanningsubform (ID 50359).
/// </summary>
page 50359 "ArchiveCastingPlanningsubform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Archive Casting PlanningLine";
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
                field("Casting Plan No"; Rec."Casting Plan No") { ApplicationArea = all; }
                field(itemno; Rec.item_no)
                {
                    ApplicationArea = All;
                    TableRelation = Item."No.";

                    trigger OnValidate()
                    var
                        recitem: record Item;
                    begin
                        if xRec.item_no <> Rec.item_no then begin
                            recitem.Reset();
                            if recitem.get(recitem."No.") then begin
                                rec.Decription := recitem.Description;

                                rec.UOM := recitem."Base Unit of Measure";

                            end;

                        end;

                    end;

                }
                field(Decription; Rec.Decription)
                {
                    ApplicationArea = All;


                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;

                }
                field("Billet size"; Rec."Billet size") { ApplicationArea = all; }

                field(Rolling_size; Rec.Rolling_size)
                {
                    ApplicationArea = All;

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

                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;



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



                field(remainingqty; rec.remainingqty)
                {

                }
                field(No_of_Heat; Rec.No_of_Heat) { ApplicationArea = all; }
                field(TDC; Rec.TDC)
                {
                    ApplicationArea = All;

                }
                field(Jominy; Rec.Jominy)
                {
                    ApplicationArea = All;

                }
                field(Length; Rec.Length)
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
                field("MFR NO"; Rec."MFR NO")
                {
                    ApplicationArea = All;

                }
                field("CE VALUE"; Rec."CE VALUE")
                {
                    ApplicationArea = All;

                }
                field("DL VALUE"; Rec."DL VALUE")
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
                field("BILLET/Bloom"; Rec."BILLET/Bloom")
                {
                    ApplicationArea = All;

                }
                field(PRIORITY; Rec.PRIORITY)
                {
                    ApplicationArea = All;

                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;

                }



            }
        }
    }




}