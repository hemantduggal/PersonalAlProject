/// <summary>
/// PageExtension demo3 (ID 50004) extends Record Customer Ledger Entries.
/// </summary>
pageextension 50013 "cus." extends "Detailed Cust. Ledg. Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field(customerorid; Rec.customerorid)
            {
                ApplicationArea = all;
            }
            field(customertype; Rec.customertype)
            {
                ApplicationArea = all;
            }
            field("Vendor No."; rec."Vendor No.")
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
        }
    }

}
