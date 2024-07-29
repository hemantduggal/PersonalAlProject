pageextension 50139 postedpurchrec extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(Weight; Rec.Weight)
            {
                ApplicationArea = all;
            }
            field("Size (in cm)"; Rec."Size (in cm)")
            {
                ApplicationArea = all;
            }
            // field(Undo; Rec.Undo)
            // {
            //     ApplicationArea = all;

            // }

        }
    }

    actions
    {
        modify("&Undo Receipt")
        {
            trigger OnAfterAction()
            var
                myInt: Integer;
                PR: record "Purch. Rcpt. Line";
            begin
                pr.SetRange("No.");
                pr.FindSet();
                // pr.undo := true;



            end;

        }
    }

    var
        myInt: Integer;
        undo1: Boolean;
}