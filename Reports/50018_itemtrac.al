report 50018 Itemtrackreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayouts/itemtrack.rdl';

    dataset
    {
        dataitem("Sales Shipment Line"; "Sales Shipment Line")
        {
            RequestFilterFields = "Document No.";
            column(Posting_DateSSL; "Posting Date")
            {

            }
            column(Order_No_SSL; "Order No.") { }
            column(ItemNO_SSLNo_; "No.") { }
            column(Description; Description) { }
            column(Variant_CodeSSL; "Variant Code") { }
            column(Unit_of_Measure_CodeS; "Unit of Measure Code") { }
            column(QuantitySSL; Quantity) { }
            column(lotno; ile2."Lot No.") { }
            // column(salesQC; salesqc) { }
            column(Posting_Date; ile2."Posting Date")
            {

            }
            column(Item_No_; ile2."Item No.")
            {

            }
            column(itemname; recitem.Description)
            {

            }
            column(Quantity; ile2.Quantity)
            {

            }
            column(Unit_of_Measure_Code; ile2."Unit of Measure Code")
            {

            }

            // column(posadj; ile2.posadj)
            // {

            // }
            // column(fillingqty; ile2.fillingqty)
            // {

            // }
            column(Unit_of_Measure_Code2; ile2."Unit of Measure Code")
            {

            }
            column(fillinglotno; ile2."Lot No.")
            {

            }

            column(assignLot_No_; ile."Lot No.") { }
            column(ilUnit_of_Measure_Code; ILE2."Unit of Measure Code")
            {

            }
            // column(fillingqc; ile2.QC)
            // {

            // }
            //production
            column(productionorderno; ILE3."Order No.")
            {

            }
            column(prodqty; ile3.quantity)
            {

            }
            column(puom; ile3."Unit of Measure Code")
            {

            }
            column(prodlotno; ile3."Lot No.")
            {

            }
            // column(prodqc; ile3.qc)
            // {

            // }
            column(proddate; ile3."Posting Date")
            {

            }

            //purchase
            column(Document_No_; ILE5."Document No.")
            {

            }
            column(Item_No_Pur; ile5."Item No.")
            {

            }
            column(Pitemname; recitem2.Description)
            {

            }
            column(PurLot_No_; ile5."Lot No.")
            {

            }
            // column(qcboolean; ile5.qc)
            // {

            // }

            column(PurcPosting_Date; ile5."Posting Date")
            {

            }
            column(PurQuantity; ile5.Quantity)
            {

            }
            column(PurchUnit_of_Measure_Code; ile5."Unit of Measure Code")
            {

            }








            trigger OnAfterGetRecord()
            var
            begin
                if recitem.get(ile2."Item No.") then;
                if recitem2.get(ile5."Item No.") then;
                ile.Reset();
                // ILE.SetRange("Lot No.", "Lot No.");
                ILE.SetRange("Document No.", "Document No.");
                ILE.SetRange("Entry Type", ILE."Entry Type"::"Positive Adjmt.");
                If ILE.FindFirst() then;
                ILE2.SetRange("Document No.", "Document No.");
                ILE2.SetRange("Entry Type", ILE."Entry Type"::"Negative Adjmt.");
                if ILE2.FindFirst() then;
                ILE3.Reset();
                ILE3.SetRange("Lot No.", ILE2."Lot No.");
                ILE3.SetRange("Entry Type", ILE3."Entry Type"::Output);
                if ILE3.FindFirst() then;
                ILE4.Reset();
                ILE4.SetRange("Order No.", "Order No.");
                ile4.SetRange("Document No.", ile3."Document No.");
                ile4.SetRange("Entry Type", ile."Entry Type"::Consumption);
                if ile4.FindFirst() then;
                ile5.SetRange("Lot No.", ile4."Lot No.");
                ILE5.SetRange("Entry Type", ILE."Entry Type"::Purchase);
                if ile5.FindFirst() then;

            end;

        }

    }

    var

        recitem: record Item;
        recitem2: record item;
        ILE: Record "Item Ledger Entry";
        ILE2: Record "Item Ledger Entry";
        ILE3: Record "Item Ledger Entry";
        ILE4: Record "Item Ledger Entry";
        ILE5: Record "Item Ledger Entry";

}