report 50150 "GSt Report1"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\BQReport.rdl';
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");
                column(Unit_Price; "Unit Price") { }
                column(Amount; Amount) { }
                column(Total_GST__; "Total GST %") { }
                column(Total_Price_Incl_GST; "Total Price Incl GST") { }
                column(Line_Amount; "Line Amount") { }
                column(SgstAmount; SgstAmount) { }
                column(CgstAmount; CgstAmount) { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    "Sr.No." += 1;
                    Clear(CgstAmount);
                    Clear(SgstAmount);
                    Clear(IgstAmount);
                    clear(GSTLineAMt);
                    Clear("Total GST %");
                    Clear("Value Inc.GST");
                    Clear("Total Price Incl GST");
                    Clear(Tqty);
                    Clear(TotalLineAmt);
                    SL1.RESET;
                    SL1.SETRANGE("Document No.", "Sales Line"."Document No.");
                    IF SL1.FINDFIRST THEN
                        repeat
                            Tqty += SL1.Quantity;
                            TotalLineAmt += SL1."Line Amount";
                        until SL1.Next() = 0;
                    SL.RESET;
                    SL.SETRANGE("Document No.", "Document No.");
                    IF SL.FINDFIRST THEN
                        //REPEAT
                            Clear(IGST_Amt3);
                    Clear(CGST_Amt3);
                    Clear(SGST_Amt3);
                    GSTSetup1.Get();
                    TaxTransValue1.SetRange("Tax Type", GSTSetup1."GST Tax Type");
                    TaxTransValue1.SetRange("Tax Record ID", SL.RecordId());
                    TaxTransValue1.SetRange("Value Type", TaxTransValue1."Value Type"::COMPONENT);
                    TaxTransValue1.SetFilter(Percent, '<>%1', 0);
                    if TaxTransValue1.FindSet() then
                        repeat
                            TaxComponentName1 := TaxTransValue1.GetAttributeColumName();
                            case TaxComponentName1 of
                                'IGST':
                                    begin
                                        IgstPer := TaxTransValue1.Percent;
                                        evaluate(IGST_Amt3, TaxTransValue1."Column Value");
                                        IgstAmount += IGST_Amt3;
                                    end;
                                'CGST':
                                    begin
                                        evaluate(CGST_Amt3, TaxTransValue1."Column Value");
                                        CgstPer += TaxTransValue1.Percent;
                                        CgstAmount += CGST_Amt3;
                                    end;
                                'SGST':
                                    begin
                                        evaluate(SGST_Amt3, TaxTransValue1."Column Value");
                                        SgstPer += TaxTransValue1.Percent;
                                        SgstAmount += SGST_Amt3;
                                    end;
                            end;
                            "Total Price Incl GST" := "Line Amount" + ("Line Amount" * "Total GST %") / 100;
                        until TaxTransValue1.Next() = 0;
                    //UNTIL SL.NEXT = 0;
                    "Total GST %" := SgstPer + CgstPer + IgstPer;
                    onlyTotalTax := ("Unit Price" * "Total GST %") / 100;
                    GSTLineAMt := CgstAmount + IgstAmount + SgstAmount;
                    "Value Inc.GST" := "Sales Line"."Unit Price" + onlyTotalTax;
                    "Total Value Inc.GST" := "Value Inc.GST" * "Sales Line".Quantity;
                    totalamt += Round("Total Value Inc.GST", 1, '=');
                    CLEAR(AmountInWords);
                    Check.InitTextVariable;
                    Check.FormatNoText(AmountInWords, Round(totalamt), SL."Currency Code");
                end;

            }
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
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
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if companyinfo.Get() then
            companyinfo.CalcFields(Picture);
    end;

    var
        "Sr.No.": Integer;
        companyinfo: Record "Company Information";
        "Total Basic Unit Rate": Decimal;
        TaxTransValue1: Record "Tax Transaction Value";
        SL: Record "Sales Line";
        SL1: Record "Sales Line";
        SL2: Record "Sales Line";
        GstSetup1: Record "GST Setup";
        CgstAmount: Decimal;
        SgstAmount: Decimal;
        IgstAmount: Decimal;
        GSTLineAMt: Decimal;
        IGST_Amt3: Decimal;
        CGST_Amt3: Decimal;
        SGST_Amt3: Decimal;
        IgstPer: Decimal;
        CgstPer: Decimal;
        SgstPer: Decimal;
        totalamt: Decimal;
        TaxComponentName1: Text[30];
        "Total GST %": Decimal;
        "Value Inc.GST": Decimal;
        "Total Value Inc.GST": Decimal;
        CHeck: report Check;
        AmountInWords: array[2] of Text;
        ShipTO: Record "Ship-to Address";
        Cust_ShipTO_Addr: Text;
        Customers: Record Customer;
        sh: Record "Sales Header";
        Tqty: Decimal;
        TotalLineAmt, tamtwithgst : Decimal;
        onlyTotalTax: Decimal;
        "Total Price Incl GST": Decimal;
        "Line Amt": Decimal;
}