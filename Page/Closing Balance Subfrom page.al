
page 50203 "Closing Balance subform page"
{
    PageType = CardPart;
    //ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Closing Bal StatementLine";
    DelayedInsert = true;
    AutoSplitKey = true;
    Editable = true;

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