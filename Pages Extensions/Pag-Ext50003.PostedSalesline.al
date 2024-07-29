/// <summary>
/// PageExtension Posted Sales line  (ID 50003) extends Record Posted Sales Invoice Subform.
/// </summary>
pageextension 50003 "Posted Sales line " extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("ItemUnitMeasure code"; Rec."ItemUnitMeasure code")
            {
                ApplicationArea = all;
            }
            field("External Doc no"; Rec."External Doc no")
            {
                ApplicationArea = all;
                caption = 'External doc no';
            }
            field(item_category_code; Rec.item_category_code)
            {
                ApplicationArea = all;

            }
            field(HEat_no; Rec.HEat_no)
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

    actions
    {
        addafter("&Line")
        {
            action(ImportSalesLine)
            {
                Caption = 'import sales line through xml port';
                // Promoted = true;
                // PromotedCategory = Process;
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::"Sales Price Xml port", false, true);
                end;

            }
            action("Export sales line")
            {
                caption = 'export sales line';
                Image = Export;
                ApplicationArea = all;



                trigger OnAction()
                begin

                    xmlport.Run(Xmlport::"export Sales line", true, false);
                end;
            }
        }
    }
}
