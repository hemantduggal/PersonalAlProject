/// <summary>
/// XmlPort ItemJournalXmlport (ID 50106).
/// </summary>
xmlport 50106 ItemJournalXmlport
{
    Caption = 'Import item journal Line';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    // FileName = '';
    TableSeparator = '<NewLine>';
    Permissions = TableData "Sales Line" = rimd;

    FieldDelimiter = '';
    FieldSeparator = ',';



    schema
    {
        textelement(root)
        {
            tableelement("ItemJournalLine"; "Item Journal Line")
            {
                AutoSave = true;


                XmlName = 'Import';

                AutoReplace = false;

                AutoUpdate = true;
                fieldelement(templatename; ItemJournalLine."Journal Template Name") { }
                fieldelement(templbatchname; ItemJournalLine."Journal Batch Name") { }

                fieldelement(lineno; ItemJournalLine."Line No.")
                {

                }

                fieldelement(entrytype; ItemJournalLine."Entry Type") { }
                fieldelement(documentno; ItemJournalLine."Document No.") { }
                fieldelement(postingdate; ItemJournalLine."Posting Date") { }
                fieldelement(itemno; ItemJournalLine."Item No.") { }
                fieldelement(quantity; ItemJournalLine.Quantity) { }
                fieldelement(locationcode; ItemJournalLine."Location Code") { }
                fieldelement(heatno; ItemJournalLine.HEat_no) { }
                // fieldelement(shortcutdim1; ItemJournalLine."Shortcut Dimension 1 Code") { }
                // fieldelement(shortcutdim2; ItemJournalLine."Shortcut Dimension 2 Code") { }
                fieldelement(podorder; ItemJournalLine."Prod. Order Comp. Line No.") { }

                trigger OnAfterGetRecord()
                var
                begin
                    ItemJournalLine.Insert();
                    ItemJournalLine.Modify();

                end;




            }
        }
    }




    trigger OnPostXmlPort()
    begin
        Message('item journal Line Uploaded Successfully');



    end;

    var
        IsFirstline: Boolean;

    /// <summary>
    /// setjournaltemplatebatch.
    /// </summary>
    /// <param name="template">code[20].</param>
    /// <param name="batch">Code[20].</param>
    local procedure setjournaltemplatebatch(template: code[20]; batch: Code[20])
    var
        journaltemplate: Code[20];
        journalbatch: code[20];
    begin
        journaltemplate := template;
        journalbatch := batch;
    end;
}




