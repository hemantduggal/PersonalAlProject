pageextension 50007 "sales shipment" extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Bill-to Name")
        {
            field(customerid; Rec.customerid)
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

        }
    }
}
