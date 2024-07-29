/// <summary>
/// PageExtension items (ID 50101) extends Record Item Card.
/// </summary>
pageextension 50101 items extends "Item Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("brand"; rec.brand)
            {
                Caption = 'brand name';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(itemcategorycode; Rec.itemcategorycode)
            {
                ApplicationArea = all;
            }
            field(heatno; Rec.heatno)
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
            field("ItemUnitMeasure code"; Rec."ItemUnitMeasure code")
            {
                ApplicationArea = all;
            }
        }
    }


}
