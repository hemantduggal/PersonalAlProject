/// <summary>
/// XmlPort Sales Price Xml port (ID 50102).
/// </summary>
xmlport 50108 "Sales Pricee Xml port"
{
    Caption = 'import line data';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    // FileName = 'testxmlport.csv';
    TableSeparator = '<NewLine>';




    FieldDelimiter = '';
    FieldSeparator = ',';



    schema
    {
        textelement(Root)
        {

            tableelement(Line; "Sales Line")
            {
                XmlName = 'Import';

                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;





                fieldelement(documenttype; line."Document Type") { }
                fieldelement(document_no; Line."Document No.") { }
                //fieldelement(selltocust; Line."Sell-to Customer No.") { }
                fieldelement(type; line.Type) { }
                fieldelement(Item_no; Line."No.") { }
                fieldelement(desc; line.Description) { }
                fieldelement(loc_code; line."Location Code") { }
                fieldelement(reserve; line.Reserve) { }
                fieldelement(qty; line.Quantity) { }
                fieldelement(base; line."Reserved Qty. (Base)") { }
                fieldelement(uom; line."Unit of Measure Code") { }
                fieldelement(linemat; line."Line Amount") { }
                fieldelement(shipdate; line."Shipment Date") { }
                fieldelement(oustqty; line."Outstanding Quantity") { }

                trigger OnBeforeInsertRecord()
                begin
                    IF Heading then begin  ////skip heading of csv
                        Heading := false;
                        currxmlport.skip;
                    end;



                end;








            }
        }
    }

    trigger OnPreXmlPort()
    begin
        Heading := true;



    end;



    trigger OnPostXmlPort()
    begin
        Message('Sales Line Uploaded Successfully');



    end;




    var
        Heading: Boolean;
        LineNo: Integer;


        doc: Code[20];
        items_no: code[20];
        saless_typee: text[100];
        sales_codee: code[20];
        locationss: text[50];
        uoom: text[20];
        unitP: Integer;
        s_date: Date;
        e_date: date;
        Docno: Code[20];
        Docno1: Code[20];

        RecsalesLine: Record "Sales Line";
        recsalesheader: Record "Sales Header";

}