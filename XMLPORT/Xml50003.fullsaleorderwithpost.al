xmlport 50003 "full sale order with post"
{
    Caption = 'Sale Order ImpPort';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Saleorder)
        {
            MinOccurs = Zero;
            tableelement("Sales Header"; "Sales Header")
            {
                AutoSave = false;
                XmlName = 'SalePort';

                textelement(No)
                {
                    MinOccurs = Zero;
                }
                textelement(custNo)
                {
                    MinOccurs = Zero;
                }
                textelement(PostingDate)
                {
                    MinOccurs = Zero;
                }

                textelement(AccountType)
                {
                    MinOccurs = Zero;
                }
                textelement(AccountNo)
                {
                    MinOccurs = Zero;
                }
                textelement(UOM)
                {
                    MinOccurs = Zero;
                }
                textelement(location)
                {
                    MinOccurs = Zero;
                }
                textelement(LineQuantity)
                {
                    MinOccurs = Zero;
                }

                textelement(Description)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    intCounter += 1;

                    if (intCounter > 1) then begin

                        if PostingDate <> '' then
                            Evaluate(dtPostingDate, PostingDate)
                        else
                            Error('Posting Date should not be blank at Line No %1', intCounter);

                        if (No <> cdOldDocNo) or (dtPostingDate <> dtOldPostingDate) then begin
                            if No <> '' then
                                Evaluate(cdDocNo, No);
                            recsalehead.Init();
                            recsalehead."Document Type" := recsalehead."Document Type"::Order;
                            recsalehead.Validate("No.", cdDocNo);
                            recsalehead.Insert(true);
                            recsalehead.Validate("Location Code", location);
                            recsalehead.Validate("Sell-to Customer No.", custNo);
                            recsalehead.Validate("Posting Date", dtPostingDate);
                            recsalehead.Modify(true);
                            Message('%1', recsalehead."No.");
                        end;
                        recsaleline.Init();
                        recsaleline."Document Type" := recsaleline."Document Type"::Order;
                        recsaleline."Document No." := recsalehead."No.";  //cdDocNo;
                        intLineNo += 10000;
                        recsaleline."Line No." := intLineNo;
                        recsaleline.Insert(true);
                        Evaluate(enumType, AccountType);
                        recsaleline.Validate(Type, enumType);
                        recsaleline.Validate(Type, enumType);
                        recsaleline.Validate("No.", AccountNo);

                        // recsaleline.Validate("Location Code", location);
                        recsaleline.Validate("Unit of Measure", UOM);
                        Evaluate(decQty, LineQuantity);
                        recsaleline.Validate(Quantity, decQty);
                        recsaleline.Validate("Unit Cost", 9);
                        recsaleline.Validate("Line Discount %", decDiscount);
                        recsaleline.Modify(true);
                        cdOldDocNo := No;
                        dtOldPostingDate := dtPostingDate
                    end;
                end;
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        intCounter := 0;
        intLineNo := 0;
    end;

    trigger OnPostXmlPort()
    begin
        MESSAGE('Data has been successfully uploaded');
    end;

    var
        recsalehead: Record "Sales Header";
        recsaleline: Record "Sales Line";
        intCounter: Integer;
        cdDocNo: Code[20];
        cdOldDocNo: Code[20];
        dtPostingDate: Date;
        dtOldPostingDate: Date;
        Weights: Code[20];
        "Size In CM": Decimal;
        dtInvoiceDate: Date;
        decQty: Decimal;
        decIgst: Decimal;
        decTotalValue: Decimal;
        enumType: Enum "Sales Line Type";
        decutrate: Decimal;
        decDiscount: Decimal;
        EnumGstcredit: Enum "GST Credit";
        optFreight: Option "","Inclusive","To Pay","Extra","Customer Vehicle";
        intLineNo: Integer;
}
