/// <summary>
/// PageExtension ItemExt (ID 50100) extends Record Item List.
/// </summary>
pageextension 50106 "Item Extendslist" extends "Item List"
{
    actions
    {
        addafter(History)
        {
            action(ImportItemsviaXMLport)
            {
                Caption = 'Import Items via XMLport';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::"Import Items XmlPort", false, true);
                end;
            }
            action(ImportItemsviaCSVBuffer)
            {
                Caption = 'Import Items via CSV Buffer';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text[100];
                    UploadMsg: Label 'Please choose the CSV file';
                    Item: Record Item;
                    LineNo: Integer;
                begin
                    CSVBuffer.Reset();
                    CSVBuffer.DeleteAll();
                    if UploadIntoStream(UploadMsg, '', '', FileName, InS) then begin
                        CSVBuffer.LoadDataFromStream(InS, ',');
                        for LineNo := 2 to CSVBuffer.GetNumberOfLines() do begin
                            Item.Init();
                            Item.Validate("No.", GetValueAtCell(LineNo, 1));
                            Item.Insert(true);
                            Item.Validate(Description, GetValueAtCell(LineNo, 2));
                            case GetValueAtCell(LineNo, 3) of
                                'Inventory':
                                    Item.Validate(Type, Item.Type::"Inventory");
                                'Service':
                                    Item.Validate(Type, Item.Type::"Service");
                                'Non-Inventory':
                                    Item.Validate(Type, Item.Type::"Non-Inventory");
                            end;
                            Item.Validate("Base Unit of Measure", GetValueAtCell(LineNo, 5));
                            Evaluate(Item."Unit Cost", GetValueAtCell(LineNo, 7));
                            Evaluate(Item."Unit Price", GetValueAtCell(LineNo, 8));
                            Item.Validate("Vendor No.", GetValueAtCell(LineNo, 9));
                            Item.Modify(true);
                        end;
                    end;
                end;
            }
        }
    }

    var
        CSVBuffer: Record "CSV Buffer" temporary;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        if CSVBuffer.Get(RowNo, ColNo) then
            exit(CSVBuffer.Value)
        else
            exit('');
    end;
}
