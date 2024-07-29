/// <summary>
/// XmlPort MyXmlport (ID 50102).
/// </summary>
xmlport 50132 exportXmlport
{
    Format = VariableText;
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '<Newline>';//New line
    schema
    {
        textelement(root)
        {
            tableelement("Header"; "Sales Header")
            {
                fieldelement(no; Header."No.") { }
                fieldelement(cust_no; Header."Sell-to Customer No.") { }
                fieldelement(name; Header."Sell-to Customer Name") { }
                fieldelement(address1; Header."Bill-to Address") { }
                fieldelement(address2; header."Bill-to Address 2") { }
                fieldelement(doctype; header."Document Type") { }
                fieldelement(billtocust; header."Bill-to Customer No.") { }
                fieldelement(billtoname; header."Bill-to Name") { }
                fieldelement(billtocity; header."Bill-to City") { }
                fieldelement(billtocontact; header."Bill-to Contact") { }
                fieldelement(yourreference; header."Your Reference") { }
                fieldelement(shiptoname; header."Ship-to Name") { }
                fieldelement(shiptoaddress; header."Ship-to Address") { }
                fieldelement(shiptocity; header."Ship-to City") { }
                fieldelement(shiptocontact; header."Ship-to Contact") { }
                fieldelement(orderdate; header."Order Date") { }
                fieldelement(postingdate; header."Posting Date") { }
                fieldelement(shipmentdate; header."Shipment Date") { }
                fieldelement(postingdescription; header."Posting Description") { }
                fieldelement(paymenttermscode; header."Payment Terms Code") { }
                fieldelement(duedate; header."Due Date") { }
                fieldelement(pmtdiscountdate; header."Pmt. Discount Date") { }
                fieldelement(locationcode; header."Location Code") { }
                fieldelement(shortcutdim2; header."Shortcut Dimension 2 Code") { }
                fieldelement(customerpostinggroup; header."Customer Posting Group") { }
                fieldelement(priceincludingvat; header."Prices Including VAT") { }
                fieldelement(invdic; header."Invoice Disc. Code") { }
                fieldelement(languagecode; header."Language Code") { }
                fieldelement(salesperson; header."Salesperson Code") { }
                fieldelement(recalculateinvdisc; header."Recalculate Invoice Disc.") { }
                fieldelement(ship; Header.ship) { }
                fieldelement(invoice; header.Invoice) { }
                fieldelement(printposteddoc; header."Print Posted Documents") { }
                fieldelement(shippingno; header."Shipping No.") { }
                fieldelement(postingno; header."Posting No.") { }
                fieldelement(vatregno; header."VAT Registration No.") { }
                fieldelement(genbuspostinggroup; header."Gen. Bus. Posting Group") { }
                fieldelement(eu3parttrade; header."EU 3-Party Trade") { }
                fieldelement(vatcountryregcode; header."VAT Country/Region Code") { }
                fieldelement(selltoadd1; header."Sell-to Address") { }
                fieldelement(billtopostalcode; header."Bill-to Post Code") { }
                fieldelement(selltopostcode; header."Sell-to Post Code") { }
                fieldelement(shiptopostcode; header."Ship-to Post Code") { }
                fieldelement(balacctype; header."Bal. Account Type") { }
                fieldelement(correction; header.Correction) { }
                fieldelement(doc_date; Header."Document Date") { }
                fieldelement(studentno; header.StudentNO) { }
                fieldelement(studentname; header.StudentName) { }
                fieldelement(studentaddress; header.StudentAddress) { }
                fieldelement(taxliable; header."Tax Liable") { }
                fieldelement(vatbuspostinggroup; header."VAT Bus. Posting Group") { }
                fieldelement(reserve; header.Reserve) { }
                fieldelement(prepaymentduedate; header."Prepayment Due Date") { }
                fieldelement(premptpmtdic; header."Prepmt. Pmt. Discount Date") { }
                fieldelement(termscode; header."Prepmt. Payment Terms Code") { }
                fieldelement(selltophone; Header."Sell-to Phone No.") { }
                fieldelement(selltoemail; header."Sell-to E-Mail") { }
                fieldelement(vatreportingdate; header."VAT Reporting Date") { }
                fieldelement(studentstate; header.StudentState) { }
                fieldelement(studentcity; header.StudentCity) { }
                fieldelement(ext; Header."External Document No.") { }
                fieldelement(loc_code; Header."Location Code") { }
                fieldelement(status; Header.Status) { }
                fieldelement(ship; Header."Combine Shipments") { }
                fieldelement(am_ship; Header."Amt. Ship. Not Inv. (LCY)") { }
                fieldelement(am2_ship; Header."Amt. Ship. Not Inv. (LCY) Base") { }




                tableelement("line"; "Sales line")
                {
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
    }
}