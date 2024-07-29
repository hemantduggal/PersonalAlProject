/// <summary>
/// XmlPort SO ImportData (ID 50104).
/// </summary>
xmlport 50105 "SO ImportData"
{
    Caption = 'SOImport Data';
    Format = VariableText;
    Direction = Import;
    //TextEncoding = WINDOWS;
    textencoding = UTF8;

    schema
    {
        textelement(Root)
        {

            tableelement(Test; Integer)
            {

                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'Integer';
                SourceTableView = SORTING(Number) WHERE(Number = CONST(1));
                // textattribute(docType)
                // {
                // }
                textattribute(DocumentNo)
                {

                }
                textattribute(CustomerNo)
                {

                }
                textattribute(DocumentDate)
                {

                }
                textattribute(OrderDate)
                {

                }
                textattribute(PaymentTermsCode)
                {

                }
                textattribute(ExternalDocumentNo)
                {

                }
                textattribute(SalesPersonCode)
                {

                }
                textattribute(ItemNo)
                {

                }
                textattribute(LocationCode)
                {

                }
                textattribute(ItemQty)
                {

                }
                textattribute(ItemUnitPrice)
                {

                }


                textattribute(DepartmentCode)
                {

                }
                textattribute(BranchCode)
                {

                }

                trigger OnBeforeInsertRecord()
                begin
                    IF Heading then begin  ////skip heading of csv
                        Heading := false;
                        currxmlport.skip;
                    end;

                    Evaluate(DocumentDate1, DocumentDate);
                    Evaluate(OrderDate1, OrderDate);
                    //Evaluate(OrderType1, docType);



                    if Docno <> DocumentNo then begin
                        RecHeader.Init();
                        RecHeader."Document Type" := RecHeader."Document Type"::Order;
                        RecHeader.Validate("No.", DocumentNo);
                        // RecHeader.Validate(docType, OrderType1);
                        RecHeader.Validate("Sell-to Customer No.", CustomerNo);
                        RecHeader.Validate("Document Date", DocumentDate1);
                        RecHeader.Validate("Order Date", OrderDate1);
                        RecHeader.Validate("Payment Terms Code", PaymentTermsCode);
                        RecHeader.Validate("External Document No.", ExternalDocumentNo);
                        RecHeader.Validate("Salesperson Code", SalesPersonCode);
                        RecHeader.Validate("Location code", LocationCode);

                        RecHeader."Shortcut Dimension 1 Code" := DepartmentCode;
                        RecHeader."Shortcut Dimension 2 Code" := BranchCode;
                        RecHeader.Insert();
                        Docno := DocumentNo;
                    end;

                    Evaluate(ItemQty1, ItemQty);
                    Evaluate(ItemUnitPrice1, ItemUnitPrice);

                    LineNo := GetNextLineNo();
                    RecSLine.Init();
                    RecSLine."Document Type" := RecSLine."Document Type"::Order;
                    RecSLine.Validate("Document No.", RecHeader."No.");
                    RecSLine.Validate("Line No.", LineNo);
                    RecSLine.Validate(Type, RecSLine.Type::Item);
                    RecSLine.Validate("No.", ItemNo);
                    RecSLine.Validate(RecSLine."Location code", LocationCode);
                    RecSLine.Validate(Quantity, ItemQty1);
                    RecSLine.Validate("Unit Price", ItemUnitPrice1);



                    RecSLine."Shortcut Dimension 1 Code" := DepartmentCode;
                    RecSLine."Shortcut Dimension 2 Code" := BranchCode;
                    RecSLine.Insert();

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
        Message('Sales Order Created Successfully');
    end;

    local procedure GetNextLineNo(): Integer;
    var
        NextSalesLine: Record "Sales Line";
    begin
        NextSalesLine.Reset();
        NextSalesLine.SetRange("Document No.", RecHeader."No.");
        if NextSalesLine.FindLast() then
            exit(NextSalesLine."Line No." + 10000)
        else
            exit(10000);
    end;

    var
        NoOfLoops: Integer;
        RecHeader: Record "Sales Header";
        RecHeader1: Record "Sales Header";
        RecSLine: Record "Sales Line";
        RecSLine1: Record "Sales Line";
        LineNo: Integer;
        IQty: Decimal;
        ItemQty1: Decimal;
        ItemUnitPrice1: Decimal;
        DocumentDate1: Date;
        OrderDate1: Date;
        OrderType1: Option Export,Domestic;
        Docno: Code[20];
        heading: Boolean;
        FulfilmentThrough1: Option " ",Production,Inventory;
}