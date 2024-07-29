
/// <summary>
/// PageExtension Value Entry (ID 50026) extends Record Value Entries.
/// </summary>
pageextension 50026 "Value Entry" extends "Value Entries"
{


    layout
    {
        addafter("Entry No.")
        {
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
            field(itemcategorycode; Rec.item_category_code)
            {
                ApplicationArea = all;
            }
            field(heatno; Rec.HEat_no)
            {
                ApplicationArea = all;
            }
            field(Billet_no; Rec.Billet_no)
            {
                ApplicationArea = all;
            }
            field(Size; Rec.Size)
            {
                ApplicationArea = all;

            }
            field(Dia; Rec.Dia)
            {
                ApplicationArea = all;
            }
        }
    }

}