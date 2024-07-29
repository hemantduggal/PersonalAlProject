/// <summary>
/// XmlPort Exportsalesorderlist (ID 50108).
/// </summary>
xmlport 50109 Exportsalesorderlist
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
            tableelement("Header"; "Sales Header")
            {
                fieldattribute(no; Header."No.")
                {

                }
                fieldattribute(cust_no; Header."Sell-to Customer No.")
                {

                }
                fieldattribute(name; Header."Sell-to Customer Name")
                {

                }
                fieldattribute(ext; Header."External Document No.")
                {

                }
                fieldattribute(loc_code; Header."Location Code")
                {

                }

                fieldattribute(doc_date; Header."Document Date")
                {

                }
                fieldattribute(status; Header.Status)
                {

                }
                fieldattribute(ship; Header."Combine Shipments")
                {

                }
                fieldattribute(am_ship; Header."Amt. Ship. Not Inv. (LCY)")
                {

                }
                fieldattribute(am2_ship; Header."Amt. Ship. Not Inv. (LCY) Base")
                {

                }
                fieldattribute(amount; header.Amount) { }
                fieldattribute(amountincvat; header."Amount Including VAT") { }

            }
        }
    }


}