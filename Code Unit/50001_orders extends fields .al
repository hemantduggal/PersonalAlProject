codeunit 50001 salesorder
{       ///---Cle sales 
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure CopycustomFields(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    var

    begin

        SalesHeader."Vendor No." := SellToCustomer."Vendor No.";
        SalesHeader."Vendor Address" := SellToCustomer."Vendor Address";
        SalesHeader."Vendor Name" := SellToCustomer."Vendor Name";
        // SalesHeader.Customerid := SellToCustomer.customer;
        // SalesHeader."Contact person" := SellToCustomer."Contact person";
        // SalesHeader.Remarks := SellToCustomer.Remarks;
        // SalesHeader.Deal_date := SellToCustomer.Deal_date;
        // SalesHeader."order category" := SellToCustomer."order category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure Copyfromsalesheader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Vendor No." := SalesHeader."Vendor No.";
        GenJournalLine."Vendor Name" := SalesHeader."Vendor Name";
        GenJournalLine."Vendor Address" := SalesHeader."Vendor Address";
        GenJournalLine.customerorid := SalesHeader.Customerid;
        GenJournalLine.customertype := SalesHeader.Customertype;
        GenJournalLine."Contact person" := SalesHeader."Contact person";
        GenJournalLine.Remarks := SalesHeader.Remarks;
        GenJournalLine.Deal_date := SalesHeader.Deal_date;
        GenJournalLine."order category" := SalesHeader."order category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", OnAfterCopyCustLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure CopyFromJournalToledger(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."Vendor No." := GenJournalLine."Vendor No.";
        CustLedgerEntry."Vendor Name" := GenJournalLine."Vendor Name";
        CustLedgerEntry."Vendor Address" := GenJournalLine."Vendor Address";


        CustLedgerEntry.customerorid := GenJournalLine.customerorid;
        CustLedgerEntry.customertype := GenJournalLine.customertype;


        CustLedgerEntry."Contact person" := GenJournalLine."Contact person";
        CustLedgerEntry.Remarks := GenJournalLine.Remarks;
        CustLedgerEntry.Deal_date := GenJournalLine.Deal_date;

        CustLedgerEntry."order category" := GenJournalLine."order category";
    end;
    ///-----ILE ----sales 


    ///// 05-02-2024

    [EventSubscriber(ObjectType::Table, Database::"sales line", OnAfterCopyFromSalesLine, '', false, false)]
    local procedure CopyFromsalesLine(FromSalesLine: Record "Sales Line"; var SalesLine: Record "Sales Line")
    begin

        SalesLine."ItemUnitMeasure code" := FromSalesLine."ItemUnitMeasure code";

        SalesLine."Item Category Code" := FromSalesLine."Item Category Code";
        SalesLine.HEat_no := FromSalesLine.HEat_no;
        SalesLine.Billet_no := FromSalesLine.Billet_no;
        SalesLine.Size := FromSalesLine.Size;
        SalesLine.Dia := FromSalesLine.Dia;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromSalesLine, '', false, false)]///y value entry m b hogi 
    local procedure Copyfromitemjournalline(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."ItemUnitMeasure code" := SalesLine."ItemUnitMeasure code";
        ItemJnlLine.HEat_no := SalesLine.HEat_no;
        ItemJnlLine.Billet_no := SalesLine.Billet_no;
        ItemJnlLine.Size := SalesLine.Size;
        ItemJnlLine.Dia := SalesLine.Dia;


        ItemJnlLine.Weight := SalesLine.Weight;
        ItemJnlLine."Size (in cm)" := SalesLine."Size (in cm)";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", OnAfterCopyTrackingFromItemJnlLine, '', false, false)]
    local procedure CopyFromJourToledger(ItemJnlLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."ItemUnitMeasure code" := ItemJnlLine."ItemUnitMeasure code";
        ItemLedgerEntry.heatno := ItemJnlLine.HEat_no;
        ItemLedgerEntry.Billet_no := ItemJnlLine.Billet_no;
        ItemLedgerEntry.Size := ItemJnlLine.Size;
        ItemLedgerEntry.Dia := ItemJnlLine.Dia;


        ItemLedgerEntry.Weight := ItemJnlLine.Weight;
        ItemLedgerEntry."Size (in cm)" := ItemJnlLine."Size (in cm)";
    end;



    //======Detailed Cle

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure CopycustomerFields(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Vendor No." := SellToCustomer."Vendor No.";
        SalesHeader."Vendor Address" := SellToCustomer."Vendor Address";
        SalesHeader."Vendor Name" := SellToCustomer."Vendor Name";



        // SalesHeader."Contact person" := SellToCustomer."Contact person";
        // SalesHeader.Remarks := SellToCustomer.Remarks;
        // SalesHeader.Deal_date := SellToCustomer.Deal_date;
        // SalesHeader."order category" := SellToCustomer."order category";
    end;



    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure Copyfromsalesheaders(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Vendor No." := SalesHeader."Vendor No.";
        GenJournalLine."Vendor Address" := SalesHeader."Vendor Address";
        GenJournalLine."Vendor Name" := SalesHeader."Vendor Name";

        GenJournalLine.customerorid := SalesHeader.Customerid;
        GenJournalLine.customertype := SalesHeader.Customertype;

        GenJournalLine."Contact person" := SalesHeader."Contact person";
        GenJournalLine.Remarks := SalesHeader.Remarks;
        GenJournalLine.Deal_date := SalesHeader.Deal_date;
        GenJournalLine."order category" := SalesHeader."order category";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInsertDtldCustLedgEntry, '', false, false)]
    local procedure OnBeforeInsertDtldCustLedgEntry(var DtldCustledgEntry: Record "Detailed Cust. Ledg. Entry"; GenJournalLine: record "Gen. Journal Line"; DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer")
    begin
        DtldCustledgEntry."Vendor No." := GenJournalLine."Vendor No.";
        DtldCustledgEntry."Vendor Address" := GenJournalLine."Vendor Address";
        DtldCustledgEntry."Vendor Name" := GenJournalLine."Vendor Name";

        DtldCustledgEntry.customerorid := GenJournalLine.customerorid;
        DtldCustledgEntry.customertype := GenJournalLine.customertype;


        DtldCustledgEntry."Contact person" := GenJournalLine."Contact person";
        DtldCustledgEntry.Remarks := GenJournalLine.Remarks;
        DtldCustledgEntry.Deal_date := GenJournalLine.Deal_date;
        DtldCustledgEntry."order category" := GenJournalLine."order category";
    end;



    ////for purchase order----> vendor ledger entry 

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure CopycustomFieldsofGL(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin


        // SalesHeader."Contact person" := SellToCustomer."Contact person";
        // SalesHeader.Remarks := SellToCustomer.Remarks;
        // SalesHeader.Deal_date := SellToCustomer.Deal_date;
        // SalesHeader."order category" := SellToCustomer."order category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
    local procedure CopyPurchasealesheader(PurchaseHeader: record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Vendorid := PurchaseHeader.Vendorid;
        GenJournalLine.Vendortype := PurchaseHeader.Vendortype;


        GenJournalLine."Contact person" := PurchaseHeader."Contact person";
        GenJournalLine.Remarks := PurchaseHeader.Remarks;
        GenJournalLine.Deal_date := PurchaseHeader.Deal_date;
        GenJournalLine."order category" := PurchaseHeader."order category";
        GenJournalLine."Index no" := PurchaseHeader."Index no";
        GenJournalLine.Plank_no := PurchaseHeader.Plank_no;
        GenJournalLine."Currency Capacity" := PurchaseHeader."Currency Capacity";
        GenJournalLine."unit od specification" := PurchaseHeader."unit od specification";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", OnAfterCopyVendLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure CopyFromJournalToledgers(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        VendorLedgerEntry.Vendorid := GenJournalLine.Vendorid;
        VendorLedgerEntry.Vendortype := GenJournalLine.Vendortype;



        VendorLedgerEntry."Contact person" := GenJournalLine."Contact person";
        VendorLedgerEntry.Remarks := GenJournalLine.Remarks;
        VendorLedgerEntry.Deal_date := GenJournalLine.Deal_date;
        VendorLedgerEntry."order category" := GenJournalLine."order category";
        VendorLedgerEntry."Index no" := GenJournalLine."Index no";
        VendorLedgerEntry.Plank_no := GenJournalLine.Plank_no;
        VendorLedgerEntry."Currency Capacity" := GenJournalLine."Currency Capacity";
        VendorLedgerEntry."unit od specification" := GenJournalLine."unit od specification";
    end;



    //---------detailed vendor ledger entry 
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterCopyBuyFromVendorFieldsFromVendor, '', false, false)]
    local procedure Copy(Vendor: Record Vendor; var PurchaseHeader: Record "Purchase Header")
    begin
        PurchaseHeader.Vendorid := Vendor.Vendorid;
        PurchaseHeader.Vendortype := Vendor.Vendortype;



        PurchaseHeader."Contact person" := Vendor."Contact person";
        PurchaseHeader.Remarks := Vendor.Remarks;
        PurchaseHeader.Deal_date := Vendor.Deal_date;
        PurchaseHeader."order category" := Vendor."order category";
        PurchaseHeader."Index no" := vendor."Index no";
        PurchaseHeader.Plank_no := Vendor.Plank_no;
        PurchaseHeader."Currency Capacity" := Vendor."Currency Capacity";
        PurchaseHeader."unit od specification" := Vendor."unit od specification";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
    local procedure CopyPurchasealeshead(PurchaseHeader: record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Vendorid := PurchaseHeader.Vendorid;
        GenJournalLine.Vendortype := PurchaseHeader.Vendortype;



        GenJournalLine."Contact person" := PurchaseHeader."Contact person";
        GenJournalLine.Remarks := PurchaseHeader.Remarks;
        GenJournalLine.Deal_date := PurchaseHeader.Deal_date;
        GenJournalLine."order category" := PurchaseHeader."order category";
        GenJournalLine."Index no" := PurchaseHeader."Index no";
        GenJournalLine.Plank_no := PurchaseHeader.Plank_no;
        GenJournalLine."Currency Capacity" := PurchaseHeader."Currency Capacity";
        GenJournalLine."unit od specification" := PurchaseHeader."unit od specification";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInsertDtldVendLedgEntry, '', false, false)]
    local procedure OnBeforeInsertDtldVendLedgEntry(var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry"; GenJournalLine: record "Gen. Journal Line"; DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer")
    begin
        DtldVendLedgEntry.Vendorid := GenJournalLine.Vendorid;
        DtldVendLedgEntry.Vendortype := GenJournalLine.Vendortype;


        DtldVendLedgEntry."Contact person" := GenJournalLine."Contact person";
        DtldVendLedgEntry.Remarks := GenJournalLine.Remarks;
        DtldVendLedgEntry.Deal_date := GenJournalLine.Deal_date;
        DtldVendLedgEntry."order category" := GenJournalLine."order category";
        DtldVendLedgEntry."Index no" := GenJournalLine."Index no";
        DtldVendLedgEntry.Plank_no := GenJournalLine.Plank_no;
        DtldVendLedgEntry."Currency Capacity" := GenJournalLine."Currency Capacity";
        DtldVendLedgEntry."unit od specification" := GenJournalLine."unit od specification";
    end;


    ////----ile --purchase
    /// 
    /// 
    [EventSubscriber(ObjectType::Table, Database::"purchase line", OnAfterAddItem, '', false, false)]
    local procedure copyfrompurchline(LastPurchaseLine: Record "Purchase Line"; var PurchaseLine: Record "Purchase Line")
    begin
        //PurchaseLine."Index no" := LastPurchaseLine."Index no";
        //PurchaseLine.Plank_no := LastPurchaseLine.Plank_no;
        PurchaseLine.Weight := LastPurchaseLine.Weight;
        PurchaseLine."Size (in cm)" := LastPurchaseLine."Size (in cm)";

        PurchaseLine."Currency Capacity" := LastPurchaseLine."Currency Capacity";
        PurchaseLine."unit od specification" := LastPurchaseLine."unit od specification";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure Copyfromitemjournallines(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin

        // ItemJnlLine."Index no" := PurchLine."Index no";
        // ItemJnlLine.Plank_no := PurchLine.Plank_no;
        ItemJnlLine.Weight := PurchLine.Weight;
        ItemJnlLine."Size (in cm)" := PurchLine."Size (in cm)";

        ItemJnlLine."Currency Capacity" := PurchLine."Currency Capacity";
        ItemJnlLine."unit od specification" := PurchLine."unit od specification";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", OnAfterCopyTrackingFromItemJnlLine, '', false, false)]
    local procedure CopyFromJourToledgers(ItemJnlLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry.Weight := ItemJnlLine.Weight;
        ItemLedgerEntry."Size (in cm)" := ItemJnlLine."Size (in cm)";


        ItemLedgerEntry.itemcategorycode := ItemJnlLine.item_category_code;
        ItemLedgerEntry.heatno := ItemJnlLine.HEat_no;
        ItemLedgerEntry.Billet_no := ItemJnlLine.Billet_no;
        ItemLedgerEntry.Size := ItemJnlLine.Size;
        ItemLedgerEntry.Dia := ItemJnlLine.Dia;
        ItemLedgerEntry."Index no" := ItemJnlLine."Index no";
        ItemLedgerEntry.Plank_No := ItemJnlLine.Plank_no;
        ItemLedgerEntry."Currency capacity" := ItemJnlLine."Currency Capacity";
        ItemLedgerEntry."unit od specification" := ItemJnlLine."unit od specification";
    end;

    ////store req 


    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", OnAfterCopyTrackingFromItemJnlLine, '', false, false)]
    local procedure CopyFromJourToledgers1(ItemJnlLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry.Weight := ItemJnlLine.Weight;
        ItemLedgerEntry."Size (in cm)" := ItemJnlLine."Size (in cm)";
        ItemLedgerEntry.UseriD := ItemJnlLine.userid;
        ItemLedgerEntry."2nd approver id" := ItemJnlLine.userid2;
        ItemLedgerEntry.itemcategorycode := ItemJnlLine.item_category_code;
        ItemLedgerEntry.heatno := ItemJnlLine.HEat_no;
        ItemLedgerEntry.Billet_no := ItemJnlLine.Billet_no;
        ItemLedgerEntry.Size := ItemJnlLine.Size;
        ItemLedgerEntry.Dia := ItemJnlLine.Dia;
        ItemLedgerEntry."Index no" := ItemJnlLine."Index no";
        ItemLedgerEntry.Plank_No := ItemJnlLine.Plank_no;
        ItemLedgerEntry."Currency capacity" := ItemJnlLine."Currency Capacity";
        ItemLedgerEntry."unit od specification" := ItemJnlLine."unit od specification";
    end;


    ///G/L entry sales order
    /// 
    ////
    /// 
    /// 05-02-2024
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure CopycustomFieldss(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Vendor No." := SellToCustomer."Vendor No.";
        SalesHeader."Vendor Name" := SellToCustomer."Vendor Name";
        SalesHeader."Vendor Address" := SellToCustomer."Vendor Address";

        // SalesHeader."Contact person" := SellToCustomer."Contact person";
        // SalesHeader.Remarks := SellToCustomer.Remarks;
        // SalesHeader.Deal_date := SellToCustomer.Deal_date;
        // SalesHeader."order category" := SellToCustomer."order category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure Copysalesalesheader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Vendor No." := SalesHeader."Vendor No.";
        GenJournalLine."Vendor Name" := SalesHeader."Vendor Name";
        GenJournalLine."Vendor Address" := SalesHeader."Vendor Address";



        GenJournalLine."Contact person" := SalesHeader."Contact person";
        GenJournalLine.Remarks := SalesHeader.Remarks;
        GenJournalLine.Deal_date := SalesHeader.Deal_date;
        GenJournalLine."order category" := SalesHeader."order category";

    end;


    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterCopyGLEntryFromGenJnlLine, '', false, false)]
    local procedure CopyFromJournalToledgerss(GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin

        GLEntry."Vendor No." := GenJournalLine."Vendor No.";
        GLEntry."Vendor Name" := GenJournalLine."Vendor Name";
        GLEntry."Vendor Address" := GenJournalLine."Vendor Address";


        GLEntry."Contact person" := GenJournalLine."Contact person";
        GLEntry.Remarks := GenJournalLine.Remarks;
        GLEntry.Deal_date := GenJournalLine.Deal_date;
        GLEntry."order category" := GenJournalLine."order category";

    end;

    /// Vat entry sales order

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure Copycustom(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Vendor No." := SellToCustomer."Vendor No.";
        SalesHeader."Vendor Address" := SellToCustomer."Vendor Address";
        SalesHeader."Vendor Name" := SellToCustomer."Vendor Name";

        // SalesHeader."Contact person" := SellToCustomer."Contact person";
        // SalesHeader.Remarks := SellToCustomer.Remarks;
        // SalesHeader.Deal_date := SellToCustomer.Deal_date;
        // SalesHeader."order category" := SellToCustomer."order category";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure Copysalesalesheadeer(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Vendor No." := SalesHeader."Vendor No.";
        GenJournalLine."Vendor Address" := SalesHeader."Vendor Address";
        GenJournalLine."Vendor Name" := SalesHeader."Vendor Name";


        GenJournalLine."Contact person" := SalesHeader."Contact person";
        GenJournalLine.Remarks := SalesHeader.Remarks;
        GenJournalLine.Deal_date := SalesHeader.Deal_date;
        GenJournalLine."order category" := SalesHeader."order category";

    end;

    [EventSubscriber(ObjectType::Table, Database::"VAT Entry", OnAfterCopyFromGenJnlLine, '', false, false)]
    local procedure CopyFromJournalTo(var VATEntry: Record "VAT Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VATEntry."Vendor No." := GenJournalLine."Vendor No.";
        VATEntry."Vendor Address" := GenJournalLine."Vendor Address";
        VATEntry."Vendor Name" := GenJournalLine."Vendor Name";


        VATEntry."Contact person" := GenJournalLine."Contact person";
        VATEntry.Remarks := GenJournalLine.Remarks;
        VATEntry.Deal_date := GenJournalLine.Deal_date;
        VATEntry."order category" := GenJournalLine."order category";

    end;


    //value entry sales order


    [EventSubscriber(ObjectType::Table, Database::"sales line", OnAfterCopyFromSalesLine, '', false, false)]
    local procedure CopyFromsalesLines(FromSalesLine: Record "Sales Line"; var SalesLine: Record "Sales Line")
    begin




        SalesLine."Item Category Code" := FromSalesLine."Item Category Code";
        SalesLine.HEat_no := FromSalesLine.HEat_no;
        SalesLine.Billet_no := FromSalesLine.Billet_no;
        SalesLine.Size := FromSalesLine.Size;
        SalesLine.Dia := FromSalesLine.Dia;
    end;



    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromSalesLine, '', false, false)]
    local procedure Copyfromitemjournalliness(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine.item_category_code := SalesLine.item_category_code;
        ItemJnlLine.HEat_no := SalesLine.HEat_no;
        ItemJnlLine.Billet_no := SalesLine.Billet_no;
        ItemJnlLine.Size := SalesLine.Size;
        ItemJnlLine.Dia := SalesLine.Dia;
    end;



    [EventSubscriber(ObjectType::Table, Database::"Value Entry", OnSumCostsTillValuationDateOnAfterSetCostAmounts, '', false, false)]
    local procedure CopyFromJourToledgerssss(var ValueEntry: Record "Value Entry"; PrevValueEntrySum: Record "Value Entry")
    begin
        ValueEntry.item_category_code := PrevValueEntrySum.item_category_code;
        ValueEntry.HEat_no := PrevValueEntrySum.HEat_no;
        ValueEntry.Billet_no := PrevValueEntrySum.Billet_no;
        ValueEntry.Size := PrevValueEntrySum.Size;
        ValueEntry.Dia := PrevValueEntrySum.Dia;
    end;

    //////gen jrnl post krne pe value vle & gl entry me jane chahiye   iske 2 parts h 
    /// CopyFromGenJnlLine



    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", OnAfterCopyVendLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        VendorLedgerEntry."EFT/Document No" := GenJournalLine."EFT/Document No";
    end;


    //g/l ye uppr wale ka second part h
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromVendLedgEntry, '', false, false)]
    local procedure Cop(VendLedgerEntry: Record "Vendor Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."EFT/Document No" := VendLedgerEntry."EFT/Document No";

    end;


    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterCopyGLEntryFromGenJnlLine, '', false, false)]
    local procedure CopyFromJou(GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry."EFT/Document No" := GenJournalLine."EFT/Document No";


    end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnValidateBuyFromVendorNoOnAfterUpdateBuyFromCont, '', false, false)]
    // local procedure OnValidateBuyFromVendorNoOnAfterUpdateBuyFromCont(var PurchaseHeader: Record "Purchase Header"; xPurchaseHeader: Record "Purchase Header"; CallingFieldNo: Integer; var SkipBuyFromContact: Boolean);
    // var
    //     PurchLine: Record "Purchase Line";
    //     vendorItem: Record "Vendor Item Catalog";
    //     lineno: Integer;
    // begin
    //     if PurchaseHeader.Insert(true) then begin
    //         Commit();
    //         LineNo := 0;
    //         vendorItem.Reset();
    //         vendorItem.SetRange("Vendor No", PurchaseHeader."Buy-from Vendor No.");
    //         if vendorItem.FindFirst() then begin
    //             repeat
    //                 LineNo += 10000;
    //                 PurchLine.Init();
    //                 PurchLine."Document Type" := PurchaseHeader."Document Type";
    //                 PurchLine."Document No." := PurchaseHeader."No.";
    //                 PurchLine."Line No." := LineNo;
    //                 PurchLine.Insert(true);
    //                 PurchLine.Validate(Type, PurchLine.Type::Item);
    //                 PurchLine.Validate("No.", vendorItem."Item No.");
    //                 PurchLine.Weight := vendorItem.Weight;
    //                 PurchLine."Size (in cm)" := vendorItem.SIZE;
    //                 PurchLine.Modify();
    //             until vendorItem.Next() = 0;
    //         end;
    //     end;
    // end;



    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnValidateBuyFromVendorNoOnAfterRecreateLines, '', false, false)]
    // local procedure OnValidateBuyFromVendorNoOnAfterRecreateLines(var PurchaseHeader: Record "Purchase Header"; xPurchaseHeader: Record "Purchase Header"; CallingFieldNo: Integer);
    // var
    //     PurchLine: Record "Purchase Line";
    //     vendorItem: Record "Vendor Item Catalog";
    //     lineno: Integer;
    // begin
    //     Message(PurchaseHeader."No.");
    //     vendorItem.Reset();
    //     vendorItem.SetRange("Vendor No", PurchaseHeader."Buy-from Vendor No.");
    //     if vendorItem.FindFirst() then begin
    //         repeat
    //             LineNo += 10000;
    //             PurchLine.Init();
    //             PurchLine.Validate("Document Type", PurchaseHeader."Document Type");
    //             PurchLine.Validate("Document No.", PurchaseHeader."No.");
    //             PurchLine."Line No." := LineNo;
    //             PurchLine.Validate(Type, PurchLine.Type::Item);
    //             PurchLine.Validate("No.", vendorItem."Item No.");
    //             PurchLine.Weight := vendorItem.Weight;
    //             PurchLine."Size (in cm)" := vendorItem.SIZE;
    //             PurchLine.Insert(true);
    //         until vendorItem.Next() = 0;
    //     end;
    // end;











}