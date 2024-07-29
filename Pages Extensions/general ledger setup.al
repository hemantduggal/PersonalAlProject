pageextension 50000 generelledset extends "General Ledger Setup"
{
    layout
    {
        addafter("Bank Account Nos.")
        {
            field("Daily cash"; Rec."Daily cash")
            {
                ApplicationArea = all;
            }
            field("Requisition Header"; Rec."Requisition Header")
            {
                ApplicationArea = all;
            }
            field("Posted requisition Header"; Rec."Posted requisition Header")
            {
                ApplicationArea = all;
            }

        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}