/// <summary>
/// PageExtension vendor (ID 50002) extends Record Vendor Ledger Entries.
/// </summary>
pageextension 50005 vendor extends "Vendor Ledger Entries"
{
    layout
    {
        addafter(Amount) // Add changes to page layout here
        {
            field(Vendortype; Rec.Vendortype)
            {
                ApplicationArea = all;
            }
            field(Vendorid; Rec.Vendorid)
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
            field("Index no"; Rec."Index no")
            {
                ApplicationArea = all;

            }
            field(Plank_no; Rec.Plank_no)
            {
                ApplicationArea = all;

            }
            field("Currency Capacity"; Rec."Currency Capacity")
            {
                ApplicationArea = all;

            }
            field("unit od specification"; Rec."unit od specification")
            {
                ApplicationArea = all;

            }
            field("EFT/Document No"; Rec."EFT/Document No")
            {
                ApplicationArea = all;
            }


        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}