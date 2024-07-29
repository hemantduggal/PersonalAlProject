page 50201 "Closing Balance List PAGE"
{
    PageType = List;
    Caption = 'Posted Closing Statements';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Closing Bal Statementheader";
    CardPageId = "Closing Balnce CARD PAGE";
    Editable = false;
    SourceTableView = where(Posted = filter(true));


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
                field(Postingdate; Rec.Postingdate)
                {
                    ApplicationArea = all;
                }


            }
        }
    }

}