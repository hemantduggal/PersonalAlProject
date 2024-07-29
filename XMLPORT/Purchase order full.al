xmlport 50011 PurchaseorderXmlport
{
    Caption = 'Import purchase order';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Purchaseorder)
        {
            MinOccurs = Zero;
            tableelement("Purchase Header"; "Purchase Header")
            {
                AutoSave = false;
                XmlName = 'PurchasePort';

                textelement(No)

                {
                    MinOccurs = Zero;
                }
                textelement(Weight)
                {
                    MinOccurs = Zero;
                }

                textelement(VendorNo)
                {
                    MinOccurs = Zero;
                }

                textelement(PostingDate)
                {
                    MinOccurs = Zero;
                }
                textelement(LocationCode)
                {
                    MinOccurs = Zero;
                }

                textelement(PaymetTerms)
                {
                    MinOccurs = Zero;
                }
                textelement(Freight)
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
                textelement(LineQuantity)
                {
                    MinOccurs = Zero;
                }
                textelement(UnitRate)
                {
                    MinOccurs = Zero;
                }
                textelement(Discount)

                {
                    MinOccurs = Zero;
                }
                textelement(GSTGroup)
                {
                    MinOccurs = Zero;
                }
                textelement(HSNCode)
                {
                    MinOccurs = Zero;
                }
                textelement(GSTCredit)
                {
                    MinOccurs = Zero;
                }
                textelement(Dimension1)
                {
                    MinOccurs = Zero;
                }
                textelement(Dimension2)
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
                            recPurHead.Init();
                            recPurHead."Document Type" := recPurHead."Document Type"::Order;
                            recPurHead.Validate("No.", cdDocNo);
                            // recPurHead.Insert(true);

                            recPurHead.Validate("Buy-from Vendor No.", VendorNo);
                            recPurHead.Validate("Posting Date", dtPostingDate);
                            recPurHead.Validate("Location Code", LocationCode);

                            recPurHead.Modify(true);
                        end;
                        recpurline.Init();
                        recpurline."Document Type" := recpurline."Document Type"::Order;
                        recpurline."Document No." := recPurHead."No.";  //cdDocNo;
                        intLineNo += 10000;
                        recpurline."Line No." := intLineNo;
                        // recpurline.Insert(true);
                        Evaluate(enumType, AccountType);
                        recpurline.Validate(Type, enumType);
                        recpurline.Validate("No.", AccountNo);
                        Evaluate(Weights, Weight);
                        recpurline.Validate(Weight, Weights);
                        recpurline.Validate("Unit of Measure", UOM);
                        Evaluate(decQty, LineQuantity);
                        recpurline.Validate(Quantity, decQty);
                        Evaluate(decutrate, UnitRate);
                        recpurline.Validate("Unit Cost", decutrate);
                        Evaluate(decDiscount, Discount);
                        recpurline.Validate("Line Discount %", decDiscount);
                        recpurline.Validate("GST Group Code", GSTGroup);
                        recpurline.Validate("HSN/SAC Code", HSNCode);
                        Evaluate(EnumGstcredit, GSTCredit);
                        recpurline.Validate("GST Credit", EnumGstcredit);
                        recpurline.Validate("Shortcut Dimension 1 Code", Dimension1);
                        recpurline.Validate("Shortcut Dimension 2 Code", Dimension2);

                        recpurline.Modify(true);

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



        recPurHead: Record "Purchase Header";
        recpurline: Record "Purchase Line";
        intCounter: Integer;
        cdDocNo: Code[20];
        cdOldDocNo: Code[20];
        dtPostingDate: Date;
        dtOldPostingDate: Date;
        Weights: Decimal;
        "Size In CM": Decimal;
        dtInvoiceDate: Date;
        decQty: Decimal;
        decIgst: Decimal;
        decTotalValue: Decimal;
        enumType: Enum "Purchase Line Type";
        decutrate: Decimal;
        decDiscount: Decimal;
        EnumGstcredit: Enum "GST Credit";
        optFreight: Option "","Inclusive","To Pay","Extra","Customer Vehicle";
        intLineNo: Integer;
}




//     FieldSeparator = ',';


//     schema
//     {
//         textelement(Root)
//         {
//             MinOccurs = Zero;
//             tableelement(PurchaseHeader; Integer)
//             {
//                 AutoSave = false;
//                 AutoUpdate = false;
//                 XmlName = 'integer';
//                 SourceTableView = sorting(Number) where(Number = const(1));
//                 textattribute(No)
//                 {

//                 }
//                 textattribute(vendNo)
//                 { }
//                 textattribute(postingdate)
//                 {

//                 }
//                 textattribute(locationcode)
//                 {

//                 }
//                 textattribute(paymentterms)
//                 {

//                 }
//                 textattribute(accounttype)
//                 {

//                 }
//                 textattribute(accountNo)
//                 {

//                 }



//                 tableelement(PurchaseLine; Integer)
//                 {
//                     AutoSave = false;
//                     AutoUpdate = false;
//                     textattribute(UOM)
//                     {

//                     }
//                     textattribute(itemno)
//                     { }
//                     textattribute(lineqty)
//                     {

//                     }
//                     textattribute(unitcost)
//                     {

//                     }
//                     textattribute(discount)
//                     {

//                     }
//                     textattribute(gstgroup)
//                     {

//                     }
//                     textattribute(hsncode)
//                     {

//                     }
//                     textattribute(gstcredit)
//                     {

//                     }
//                     textattribute(dimension1)
//                     {

//                     }
//                     textattribute(dimension2)
//                     {

//                     }

//                     trigger OnBeforeInsertRecord()
//                     var
//                         item: Record Item;
//                     begin
//                         IF Heading then begin  ////skip heading of csv
//                             Heading := false;
//                             currxmlport.skip;
//                         end;
//                         item.reset();
//                         item.SetRange("No.", itemno);
//                         if item.FindFirst() then;
//                         Evaluate(lineqty1, lineqty);
//                         Evaluate(unitcost1, unitcost);
//                         ph.Reset();
//                         pl.Reset();
//                         //header
//                         ph.SetRange("No.", No);
//                         if ph.FindLast() then
//                             ph.Init();
//                         ph.Validate("No.", No);
//                         ph.Validate("Buy-from Vendor No.", vendNo);
//                         Evaluate(ph."Posting Date", postingdate);
//                         ph.Validate("Location Code", locationcode);
//                         ph.Validate("Payment Terms Code", paymentterms);
//                         Evaluate(ph."Bal. Account Type", accounttype);
//                         Evaluate(ph."Bal. Account No.", accountNo);
//                         ph.Modify();

//                         ///line
//                         pl1.SetRange("Document No.", No);
//                         if pl1.FindLast() then
//                             linenum := pl1."Line No." + 10000
//                         else
//                             Linenum := 10000;
//                         pl.Init();
//                         pl.Validate("No.", No);
//                         pl.Validate("Line No.", Linenum);
//                         pl.Insert();
//                         pl.SetRange("No.", No);
//                         pl.Type := pl.Type::Item;
//                         Evaluate(pl."No.", No);
//                         pl.Validate("Unit of Measure", UOM);
//                         Evaluate(pl.Quantity, lineqty);
//                         Evaluate(pl."Unit Cost", unitcost);
//                         Evaluate(pl."Line Discount %", discount);
//                         pl.Validate(pl."GST Group Code", gstgroup);
//                         pl.Validate(pl."HSN/SAC Code", hsncode);
//                         Evaluate(pl."GST Credit", gstcredit);
//                         pl.Validate("Shortcut Dimension 1 Code", dimension1);
//                         pl.Validate("Shortcut Dimension 2 Code", dimension2);
//                         pl.Modify();
//                     end;




//                 }
//             }
//         }
//     }


//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {

//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {

//                 }
//             }
//         }
//     }
//     trigger OnPreXmlPort()
//     begin
//         Heading := true;
//     end;

//     trigger OnPostXmlPort()
//     begin
//         Message('Import Successfully');
//     end;

//     procedure GetDocNo(No: Code[20])
//     begin
//         GlobalJobNo := No;

//     end;

//     local procedure GetEntryNo(No: Code[20]): Code[20]
//     begin

//         ph.RESET;
//         ph.SETRANGE("No.", ph."No.");
//         IF ph.FINDLAST THEN
//             EXIT(ph."No.")
//         ELSE
//             EXIT;

//     end;

//     var
//         myInt: Integer;
//         ph: record "Purchase Header";
//         GlobalJobNo: Code[20];
//         heading: Boolean;
//         pl1: Record "Purchase Line";
//         pl: Record "Purchase Line";
//         lineqty1: Decimal;
//         unitcost1: Decimal;
//         Linenum: Integer;
// }