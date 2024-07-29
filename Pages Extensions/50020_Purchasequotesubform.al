pageextension 50020 purchasequotesubform extends "Purchase Quote Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = all;
            }
        }
    }

}
