/// <summary>
/// PageExtension purch. lines (ID 50023) extends Record Purchase Order Subform.
/// </summary>
pageextension 50023 "purch. lines" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(Weight; Rec.Weight)
            {
                ApplicationArea = all;
            }
            field("Size (in cm)"; Rec."Size (in cm)")
            {
                ApplicationArea = all;
            }
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = all;
            }

        }
        addafter("Over-Receipt Code")
        {
            // field("Index no"; Rec."Index no")
            // {
            //     ApplicationArea = all;

            // }
            // field(Plank_no; Rec.Plank_no)
            // {

            //     ApplicationArea = all;

            // }
            field("Currency Capacity"; Rec."Currency Capacity")
            {
                ApplicationArea = all;

            }
            field("unit od specification"; Rec."unit od specification")
            {
                ApplicationArea = all;

            } //
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            action("Export purchase line")
            {
                caption = 'export purchase line';
                Image = Export;
                ApplicationArea = all;



                trigger OnAction()
                begin

                    xmlport.Run(Xmlport::"export purchase line", true, false);
                end;
            }
        }
    }


}