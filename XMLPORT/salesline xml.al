/// <summary>
/// XmlPort Sales Price Xml port (ID 50102).
/// </summary>
xmlport 50103 "Sales Price Xml port"
{
    Caption = 'import line data';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    // FileName = 'testxmlport.csv';
    TableSeparator = '<NewLine>';
    Permissions = TableData "Sales Line" = rimd;
    FieldDelimiter = '';
    FieldSeparator = ',';



    schema
    {
        textelement(Root)
        {

            tableelement(Line; "Sales Line")
            {
                AutoSave = true;
                SourceTableView = Where(Type = Const(item));

                XmlName = 'Import';
                AutoReplace = false;
                AutoUpdate = true;

                fieldelement(documenttype; line."Document Type") { }
                fieldelement(document_no; Line."Document No.") { }
                fieldelement(Item_no; Line.Item_no) { }
                fieldelement(sales_type; line.sales_type) { }
                fieldelement(sales_code; line.sales_code) { }
                fieldelement(location_code; line.location) { }
                fieldelement(uom; line."Unit of Measure Code") { }
                fieldelement(unit_price; line."Unit Cost") { }

                trigger OnAfterGetRecord()
                var
                begin
                    Line.Insert();
                    Line.Modify();

                end;

            }
        }
    }



    trigger OnPostXmlPort()
    begin
        Message('Sales Line Uploaded Successfully');
    end;

    var
        Heading: Boolean;
}