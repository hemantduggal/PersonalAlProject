
page 50124 "Requisition SubForm"
{
    PageType = ListPart;
    //ApplicationArea = All;
    Caption = ' Requisition SubForm Page';
    SourceTable = Purchreqline;
    DelayedInsert = true;
    AutoSplitKey = true;
    Editable = true;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
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
                    Editable = false;
                }

                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;
                    ShowMandatory = true;

                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                }


                field(" Direct Unit cost"; Rec." Direct Unit cost")
                {
                    ApplicationArea = all;

                }
                field("Global Dim 1"; Rec."Global Dim 1")
                {
                    ApplicationArea = all;

                }
                field("Global Dim 2"; Rec."Global Dim 2")
                {
                    ApplicationArea = all;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                }


            }
        }
    }

}