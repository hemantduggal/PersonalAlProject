/// <summary>
/// PageExtension Posted Sales Order (ID 50001) extends Record Posted Sales Invoice.
/// </summary>
pageextension 50001 "Posted Sales Order" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field(customertype; Rec.customertype)
            {
                ApplicationArea = all;
            }
            field(customerid; Rec.customerid)
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
    actions
    {
        addafter("&Invoice")
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

