xmlport 50101 importXmlportvia
{
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    //FileName = '.csv';
    TableSeparator = '<New Line>';//New line
    schema
    {
        textelement(root)
        {
            tableelement("Header"; "Sales Header")
            {
                //fieldelement(no; Header."No.") { }
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
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(no; Header."No.")
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}
