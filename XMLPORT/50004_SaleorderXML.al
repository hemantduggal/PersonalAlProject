// xmlport 50004 "Sales Order XMLImports"
// {
//     Caption = 'Sales Order ImpPort';
//     Direction = Import;
//     Format = VariableText;
//     UseRequestPage = false;
//     TextEncoding = WINDOWS;

//     schema
//     {
//         textelement(Salesaseorder)
//         {
//             MinOccurs = Zero;
//             tableelement("Sales Header"; "Sales Header")
//             {
//                 AutoSave = false;
//                 XmlName = 'SalePort';

//                 textelement(No)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(customerno)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(CustomerName)
//                 {
//                     MinOccurs = zero;
//                 }
//                 textelement(origcustname)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Location)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Extdoc)
//                 {
//                     MinOccurs = Zero;
//                 }

//                 textelement(PostingDate)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Salesperson)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(DocumentDate)
//                 {
//                     MinOccurs = Zero;
//                 }


//                 textelement(OrderType)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(ItemNo)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Brand)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(SPQ)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(MOQ)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(prodnamedesc)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(customerpartno)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(qtytype)
//                 {
//                     MinOccurs = Zero;
//                 }

//                 textelement(LocationLine)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(QTY)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(UOM)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(UnitPrice)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(amount)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Qtytoship)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(qtyshipped)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(qtytoinv)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(qtyinv)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(reqdate)
//                 {
//                     MinOccurs = Zero;
//                 }
//                 textelement(Remarks)
//                 {
//                     MinOccurs = Zero;
//                 }




//                 trigger OnBeforeInsertRecord()
//                 var
//                     itemrec: Record Item;
//                 begin
//                     intCounter += 1;
//                     if intCounter = 1 then
//                         currXMLport.Skip()
//                     else begin



//                         if (No <> cdOldDocNo) or (dtPostingDate <> dtOldPostingDate) then begin
//                             if No <> '' then
//                                 Evaluate(cdDocNo, No);
//                             recPurHead.Init();
//                             recPurHead."Document Type" := recPurHead."Document Type"::Order;
//                             recPurHead.Validate("No.", cdDocNo);
//                             if recPurHead.Insert(true) then begin
//                                 recPurHead."Sell-to Customer No." := customerno;
//                                 recPurHead."Sell-to Customer Name" := CustomerName;
//                                 recPurHead.originalcustomer := origcustname;
//                                 recPurHead."Location Code" := Location;
//                                 recPurHead."External Document No." := Extdoc;
//                                 if PostingDate <> '' then
//                                     Evaluate(dtPostingDate, PostingDate)
//                                 else
//                                     Error('Posting Date should not be blank at Line No %1', intCounter);
//                                 recPurHead."Salesperson Code" := Salesperson;
//                                 if Cust.get(recPurHead."Sell-to Customer No.") then;
//                                 recPurHead."Sell-to City" := Cust.City;
//                                 recPurHead."Sell-to Post Code" := Cust."Post Code";
//                                 recPurHead."Sell-to Phone No." := Cust."Phone No.";
//                                 recPurHead."Sell-to E-Mail" := Cust."E-Mail";
//                                 if DocumentDate <> '' then
//                                     Evaluate(dtdocumentdate, DocumentDate);
//                                 recPurHead."Order Date" := Today;
//                                 recPurHead."Customer GST Reg. No." := Cust."GST Registration No.";
//                                 recPurHead."Customer Posting Group" := Cust."Customer Posting Group";
//                                 recPurHead."Payment Terms Code" := Cust."Payment Terms Code";
//                                 recPurHead.Validate("Posting Date", dtPostingDate);
//                                 recPurHead.Validate("Document Date", dtdocumentdate);
//                                 Evaluate(OrderTypes, OrderType);
//                                 recPurHead.Validate("Order type", OrderTypes);
//                                 recPurHead.Modify();
//                             end;
//                         end;
//                         recpurline.Init();
//                         recpurline."Document Type" := recpurline."Document Type"::Order;
//                         recpurline."Document No." := recPurHead."No.";  //cdDocNo;
//                         intLineNo += 10000;
//                         recpurline."Line No." := intLineNo;
//                         if recpurline.Insert(true) then begin
//                             recpurline.Validate(Type, recpurline.Type::Item);
//                             recpurline."No." := ItemNo;
//                             if itemrec.get(ItemNo) then;
//                             recpurline."Location Code" := recPurHead."Location Code";
//                             recpurline.Description := itemrec.Description;
//                             recpurline."Unit Cost" := itemrec."Unit Cost";
//                             // recpurline.Validate(Description,des);
//                             recpurline.Validate(Brand, Brand);
//                             recpurline.Validate(spq, spq);
//                             recpurline.Validate(moq, MOQ);
//                             recpurline.Validate(productnamedesc, prodnamedesc);
//                             // Evaluate();
//                             recpurline.Validate(Customerpartno, customerpartno);
//                             // Evaluate(SuplCondins, SuplCondin);
//                             recpurline.Validate(qtytype, qtytype);
//                             recpurline.Validate("Location Code", Location);
//                             // Evaluate();
//                             Evaluate(decQty, QTY);
//                             recpurline.Validate(Quantity, decQty);
//                             // Evaluate(recpurline., TDC);
//                             recpurline.Validate(uom, uom);
//                             Evaluate(rate, UnitPrice);
//                             recpurline.Validate("Unit Price", rate);
//                             recpurline.Validate(Amount, amount);
//                             recpurline.Validate("Qty. to Ship", Qtytoship);
//                             recpurline.Validate("Quantity Shipped", qtyshipped);
//                             recpurline.Validate("Qty. to Invoice", qtytoinv);
//                             recpurline.Validate("Qty. Invoiced (Base)", qtyinv);
//                             recpurline.Validate("Requested Delivery Date", reqdate);
//                             recpurline.Validate(remarks, Remarks);
//                             recpurline.Modify();
//                         end;
//                         cdOldDocNo := No;
//                         dtOldPostingDate := dtPostingDate;

//                     end;

//                 end;
//             }
//         }
//     }

//     trigger OnPreXmlPort()
//     begin
//         intCounter := 0;
//         intLineNo := 0;
//     end;

//     trigger OnPostXmlPort()
//     begin
//         MESSAGE('Data has been successfully uploaded');
//     end;

//     var
//         recPurHead: Record "Sales Header";
//         recpurline: Record "Sales Line";
//         Cust: Record Customer;
//         intCounter: Integer;
//         cdDocNo: Code[20];
//         cdOldDocNo: Code[20];
//         dtPostingDate: Date;
//         dtdocumentdate: Date;
//         dtOldPostingDate: Date;
//         Weights: Code[20];
//         "Size In CM": Decimal;
//         dtInvoiceDate: Date;
//         decQty: Decimal;
//         decIgst: Decimal;
//         decTotalValue: Decimal;
//         enumType: Enum "Sales Line Type";
//         decutrate: Decimal;
//         decDiscount: Decimal;
//         EnumGstcredit: Enum "GST Credit";
//         optFreight: Option "","Inclusive","To Pay","Extra","Customer Vehicle";
//         intLineNo: Integer;
//         OrderTypes: Option Export,Domestic;
//         MLs: Integer;
//         SuplCondins: Option "AS Cast","As Rolled";
//         FLFMthrough: Option "Production","Inventory","External Workorder";
//         rate: Decimal;

// }

