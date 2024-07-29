/// <summary>
/// XmlPort MyXmlport (ID 50102).
/// </summary>
xmlport 50112 exportpurchaseorder
{
    Format = VariableText;
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '<newline>';//New line
    schema
    {
        textelement(root)
        {
            tableelement("Header"; "Purchase Header")
            {
                fieldelement(no; Header."No.")
                {

                }
                fieldelement(vend_no; Header."Buy-from Vendor No.")
                { }


                fieldelement(name; Header."Buy-from Vendor Name")
                {

                }
                fieldelement(address1; Header."Buy-from Address") { }
                fieldelement(address2; header."Buy-from Address 2") { }
                fieldelement(city; header."Buy-from City") { }
                fieldelement(doctype; header."Document Type") { }
                fieldelement(paytovend; header."Pay-to Vendor No.") { }
                fieldelement(paytoname; header."Pay-to Name") { }
                fieldelement(paytocity; header."Pay-to City") { }
                fieldelement(paytocontact; header."Pay-to Contact") { }
                fieldelement(yourreference; header."Your Reference") { }
                fieldelement(shiptoname; header."Ship-to Name") { }
                fieldelement(shiptoaddress; header."Ship-to Address") { }
                fieldelement(shiptocity; header."Ship-to City") { }
                fieldelement(shiptocontact; header."Ship-to Contact") { }
                fieldelement(orderdate; header."Order Date") { }
                fieldelement(postingdate; header."Posting Date") { }

                fieldelement(postingdescription; header."Posting Description") { }
                fieldelement(paymenttermscode; header."Payment Terms Code") { }
                fieldelement(duedate; header."Due Date") { }
                fieldelement(pmtdiscountdate; header."Pmt. Discount Date") { }
                fieldelement(locationcode; header."Location Code") { }
                fieldelement(shortcutdim2; header."Shortcut Dimension 2 Code") { }
                fieldelement(vendorpostinggroup; header."vendor Posting Group") { }
                fieldelement(priceincludingvat; header."Prices Including VAT") { }
                fieldelement(invdic; header."Invoice Disc. Code") { }
                fieldelement(languagecode; header."Language Code") { }

                fieldelement(recalculateinvdisc; header."Recalculate Invoice Disc.") { }
                fieldelement(ship; Header.ship) { }
                fieldelement(invoice; header.Invoice) { }
                fieldelement(printposteddoc; header."Print Posted Documents") { }

                fieldelement(postingno; header."Posting No.") { }
                fieldelement(vatregno; header."VAT Registration No.") { }
                fieldelement(genbuspostinggroup; header."Gen. Bus. Posting Group") { }

                fieldelement(vatcountryregcode; header."VAT Country/Region Code") { }

                fieldelement(shiptopostcode; header."Ship-to Post Code") { }
                fieldelement(balacctype; header."Bal. Account Type") { }
                fieldelement(correction; header.Correction) { }
                fieldelement(doc_date; Header."Document Date")
                {

                }
                fieldelement(studentno; header.StudentNO) { }
                fieldelement(studentname; header.StudentName) { }
                fieldelement(studentaddress; header.StudentAddress) { }
                fieldelement(taxliable; header."Tax Liable") { }
                fieldelement(vatbuspostinggroup; header."VAT Bus. Posting Group") { }

                fieldelement(prepaymentduedate; header."Prepayment Due Date") { }
                fieldelement(premptpmtdic; header."Prepmt. Pmt. Discount Date") { }
                fieldelement(termscode; header."Prepmt. Payment Terms Code") { }

                fieldelement(vatreportingdate; header."VAT Reporting Date") { }
                fieldelement(studentstate; header.StudentState) { }
                fieldelement(studentcity; header.StudentCity) { }





                fieldelement(loc_code; Header."Location Code")
                {

                }


                fieldelement(status; Header.Status)
                {

                }

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
                    //fieldelement(indexno; line."Index no") { }
                    // fieldelement(plankno; line.Plank_no) { }
                    fieldelement(currencycapacity; line."Currency Capacity") { }
                    fieldelement(unitodspec; line."unit od specification") { }
                    fieldelement(itemref; line."Item Reference No.") { }
                    fieldelement(amount; line.Amount) { }
                    fieldelement(doc; line."Document No.") { }







                }
            }
        }
    }



}