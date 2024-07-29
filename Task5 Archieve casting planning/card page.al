/// <summary>
/// Page ArchiveCastingPlanningcardpage (ID 50358).
/// </summary>
page 50358 "ArchiveCastingPlanningcardpage"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Archive Casting PlanningHeader";
    Caption = 'Archive Casting Planning header card page ';
    AboutText = 'Card PAge ';
    AboutTitle = 'This Is a card Page ';


    layout
    {
        area(Content)
        {
            group(GeneralDetail)
            {


                field(Sno; Rec.Sno) { ApplicationArea = all; }
                field("Casting Plan No"; Rec."Casting Plan No")
                {
                    ApplicationArea = All;

                }
                field("Casting Plan Date"; Rec."Casting Plan Date")
                {
                    ApplicationArea = All;

                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;

                }
                field(Userid; Rec.Userid)
                {
                    ApplicationArea = All;

                }
                field(soNO; Rec.soNO)
                {
                    ApplicationArea = all;
                    TableRelation = "Sales Header"."No.";
                    trigger OnValidate()
                    var
                        recsales: record "Sales Header";
                    begin
                        if xRec.soNO <> Rec.soNO then begin
                            recsales.Reset();
                            if recsales.get() then begin

                            end;

                        end;

                    end;



                }
                field(customerNo; Rec.customerNo)
                {
                    ApplicationArea = all;
                    TableRelation = Customer."No.";
                    trigger OnValidate()
                    var
                        recsales: record Customer;
                    begin
                        if xRec.customerNo <> Rec.customerNo then begin
                            recsales.Reset();
                            if recsales.get(recsales."No.") then begin
                                rec.customerName := recsales.Name;

                            end;

                        end;

                    end;



                }



                field(customerName; Rec.customerName)
                {
                    ApplicationArea = all;






                }


            }
            group(SUBFORMdetails)
            {
                part(General; "ArchiveCastingPlanningsubform")
                {
                    SubPageLink = "Casting Plan No" = field("Casting Plan No");
                    ApplicationArea = All;

                }

            }

        }
    }





    actions
    {
        area(Processing)
        {
            action("PRINT REPORT")
            {
                ApplicationArea = All;
                Caption = 'PRint report';
                Image = Print;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = report "Archive Casting PlanningReport";

                trigger OnAction()
                begin
                    Message('Report Printed ');
                end;
            }










        }
    }

    var
        myInt: Integer;
}