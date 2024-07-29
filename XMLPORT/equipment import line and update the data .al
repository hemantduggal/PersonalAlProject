/// <summary>
/// XmlPort Equipment ImportLineData (ID 50002).
/// </summary>
xmlport 50002 "Equipment ImportLineData"
{
    Caption = 'import  data';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    Permissions = tabledata "Equipment Line" = rimd;
    // FileName = '';

    TableSeparator = '<NewLine>';
    FieldDelimiter = '';
    FieldSeparator = ',';

    schema
    {
        textelement(root)
        {
            tableelement(line; "Equipment Line")
            {
                AutoSave = true;


                XmlName = 'Import';

                AutoReplace = true;

                AutoUpdate = true;

                fieldelement(equipmentno; line.equipmentno) { }
                fieldelement(no; line."No.") { }
                fieldelement(amount; line.amount) { }
                fieldelement(quantity; line.quantity) { }

                trigger OnBeforeInsertRecord()
                var
                begin
                    if Docno <> line."No." then begin
                        RecHeader.Init();

                        Docno := line."No.";
                    end;
                end;



                trigger OnAfterGetRecord()
                var
                begin

                    line.Modify();

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
        Message('Uploaded Successfully');
    end;

    var
        Heading: Boolean;



        RecHeader: Record "Equipment Line";
        Docno: Code[20];

}
