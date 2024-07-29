page 50205 "postedClosing Bal List PAGE"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "PostedClosing Statementheader";
    CardPageId = "postedClosing Balnce CARD PAGE";
    editable = false;


    layout
    {
        area(Content)
        {
            repeater(general)
            {

                Caption = 'general';


                field(Accountno; Rec.Accountno)
                {
                    ApplicationArea = all;
                    caption = 'Document No';
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     gen: record ;
                    // begin
                    //     gen.Reset();
                    //     if page.RunModal(page::"General Ledger Setup", gen) = Action::LookupOK then
                    //         rec.Accountno := gen."Daily cash";
                    // end;
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



            }
        }
    }

}