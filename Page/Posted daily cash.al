page 50210 "posted Daily cash PAGE"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Posted daily cash";
    //CardPageId = "";
    editable = false;


    layout
    {
        area(Content)
        {
            repeater(general)
            {

                Caption = 'general';


                field(Postingdate; Rec.Postingdate)
                {
                    ApplicationArea = all;

                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Account type"; Rec."Account type")
                {
                    ApplicationArea = all;
                }
                field(accno; Rec.accno)
                {
                    ApplicationArea = all;
                }
                field("Balance acc Type"; Rec."Balance acc Type")
                {
                    ApplicationArea = all;
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    ApplicationArea = all;
                }



            }
        }
    }

}