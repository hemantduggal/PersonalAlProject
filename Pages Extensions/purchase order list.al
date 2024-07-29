/// <summary>
/// PageExtension purchaseorderlist (ID 50109) extends Record Purchase Order List.
/// </summary>
pageextension 50109 purchaseorderlist extends "Purchase Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("F&unctions")
        {
            action(Import)
            {
                Caption = 'Import Purchase order';
                Image = Import;
                ApplicationArea = all;

                trigger OnAction()
                var
                    PH: Record "Purchase Header";
                begin
                    ph.Reset();
                    ph.SetRange("No.", Rec."No.");
                    if PH.FindLast() then
                        xmlport.Run(Xmlport::PurchaseorderXmlport);
                    CurrPage.Update();
                end;
            }
            action("Export purchase order")
            {
                caption = 'export purchase order order';
                Image = Export;
                ApplicationArea = all;



                trigger OnAction()

                begin

                    xmlport.Run(Xmlport::Exportpurchaseorderlist, true, false);
                end;
            }
        } // Add changes to page actions here
    }

    var
        myInt: Integer;
}