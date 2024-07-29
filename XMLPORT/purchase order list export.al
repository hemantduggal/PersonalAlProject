/// <summary>
/// XmlPort Exportsalesorderlist (ID 50108).
/// </summary>
xmlport 50110 Exportpurchaseorderlist
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
            tableelement("Header"; "Purchase Header")
            {
                fieldattribute(no; Header."No.")
                {

                }
                fieldattribute(vendno; Header."Buy-from Vendor No.")
                {

                }
                fieldattribute(name; Header."Buy-from Vendor Name")
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

                fieldattribute(amount; header.Amount) { }
                fieldattribute(amountincvat; header."Amount Including VAT") { }

            }
        }
    }


}