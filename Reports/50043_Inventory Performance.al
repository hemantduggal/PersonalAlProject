/// <summary>
/// Report Inventory Perfromance Report (ID 50043).
/// </summary>
report 50043 "Inventory Performance Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory Performance Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Item.rdl';



    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(ascending) where("Entry Type" = filter(Output | "Negative Adjmt."));


            column(Comp_picture; CompInfo.Picture)
            {

            }
            column(CompNmae; CompInfo.Name)
            {

            }
            column(CompAddress; CompInfo.Address)
            {

            }

            column(Compcity; CompInfo.City)
            {

            }

            column(Compphone; CompInfo."Phone No.")
            {

            }

            column(Location_Code; "Location Code")
            {

            }
            column(sno; sno) { }

            column(item_no; item."No.")
            {

            }
            column(Description; item.Description)
            {

            }

            column(Quantity; Quantity) { }
            column(Posting_Date; "Posting Date") { }
            column(totalgoods; totalgoods)
            {

            }

            column(totalitems; totalitems)
            {

            }
            column(mostitem; mostitem)
            {

            }
            column(leastitem; leastitem)
            {

            }

            trigger OnAfterGetRecord()
            var
                il: Record "Item Ledger Entry";
            begin
                sno += 1;
                //most
                int := mostrequesteditem("Item Ledger Entry"."Item No.");
                if check < int then begin
                    check := int;
                    mostitem := "Item Ledger Entry"."Item No.";

                end;//least
                if check1 > int then begin
                    check1 := int;
                    leastitem := "Item Ledger Entry"."Item No.";

                end;
                if sno = 1 then begin
                    check1 := int;
                    leastitem := "Item Ledger Entry"."Item No.";
                end;




                if item.Get(("Item Ledger Entry"."Item No.")) then;
                il.Reset();
                il.SETRANGE("Entry Type", "Entry Type"::"Positive Adjmt.");
                IF il.FindSet() THEN begin
                    il.CalcSums(Quantity);
                    totalgoods := il.Quantity;   ///total goods 
                end;



                //total items
                if item.Get(("Item Ledger Entry"."Item No.")) then;
                il.Reset();
                il.SETRANGE("Entry Type", "Entry Type"::"Negative Adjmt.");
                IF il.FindSet() THEN begin
                    il.CalcSums(Quantity);
                    totalitems := il.Quantity;

                end;

            end;

        }
    }

    trigger OnPreReport()
    var
    begin
        check := 0;
        sno := 0;
        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    trigger OnPostReport()
    var
    begin
        Message('%1', leastitem);
    end;

    /// <summary>
    /// mostrequesteditem.
    /// </summary>
    /// <param name="itemno">Code[20].</param>
    /// <returns>Return value of type Integer.</returns>
    procedure mostrequesteditem(itemno: Code[20]): Integer
    var
        itemled: Record "Item Ledger Entry";
    begin
        itemled.reset();
        itemled.SetRange("Item No.", itemno);
        itemled.SetRange("Entry Type", itemled."Entry Type"::"Negative Adjmt.");
        if itemled.FindFirst() then
            exit(itemled.Count);
    end;



    var
        myInt: Integer;
        CompInfo: Record "Company Information";
        item: record Item;
        sno: Integer;
        totalgoods: Decimal;
        least: Code[20];
        most: Code[20];
        totalitems: Integer;

        int: Integer;
        check: Integer;
        check1: integer;
        mostitem: code[20];
        leastitem: code[20];

}