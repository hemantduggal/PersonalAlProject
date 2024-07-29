xmlport 50001 importXmlportSL
{
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '<New Line>';//New line
    schema
    {
        textelement(root)
        {
            tableelement("SalesLine"; "Sales Line")
            {
                fieldattribute(Docno; "SalesLine"."Document No.")
                {
                }
                fieldattribute(lineno; "SalesLine"."Line No.")
                {

                }
                fieldattribute(itemno; SalesLine."No.")
                {

                }
                fieldattribute(desc; SalesLine.Description)
                {

                }
                fieldattribute(qty; SalesLine.Quantity)
                {

                }
                fieldattribute(UOM; SalesLine."Unit of Measure")
                {

                }


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
        Message('XML Uploaded Successfully For HN');
    end;

    var
        Heading: Boolean;
}





        
    