/// <summary>
/// Page Employee list Page (ID 50110).
/// </summary>
page 50106 "Rolling Plan list Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Rolling Plan Header";
    CardPageId = "Rolling Plan card page";




    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';
                field(Sno; Rec.Sno)
                { ApplicationArea = all; }


                field("Rolling Plan No"; Rec."Rolling Plan No")
                {
                    ApplicationArea = All;

                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field(soNO; Rec.soNO)
                {
                    ApplicationArea = all;


                    // TableRelation = "Sales Header";
                    // trigger OnValidate()
                    // var
                    // begin
                    //     rec.soNO := '';
                    // end;


                }
                field(customerName; Rec.customerName)
                {
                    ApplicationArea = all;
                    //TableRelation = "Sales Header";

                }
                field(customerNo; Rec.customerNo)
                {
                    ApplicationArea = all;
                    //TableRelation = "Sales Header";
                    TableRelation = "Sales Header"."Sell-to Customer No.";
                    trigger OnValidate()
                    var
                        recsales: record "Sales Header";
                    begin
                        if xRec.customerNo <> Rec.customerNo then begin
                            recsales.Reset();
                            if recsales.get(Rec.customerNo) then begin

                            end;

                        end;

                    end;
                }




            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Test)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data Inserted ');
                end;
            }

        }
    }
}


