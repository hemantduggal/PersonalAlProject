
page 50118 "Posted Requisition SubForm"
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption = 'Posted Requisition SubForm  page';
    SourceTable = PostedPurchreqline;
    DelayedInsert = true;
    AutoSplitKey = true;

    UsageCategory = Documents;
    editable = false;
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Document No"; Rec."Document No")
                { ApplicationArea = all; }


                field("line No"; Rec."line No")
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

                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;

                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                }

                field(amount; Rec.amount)
                {
                    ApplicationArea = all;

                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;

                }

            }
        }
    }

}