
page 50206 "postedClosing Balnce CARD PAGE"
{
    PageType = Card;
    Caption = 'Closing Balnce Card  ';
    //ApplicationArea = All;

    UsageCategory = Documents;
    SourceTable = "postedClosing Statementheader";



    layout
    {
        area(Content)
        {
            group(General)
            {

                Caption = 'general';
                field(Accountno; Rec.Accountno)
                {
                    ApplicationArea = all;
                    caption = 'Document No';
                }
                field(Acc; Rec.Acc)
                {
                    ApplicationArea = all;
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    ApplicationArea = all;
                }
                field("Total amount"; Rec."Total amount")
                {
                    ApplicationArea = all;
                }
                field(Postingdate; Rec.Postingdate)
                {
                    ApplicationArea = all;
                }



            }
            group(otherdetails)
            {
                part(closing; "postedClosing Balance subform")
                {
                    ApplicationArea = all;
                    UpdatePropagation = Both;
                    SubPageLink = documentno = field(Accountno);
                    Visible = true;
                    Editable = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Ellipsis = true;
                Image = PostOrder;
                ShortCutKey = 'F9';


                trigger OnAction()
                begin


                end;
            }
        }

    }

    trigger OnClosePage()
    var
        genj: record "Gen. Journal Line";
    begin
        genj.SetRange("Document No.", rec.Accountno);
        if genj.FindFirst() then begin
            rec.CalcFields("Total amount");
            genj.validate("Amount", rec."Total amount");
            genj.Modify();
        end;
    end;

}