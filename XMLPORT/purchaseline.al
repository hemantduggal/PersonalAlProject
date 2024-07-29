/// <summary>
/// XmlPort export purchase line (ID 50113).
/// </summary>
xmlport 50113 "export purchase line"
{
    Format = VariableText;
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';//New line
    schema
    {
        textelement(root)
        {
            tableelement("line"; "Purchase Line")
            {

                fieldelement(type; line.Type) { }
                fieldelement(no; line."No.") { }
                fieldelement(desc; line.Description) { }
                fieldelement(locationcode; line."Location Code") { }
                fieldelement(qty; line.Quantity) { }
                fieldelement(uom; line."Unit of Measure Code") { }
                fieldelement(unitprice; line."Unit Cost") { }
                fieldelement(lineamt; line."Line Amount") { }
                fieldelement(qtyrorec; line."Qty. to Receive") { }
                fieldelement(qtytoinvoice; line."Qty. to Invoice") { }
                fieldelement(qtytoassign; line."Qty. to Assign") { }
                fieldelement(gstgroupcode; line."GST Group Code") { }
                fieldelement(hsncode; line."HSN/SAC Code") { }
                fieldelement(gstassesblevalue; line."GST Assessable Value") { }
                fieldelement(customdutyamt; line."Custom Duty Amount") { }
                fieldelement(gstgrouptype; line."GST Group Type") { }
                fieldelement(gstjuridction; line."GST Jurisdiction Type") { }
                fieldelement(itemchargeqtytohandle; line."Item Charge Qty. to Handle") { }
                fieldelement(plannedreceiptdate; line."Planned Receipt Date") { }
                fieldelement(expectedrecdate; line."Expected Receipt Date") { }
                fieldelement(overrecqty; line."Over-Receipt Quantity") { }
                // fieldelement(indexno; line."Index no") { }
                //fieldelement(plankno; line.Plank_no) { }
                fieldelement(currencycapacity; line."Currency Capacity") { }
                fieldelement(unitodspec; line."unit od specification") { }
                fieldelement(itemref; line."Item Reference No.") { }
                fieldelement(amount; line.Amount) { }
                fieldelement(doc; line."Document No.") { }
            }
        }
    }
}