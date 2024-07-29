pageextension 50010 "posted purch receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Document Date")
        {
            field(Vendortype; Rec.Vendortype)
            {
                ApplicationArea = all;
            }
            field(Vendorid; Rec.Vendorid)
            {
                ApplicationArea = all;
            }

        }
    }
}
