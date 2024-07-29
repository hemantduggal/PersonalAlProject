pageextension 50008 "sale shipment line" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter(Description)
        {
            field("ItemUnitMeasure code"; Rec."ItemUnitMeasure code")
            {
                ApplicationArea = all;
            }
        }
    }
}
