/// <summary>
/// Page Posted ASSEMBLY MASTER subform (ID 50008).
/// </summary>
page 50008 "Posted ASSEMBLY MASTER subform"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Posted ASSEMBLY MASTER Line";



    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';


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