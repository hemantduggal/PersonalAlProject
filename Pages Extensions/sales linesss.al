/// <summary>
/// PageExtension salesLienessxt (ID 50129) extends Record Sales Lines.
/// </summary>
pageextension 50132 salesLienessxt extends "Sales Lines"
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


    actions
    {
        addafter("Item &Tracking Lines")
        {

            action(Importlines)
            {
                Caption = 'import sales order';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //Xmlport.Run(50101, false, true);
                    Xmlport.Run(Xmlport::"Sales Pricee Xml port", false, true);
                end;
            }
        }
    }
}