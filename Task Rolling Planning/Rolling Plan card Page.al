/// <summary>
/// Page 50111.
/// </summary>
page 50107 "Rolling Plan card page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Rolling Plan Header";
    Caption = 'Rolling Plan header card page ';
    AboutText = 'Card PAge ';
    AboutTitle = 'This Is a card Page ';


    layout
    {
        area(Content)
        {
            group(GeneralDetail)
            {
                field("Rolling Plan No"; Rec."Rolling Plan No")
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
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
                field(Heat_No; Rec.Heat_No)
                {
                    ApplicationArea = All;

                }
                field(Suffix; Rec.Suffix)
                {
                    ApplicationArea = All;

                }

                field(soNO; Rec.soNO)
                {
                    ApplicationArea = all;
                    TableRelation = "Sales Header";
                    trigger OnValidate()
                    var
                    begin
                        rec.soNO := '';
                    end;

                }
                field(customerName; Rec.customerName)
                {
                    ApplicationArea = all;

                    TableRelation = "Sales Header";
                    trigger OnValidate()
                    var
                    begin
                        rec.soNO := '';
                    end;


                }
                field(customerNo; Rec.customerNo)
                {
                    ApplicationArea = all;
                    TableRelation = "Sales Header";
                    trigger OnValidate()
                    var
                    begin
                        rec.soNO := '';
                    end;

                }

            }
            group(otherdetails)
            {
                part(general; "Rolling Plan subform page")
                {
                    SubPageLink = TDC = field("Rolling Plan No");
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
                // RunObject = page 50111; Xmlport.Run(50100, true, true);
                // RunPageLink = "Name" = field(Name);
                Image = Relationship;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

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