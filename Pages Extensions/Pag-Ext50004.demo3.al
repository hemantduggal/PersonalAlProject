/// <summary>
/// PageExtension demo3 (ID 50004) extends Record Customer Ledger Entries.
/// </summary>
pageextension 50004 demo3 extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Amount")
        {
            field(customerorid; Rec.customerorid)
            {
                ApplicationArea = all;
            }
            field(customertype; Rec.customertype)
            {
                ApplicationArea = all;
            }
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }
            field("Vendor Address"; Rec."Vendor Address")
            {
                ApplicationArea = all;
            }
            field("Contact person"; Rec."Contact person")
            {
                ApplicationArea = all;

            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = all;

            }
            field(Deal_date; Rec.Deal_date)
            {
                ApplicationArea = all;
            }
            field("order category"; Rec."order category")
            {
                ApplicationArea = all;

            }
            field("Adv.Prepayment Amount"; Rec."Adv.Prepayment Amount")
            {
                ApplicationArea = all;
            }
        }
    }

}
