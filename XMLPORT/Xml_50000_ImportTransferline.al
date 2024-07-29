/// <summary>
/// XmlPort Import Transfer Line (ID 50111).
/// </summary>
xmlport 50111 "Import Transfer Line"
{
    Caption = 'Import Transfer Line';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';//New line

    schema
    {
        textelement(NodeName1)
        {
            tableelement(TransferLine; "Transfer Line")
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;

                fieldelement(DocumentNo; TransferLine."Document No.")
                {

                }
                fieldelement(LineNo; TransferLine."Line No.")
                {

                }
                fieldelement(ItemNo; TransferLine."Item No.")
                {

                }

                fieldelement(Quantity; TransferLine.Quantity)
                {

                }

                fieldelement(UOM; TransferLine."Unit of Measure Code")
                {

                }
                fieldelement(QtyToShip; TransferLine."Qty. to Ship")
                {

                }
                fieldelement(QtyToReceive; TransferLine."Qty. to Receive")
                {

                }
                fieldelement(ShipmentDate; TransferLine."Shipment Date")
                {

                }
                fieldelement(ReceiptDate; TransferLine."Receipt Date")
                {

                }
                trigger OnBeforeInsertRecord()
                begin
                    IF Heading then begin  ////skip heading of csv
                        Heading := false;
                        currxmlport.skip;
                    end;

                    if Docno1 <> DocNo then begin
                        RecTransferLine.Init();
                        LineNo := GetNextLineNo();
                        RecTransferLine.Init();
                        RecTransferLine.Validate("Document No.", rectransferheader."No.");
                        RecTransferLine.Validate("Line No.", LineNo);
                        RecTransferLine.Validate("Item No.", ItemNo1);
                        RecTransferLine.Validate(Quantity, Quantity1);
                        RecTransferLine.Validate("Unit of Measure Code", UOM1);
                        RecTransferLine.Validate("Qty. to Ship", QtyShip1);
                        RecTransferLine.Validate("Qty. to Receive", qtyReceive1);
                        RecTransferLine.Validate("Shipment Date", ShipmentDate1);
                        RecTransferLine.Validate("Receipt Date", ReceiptDate1);
                        RecTransferLine.Insert();
                        Docno := DocNo;
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
        Message('Transfer Line Uploaded Successfully');
    end;

    local procedure GetNextLineNo(): Integer;
    var
        NextTransferLine: Record "Transfer Line";
    begin
        NextTransferLine.Reset();
        NextTransferLine.SetRange("Document No.", rectransferheader."No.");
        if NextTransferLine.FindLast() then
            exit(NextTransferLine."Line No." + 10000)
        else
            exit(10000);
    end;

    var
        Heading: Boolean;
        LineNo: Integer;
        LineNo1: Integer;
        Docno: Code[20];
        Docno1: Code[20];
        ItemNo1: Code[20];
        Description1: text[100];
        Quantity1: Decimal;
        UOM1: code[20];
        QtyShip1: Decimal;
        qtyReceive1: Decimal;
        ShipmentDate1: date;
        ReceiptDate1: date;
        RecTransferLine: Record "Transfer Line";
        rectransferheader: Record "Transfer Header";
}