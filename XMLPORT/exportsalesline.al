/// <summary>
/// XmlPort 50104.
/// </summary>
xmlport 50104 "export Sales line"
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

            tableelement("line"; "Sales line")
            {
                RequestFilterFields = "Document No.";

                fieldelement(type; line.Type) { }
                fieldelement(no; line."No.") { }
                fieldelement(item_no; line.Item_no) { }
                fieldelement(sales_type; line.sales_type) { }
                fieldelement(sales_code; line.sales_code) { }
                fieldelement(location; line.location) { }
                fieldelement(start_date; line.start_date) { }
                fieldelement(ending_date; line.end_date) { }
                fieldelement(unit_pice; line."Unit Cost") { }
                fieldelement(studentno; line.StudentNO) { }
                fieldelement(externaldocno; line."External Doc no") { }
                fieldelement(studentsub; line.StudentSubject) { }
                fieldelement(marks; line.Marks) { }
                fieldelement(dob; line."Date of birth") { }
                fieldelement(age; line.Age) { }
                fieldelement(itemcategory; line."Item Category Code") { }
                fieldelement(heatno; line.heat_no) { }
                fieldelement(billetno; line.billet_no) { }
                fieldelement(size; line.Size) { }
                fieldelement(dia; line.Dia) { }
                fieldelement(itemref; line."Item Reference No.") { }
                fieldelement(desc; line.Description) { }
                fieldelement(locationcode; line."Location Code") { }
                fieldelement(qty; line.Quantity) { }
                fieldelement(uom; line."Unit of Measure Code") { }
                fieldelement(unitprice; line."Unit Price") { }
                fieldelement(lineamt; line."Line Amount") { }
                fieldelement(gstaccesiblevalue; line."GST Assessable Value (FCY)") { }
                fieldelement(unitpriceincoftax; line."Unit Price Incl. of Tax") { }
                fieldelement(gstplaceofsupply; line."GST Place Of Supply") { }
                fieldelement(qtytoship; line."Qty. to Ship") { }
                fieldelement(qtyshipped; line."Quantity Shipped") { }
                fieldelement(qtytoinvoice; line."Qty. to Invoice") { }
                fieldelement(qtytoassign; line."Qty. to Assign") { }
                fieldelement(planneddeldte; line."Planned Delivery Date") { }
                fieldelement(planshipmentdate; line."Planned Shipment Date") { }
                fieldelement(shipmentdate; line."Shipment Date") { }
                fieldelement(customergroupcode; line."Customer Disc. Group") { }
                fieldelement(amount; line.Amount) { }
                fieldelement(doc; line."Document No.") { }


            }
        }
    }




    var
        myInt: Integer;
}