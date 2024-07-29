
page 50208 "postedClosing Balance subform"
{
    PageType = CardPart;
    //ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "PostedClosing StatementLine";
    DelayedInsert = true;
    AutoSplitKey = true;
    Editable = false;





    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';

                field(documentno; Rec.documentno)
                { ApplicationArea = all; }

                field(Denomination; Rec.Denomination)
                {
                    ApplicationArea = all;
                }
                field(Count; rec.Count)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                    begin
                        rec.Amount := rec.Denomination * rec.Count;



                    end;


                }
                field(amount; Rec.amount)
                {
                    ApplicationArea = all;
                    Editable = false;


                }





            }


        }


    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        reco: record "Closing Bal StatementLine";



    begin




    end;
}