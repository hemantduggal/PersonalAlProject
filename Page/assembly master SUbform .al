/// <summary>
/// Page ASSEMBLY MASTER subform page (ID 50005).
/// </summary>
page 50006 "ASSEMBLY MASTER subform page"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "ASSEMBLY MASTER Line";
    DelayedInsert = true;
    //AutoSplitKey = true;
    Editable = true;




    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';

                field("Assembly No"; Rec."Assembly No")
                { ApplicationArea = all; }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(amount; Rec.amount)
                {
                    ApplicationArea = all;

                }
                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;

                }
            }
        }
    }
}