/// <summary>
/// PageExtension purch. line (ID 50022) extends Record Purch. Invoice Subform.
/// </summary>
pageextension 50022 "purch. line" extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("Qty. Assigned")
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