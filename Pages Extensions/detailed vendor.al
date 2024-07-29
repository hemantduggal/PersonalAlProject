/// <summary>
/// PageExtension detailedvendor (ID 50021) extends Record Detailed Vendor Ledg. Entries.
/// </summary>
pageextension 50021 detailedvendor extends "Detailed Vendor Ledg. Entries"

{
    layout
    {
        addafter("Entry No.")
        {
            field(Vendortype; Rec.Vendortype)
            {
                ApplicationArea = all;
            }
            field(Vendorid; Rec.Vendorid)
            {
                ApplicationArea = all;
            }
            // Add changes to page layout here
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

        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

