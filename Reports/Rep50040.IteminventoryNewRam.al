/// <summary>
/// Report Item inventory New _ram (ID 50040).
/// </summary>
report 50030 "Item inventory New _ram"
{
    ApplicationArea = All;
    Caption = 'Item Stock (Inventory Location wise/Value)';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            trigger OnPreDataItem()
            var
                myIndt: Integer;
            begin
                CreateExcelHeader();
            end;

            trigger OnAfterGetRecord()
            begin
                // Clear(QTyFG);
                // Clear(QtySFG);
                // Clear(QTYMain);
                // Clear(QTYPackIng);
                // Clear(QtyTransit);
                // Clear(QtyStore);
                // Clear(QtyMOULDING);
                // Clear(QtySHOPFLOOR);
                // Clear(QtyASSEMBLY);
                // Clear(QtyREQUIRE);
                // Clear(TotalRequire);
                // Clear(TotalValAssembly);
                // Clear(TotalValFG);
                // Clear(TotalValMain);
                // Clear(TotalValMould);
                // Clear(TotalValPack);
                // Clear(TotalValSFG);
                // Clear(TotalValShopFloor);
                // Clear(TotalValStore);
                // Clear(TotalValTransit);
                // Clear(TotalQty);
                // Clear(TotalValue);

                ILERec.Reset();
                ILERec.SetRange("Item No.", Item."No.");
                if ILERec.FindSet() then
                    repeat
                        if "ILERec"."Location Code" = 'MAINSTORE' then begin
                            QTYMain += "ILERec"."Remaining Quantity";
                            TotalValMain := QTYMain * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'PACKING' then begin

                            QTYPackIng += "ILERec"."Remaining Quantity";
                            TotalValPack := QTYPackIng * Item."Unit Cost";
                        end;


                        if "ILERec"."Location Code" = 'IN-TRANSIT' then begin

                            QtyTransit += "ILERec"."Remaining Quantity";
                            TotalValTransit := QtyTransit * item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'FG' then begin
                            QTyFG += "ILERec"."Remaining Quantity";
                            TotalValFG := QTyFG * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'SFG' then begin

                            QtySFG += "ILERec"."Remaining Quantity";
                            TotalValSFG := QtySFG * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'STORE' then begin

                            QtyStore += "ILERec"."Remaining Quantity";
                            TotalValStore := QtyStore * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'MOULDING' then begin

                            QtyMOULDING += "ILERec"."Remaining Quantity";
                            TotalValMould := QtyMOULDING * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'SHOPFLOOR' then begin

                            QtySHOPFLOOR += "ILERec"."Remaining Quantity";
                            TotalValShopFloor := QtySHOPFLOOR * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'ASSEMBLY' then begin

                            QtyASSEMBLY += "ILERec"."Remaining Quantity";
                            TotalValAssembly := QtyASSEMBLY * Item."Unit Cost";
                        end;

                        if "ILERec"."Location Code" = 'REQUIRE' then begin

                            QtyREQUIRE += "ILERec"."Remaining Quantity";
                            TotalRequire := QtyREQUIRE * Item."Unit Cost";

                        end;
                    until ILERec.Next() = 0;

                TotalQty := QtyASSEMBLY + QtyMOULDING + QtyREQUIRE + QtySFG + QtySHOPFLOOR + QtyStore + QtyTransit + QTYPackIng + QTYMain + QTyFG;
                TotalValue := TotalRequire + TotalValAssembly + TotalValMould + TotalValSFG + TotalValShopFloor + TotalValStore + TotalValPack + TotalValMain + TotalValTransit + TotalValFG;

                //GrandTotal
                GrandQTyFG += QTyFG;
                GrandTotalValFG += TotalValFG;
                granddQtySFG += QtySFG;
                GranddTotalValSFG += TotalValSFG;
                grandQTYMain += QTYMain;
                GrandTotalValMain += TotalValMain;
                GrandQtyTransit += QtyTransit;
                GranddTotalValTransit += TotalValTransit;
                GrandQtyASSEMBLY += QtyASSEMBLY;
                grandTotalValAssembly += TotalValAssembly;
                GranddQtyMOULDING += QtyMOULDING;
                GranddTotalValMould += TotalValMould;
                GrandQTYPackIng += QTYPackIng;
                GrandTotalValPack += TotalValPack;
                GrandQtyREQUIRE += QtyREQUIRE;
                GranddTotalRequire += TotalRequire;
                GranddQtySHOPFLOOR += QtySHOPFLOOR;
                GrandTotalTotalValShopFloor += TotalValShopFloor;
                GrandQtyStore += QtyStore;
                GranddTotalValStore += TotalValStore;
                GrandTotalQty += TotalQty;
                GranddTotalValue += TotalValue;
                CreateExcelbody();
                //ANK
                SerialNo += 1;
                if SerialNo = Count then
                    GrandTotalll();

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        Excelbuffer.DeleteAll();
    end;

    trigger OnPreReport()
    begin
        Clear(TotalRequire);
        Clear(TotalValAssembly);
        Clear(TotalValFG);
        Clear(TotalValMain);
        Clear(TotalValMould);
        Clear(TotalValPack);
        Clear(TotalValSFG);
        Clear(TotalValShopFloor);
        Clear(TotalValStore);
        Clear(TotalValTransit);
        Clear(TotalQty);
        Clear(TotalValue);

    end;

    trigger OnPostReport()
    begin
        // Excelbuffer.CreateBookAndOpenExcel('', 'test', 'Report', CompanyName, UserId);
        Excelbuffer.CreateNewBook('Item Stock Location Wise Report');
        Excelbuffer.WriteSheet('Item Stock Location Wise Report', CompanyName, UserId);
        Excelbuffer.CloseBook();
        Excelbuffer.SetFriendlyFilename('Item Stock Location Wise Report');
        Excelbuffer.OpenExcel();
        // Excelbuffer.CreateBookAndOpenExcel('test', 'Report', CompanyName, UserId);
    end;

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        ILERec: record "Item Ledger Entry";
        QTYMain: Decimal;
        SerialNo: Integer;
        TotalValFG: Decimal;
        QTYPackIng: Decimal;
        TotalValSFG: Decimal;
        QtySFG: Decimal;
        QTyFG: Decimal;
        QtyStore: Decimal;
        QtyTransit: Decimal;
        QtyASSEMBLY: Decimal;
        QtyMOULDING: Decimal;
        QtyREQUIRE: Decimal;
        QtySHOPFLOOR: Decimal;
        TotalQty: decimal;
        TotalValue: decimal;
        TotalValMain: Decimal;
        TotalRequire: Decimal;
        TotalValAssembly: Decimal;
        TotalValMould: Decimal;
        TotalValShopFloor: Decimal;
        TotalValStore: Decimal;
        TotalValPack: Decimal;
        TotalValTransit: Decimal;
        //GrandTotalvariable
        GrandQTyFG: Decimal;
        GrandTotalValFG: Decimal;
        granddQtySFG: Decimal;
        GranddTotalValSFG: Decimal;
        grandQTYMain: Decimal;
        GrandTotalValMain: Decimal;
        GrandQtyTransit: Decimal;
        GranddTotalValTransit: Decimal;
        GrandQtyASSEMBLY: Decimal;
        grandTotalValAssembly: Decimal;
        GranddQtyMOULDING: Decimal;
        GranddTotalValMould: Decimal;
        GrandQTYPackIng: Decimal;
        GrandTotalValPack: Decimal;
        GrandQtyREQUIRE: Decimal;
        GranddTotalRequire: Decimal;
        GranddQtySHOPFLOOR: Decimal;
        GrandTotalTotalValShopFloor: Decimal;
        GrandQtyStore: Decimal;
        GranddTotalValStore: Decimal;
        GrandTotalQty: Decimal;
        GranddTotalValue: Decimal;

    local procedure CreateExcelHeader()
    begin
        ExcelBuffer.NewRow();
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Item Stock (Inventory Location wise/Value)', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('LOCATION', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
        Excelbuffer.AddColumn('Item No ', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Descripton', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('HSN No.', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('UOM', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Item Category code', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('FG', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('SFG', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('MAINSTORE', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('IN-TRANSIT', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('ASSEMBLY', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('MOULDING', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('PACKING', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('REQUIRE', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('SHOPFLOOR', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('STORE', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('TOTAL', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, false, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.NewRow();
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('QTY', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);
        Excelbuffer.AddColumn('Value', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);

    end;

    local procedure CreateExcelbody()
    begin

        Excelbuffer.NewRow();
        Excelbuffer.AddColumn(Item."No.", false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//1
        Excelbuffer.AddColumn(Item.Description, false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//2
        Excelbuffer.AddColumn(Item."HSN/SAC Code", false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//3
        Excelbuffer.AddColumn(Item."Base Unit of Measure", false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//4
        Excelbuffer.AddColumn(Item."Item Category Code", false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//5
        Excelbuffer.AddColumn(QTyFG, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//6
        Excelbuffer.AddColumn(TotalValFG, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//7
        Excelbuffer.AddColumn(QtySFG, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//8
        Excelbuffer.AddColumn(TotalValSFG, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//9
        Excelbuffer.AddColumn(QTYMain, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//10
        Excelbuffer.AddColumn(TotalValMain, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//11
        Excelbuffer.AddColumn(QtyTransit, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//12
        Excelbuffer.AddColumn(TotalValTransit, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//13
        Excelbuffer.AddColumn(QtyASSEMBLY, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//14
        Excelbuffer.AddColumn(TotalValAssembly, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//15
        Excelbuffer.AddColumn(QtyMOULDING, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//16
        Excelbuffer.AddColumn(TotalValMould, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//17
        Excelbuffer.AddColumn(QTYPackIng, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//18
        Excelbuffer.AddColumn(TotalValPack, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//19
        Excelbuffer.AddColumn(QtyREQUIRE, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//20
        Excelbuffer.AddColumn(TotalRequire, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//21
        Excelbuffer.AddColumn(QtySHOPFLOOR, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//22
        Excelbuffer.AddColumn(TotalValShopFloor, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//23
        Excelbuffer.AddColumn(QtyStore, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//24
        Excelbuffer.AddColumn(TotalValStore, false, '', false, false, true, '', Excelbuffer."Cell Type"::Number);//25
        Excelbuffer.AddColumn(TotalQty, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//26
        Excelbuffer.AddColumn(TotalValue, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//27

    end;

    local procedure GrandTotalll()
    begin
        Excelbuffer.NewRow();
        Excelbuffer.AddColumn('', false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//1
        Excelbuffer.AddColumn('', false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//2
        Excelbuffer.AddColumn('Total', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);//3
        Excelbuffer.AddColumn('', false, '', true, false, true, '', Excelbuffer."Cell Type"::Text);//4
        Excelbuffer.AddColumn('', false, '', false, false, true, '', Excelbuffer."Cell Type"::Text);//5

        Excelbuffer.AddColumn(GrandQTyFG, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//6
        Excelbuffer.AddColumn(GrandTotalValFG, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//7
        Excelbuffer.AddColumn(granddQtySFG, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//8
        Excelbuffer.AddColumn(GranddTotalValSFG, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//9
        Excelbuffer.AddColumn(grandQTYMain, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//10
        Excelbuffer.AddColumn(GrandTotalValMain, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//11
        Excelbuffer.AddColumn(GrandQtyTransit, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//12
        Excelbuffer.AddColumn(GranddTotalValTransit, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//13
        Excelbuffer.AddColumn(GrandQtyASSEMBLY, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//14
        Excelbuffer.AddColumn(grandTotalValAssembly, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//15
        Excelbuffer.AddColumn(GranddQtyMOULDING, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//16
        Excelbuffer.AddColumn(GranddTotalValMould, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//17
        Excelbuffer.AddColumn(GrandQTYPackIng, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//18
        Excelbuffer.AddColumn(GrandTotalValPack, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//19
        Excelbuffer.AddColumn(GrandQtyREQUIRE, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//20
        Excelbuffer.AddColumn(GranddTotalRequire, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//21
        Excelbuffer.AddColumn(GranddQtySHOPFLOOR, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//22
        Excelbuffer.AddColumn(GrandTotalTotalValShopFloor, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//23
        Excelbuffer.AddColumn(GrandQtyStore, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//24
        Excelbuffer.AddColumn(GranddTotalValStore, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//25
        Excelbuffer.AddColumn(GrandTotalQty, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//26
        Excelbuffer.AddColumn(GranddTotalValue, false, '', true, false, true, '', Excelbuffer."Cell Type"::Number);//27
    end;
}
