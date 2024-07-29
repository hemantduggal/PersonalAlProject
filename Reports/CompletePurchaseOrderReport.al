/// <summary>
/// Report Purchase Order Report1 (ID 50110).
/// </summary>
report 50110 "Purchase Order Report1"
{
    UsageCategory = Administration;
    Caption = 'Purchase Order Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //EnableExternalImages = true;
    RDLCLayout = 'ReportLayout\PurchaseOrderReport.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = const(order));
            RequestFilterFields = "No.";
            CalcFields = Amount;
            column(No_; "No.")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(Status; Status)
            {

            }
            column(AMt1; AMt1)
            {

            }
            column(GrandTotal1; GrandTotal1)
            {

            }
            column(TotalTax2; TotalTax2)
            { }
            column(PFValue1; PFValue1)
            {

            }
            column(CutingValue1; CutingValue1)
            {

            }
            column(Freight1; Freight1)
            { }
            column(currencCode; currencCode)
            {

            }
            // column(Vendor_Quotation_Date; "Vendor Quotation Date")
            // {

            // }
            // column(Vendor_Quotation_No_; "Vendor Quotation No.")
            // {

            // }
            column(UserDepartment; UserDepartment)
            {

            }
            column(HeaderCurrency_Code; "Currency Code")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Quote_No_; "Quote No.")
            {

            }
            column(QuoteDate; QuoteDate)
            {

            }
            column(Purchaser_Code; "Purchaser Code")
            {

            }
            column(PurchaserName; RecPurchaser.Name)
            {

            }
            column(PurchaserEmail; RecPurchaser."E-Mail")
            {

            }
            column(PurchaserPhone; RecPurchaser."Phone No.")
            {

            }

            column(Service; Service)
            {

            }
            column(material; material)
            {

            }
            column(Document_Date; "Document Date")
            {

            }

            // column(Comments; Comments)
            // {

            // }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(CompanyOpenPic; CompanyInfo."Picture")
            {

            }
            // column(CompanyInfoIECNO; CompanyInfo."IEC No.")
            // { }
            column(CompanyPhone; CompanyInfo."Phone No.")
            { }
            // column(CompanyReleasedPic; CompanyInfo."Released Picture")
            // {

            // }
            // column(CompanyPendingPic; CompanyInfo."Pending For Approval Picture")
            // {

            // }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; Companyinfo."Address 2")
            {

            }
            column(CompanyCity; CompanyInfo.City)
            {

            }
            column(CompanyPic; CompanyInfo.Picture)
            {

            }
            column(companyCode; companyinfo."Post Code")
            {

            }
            column(CompanyCountry; CompanyInfo.County)
            {

            }
            column(CompanyTelephone; CompanyInfo."Phone No.")
            {

            }
            // column(CompanyGST; CompanyInfo."GST Registration No.")
            // {

            // }
            column(companyEmail; CompanyInfo."E-Mail")
            {

            }
            // column(CompanyCIN; CompanyInfo."CIN No.")
            // {

            // }
            column(CompanyCountryName; RecCountry.Name)
            {

            }
            // column(CompanyStateName; RecState.Description)
            // {

            // }
            column(vendorcity; RecVendor.City)
            {

            }
            column(vendorpostalcode; RecVendor."Post Code")
            {

            }
            column(vendorTel; RecVendor."Phone No.")
            {

            }
            column(vendoraddress; RecVendor.Address)
            {

            }
            column(vendoraddress2; RecVendor."Address 2")
            {

            }
            column(vendorCountry; RecVendor."Country/Region Code")
            {

            }
            column(VendorTelNo; RecVendor."Phone No.")
            {

            }
            column(VendorEmail; RecVendor."E-Mail")
            {

            }
            // column(VendorGST; RecVendor."GST Registration No.")
            // {

            // }
            column(VendorContact; RecVendor.Contact)
            {

            }
            column(Location; RecLocation.Address)
            {

            }
            column(locationAdd2; RecLocation."Address 2")
            {

            }
            column(locationCountry; RecLocation."Country/Region Code")
            {

            }
            column(vendorOrderNo; "Vendor Order No.")
            {

            }
            column(vendorreg; RecVendor."Country/Region Code")
            {

            }
            column(locationpostcode; RecLocation."Post Code")
            {

            }
            // column(locationGST; RecLocation."GST Registration No.")
            // {

            // }
            column(locationCountryName; RecCountry1.Name)
            {

            }
            // column(locationStateName; RecState1.Description)
            // {

            // }
            column(locationcity; Reclocation.City)
            {

            }
            column(vendorgstin; RecVendor."VAT Registration No.")
            {

            }
            column(VendorName; RecVendor.Name)
            {

            }
            column(locationname; RecLocation.Name)
            {

            }
            // dataitem("Terms Condition Temporary"; "Terms Condition Temporary")
            // {
            //     DataItemLink = "Purchase Order No." = FIELD("No.");
            //     column(TempTermsCond_No_; "Document No.")
            //     {

            //     }
            //     column(TermsCondRemarks; "Terms Condition Temporary".Remarks)
            //     {

            //     }
            //     column(TermsCondRemarks1; "Terms Condition Temporary".Remarks1)
            //     {

            //     }
            // }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Document_No_; "Document No.")
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                column(PFValue; PFValue)
                {

                }
                column(Expected_Receipt_Date; "Expected Receipt Date")
                { }
                column(Freight; Freight)
                {

                }
                column(CutingValue; CutingValue)
                {

                }
                column(ItemNo; "Purchase Line"."No.")
                {

                }
                column(Description; Description)
                {

                }
                ///neha
                column(Description_2; "Description 2")
                {

                }
                /// 
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure; "Unit of Measure Code")
                {

                }
                column(Unit_Cost; "Direct Unit Cost")
                {

                }
                column(Line_Discount__; "Line Discount %")
                {

                }
                column(AmountInWords; AmountInWords[1])
                {

                }
                column(TAXAmountInWords; TAXAmountInWords[1])
                {

                }
                // column(HSN_SAC_Code; "HSN/SAC Code")
                // {

                // }
                column(Amount; Amount)
                {

                }
                column(Sno; Sno)
                {

                }
                column(Currency_Code; "Currency Code")
                {

                }
                column(IGST_perc1; IGST_perc1)
                {

                }
                column(IGST_Amt1; IGST_Amt1)
                {

                }
                column(CGST_perc1; CGST_perc1)
                {

                }
                column(CGST_Amt1; CGST_Amt1)
                {

                }
                column(SGST_perc1; SGST_perc1)
                {

                }
                column(SGST_Amt1; SGST_Amt1)
                {

                }
                column(IGST_perc; IGST_perc)
                {

                }
                column(IGST_Amt; IGST_Amt)
                {

                }
                column(CGST_perc; CGST_perc)
                {

                }
                column(CGST_Amt; CGST_Amt)
                {

                }
                column(SGST_perc; SGST_perc)
                {

                }
                column(SGST_Amt; SGST_Amt)
                {

                }
                // column(P___F_Value; "P & F Value")
                // {

                // }
                // column(Freight_Value; "Freight Value")
                // {

                // }
                // column(Cutting___Loading; "Cutting & Loading")
                // {

                // }

                // dataitem("Quality Specification"; "Quality Specification")
                // {
                //     DataItemLinkReference = "Purchase Line";
                //     DataItemLink = "Item No." = FIELD("No.");
                //     DataItemTableView = WHERE(stage = FILTER('PURCHASE'));
                //     column(Measurment_Code; "Measurment Code")
                //     {

                //     }
                //     column(Measurment_Description; "Measurment Description")
                //     {

                //     }
                //     column(Min_Value; "Min Value")
                //     {

                //     }
                //     column(Max_Value; "Max Value")
                //     {

                //     }
                //     trigger OnPreDataItem()
                //     begin

                //     end;
                // }

                trigger OnPreDataItem()
                var

                begin

                    GrandTotal := 0;

                    TotalTax1 := 0;


                end;

                trigger OnAfterGetRecord()
                var
                    PLRec: Record "Purchase Line";
                Begin
                    //if ("P & F Value" = true) OR ("Freight Value" = true) OR ("Cutting & Loading" = true) then
                    CurrReport.Skip();
                    Sno := Sno + 1;


                    IGST_perc := 0;
                    IGST_Amt := 0;
                    CGST_perc := 0;
                    CGST_Amt := 0;
                    SGST_perc := 0;
                    SGST_Amt := 0;
                    // GSTSetup.Get();//PT
                    // if "Purchase Line".Type = "Purchase Line".Type::Item then begin
                    //     TaxTransValue.Reset();
                    //     //TaxTransValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                    //     //TaxTransValue.SetRange("Tax Record ID", "Purchase Line".RecordId());
                    //    // TaxTransValue.SetRange("Value Type", TaxTransValue."Value Type"::COMPONENT);
                    //     //TaxTransValue.SetFilter(Percent, '<>%1', 0);
                    //     if TaxTransValue.FindSet() then
                    //         repeat
                    //             TaxComponentName := TaxTransValue.GetAttributeColumName();
                    //             //Message(TaxComponentName);
                    //             case TaxComponentName of
                    //                 'IGST':
                    //                     begin
                    //                         IGST_perc := TaxTransValue.Percent;
                    //                         evaluate(IGST_Amt, TaxTransValue."Column Value");
                    //                     end;
                    //                 'CGST':
                    //                     begin
                    //                         evaluate(CGST_Amt, TaxTransValue."Column Value");
                    //                         CGST_perc := TaxTransValue.Percent;
                    //                     end;
                    //                 'SGST':
                    //                     begin
                    //                         evaluate(SGST_Amt, TaxTransValue."Column Value");
                    //                         SGST_perc := TaxTransValue.Percent;
                    //                     end;
                    //             end;
                    //         until TaxTransValue.Next() = 0;
                    // END;

                    TotalTax += IGST_Amt + CGST_Amt + SGST_Amt;
                    TotalAmt += "Purchase Line".Amount;

                    GrandTotal := TotalAmt + TotalTax + PFValue + Freight + CutingValue + TotalTax1;
                    RecGenLedSetup.Get();
                End;

            }

            //     trigger OnAfterGetRecord()
            //     var
            //         PLRec: Record "Purchase Line";
            //         PLRec2: Record "Purchase Line";
            //     begin
            //         Clear(DimVal);
            //         Clear(UserDepartment);
            //         if DimVal.Get('DEPARTMENT', "Purchase Header"."Shortcut Dimension 1 Code") then
            //             UserDepartment := DimVal.Name
            //         else
            //             UserDepartment := '';
            //         if RecVendor.Get("Purchase Header"."Buy-from Vendor No.") then;
            //         if RecLocation.Get("Purchase Header"."Location Code") then;
            //         if RecPurchaser.Get("Purchase Header"."Purchaser Code") then;

            //         if RecCountry1.Get(RecLocation."Country/Region Code") then;

            //         //if RecState1.Get(RecLocation."State") then;


            //         if "Purchase Header"."Currency Code" = '' then
            //             currencCode := 'INR'
            //         else
            //             currencCode := "Purchase Header"."Currency Code";


            //         recpurchasequote.Reset();
            //         recpurchasequote.SetRange(recpurchasequote."Document Type", recpurchasequote."Document Type"::Quote);
            //         recpurchasequote.SetRange(recpurchasequote."No.", "Purchase Header"."Quote No.");
            //         if recpurchasequote.FindFirst() then
            //             QuoteDate := recpurchasequote."Document Date";


            //         IGST_perc1 := 0;
            //         IGST_Amt1 := 0;
            //         CGST_perc1 := 0;
            //         CGST_Amt1 := 0;
            //         SGST_perc1 := 0;
            //         SGST_Amt1 := 0;

            //         AMt1 := 0;
            //         IGST_perc2 := 0;
            //         IGST_Amt2 := 0;
            //         CGST_perc2 := 0;
            //         CGST_Amt2 := 0;
            //         SGST_perc2 := 0;
            //         SGST_Amt2 := 0;
            //         TotalTax2 := 0;
            //         GrandTotal1 := 0;
            //         PLRec2.Reset();
            //         PLRec2.SetRange(PLRec2."Document No.", "Purchase Header"."No.");
            //         // PLRec1.SetFilter(Type, '%1|%2', PLRec1.Type::Item, PLRec1.Type::"G/L Account");
            //         // PLRec2.SetRange("P & F Value", false);
            //         // PLRec2.SetRange("Cutting & Loading", false);
            //         // PLRec2.SetRange("Freight Value", false);
            //         if PLRec2.FindSet() then
            //             repeat
            //                 AMt1 += PLRec2.Amount;
            //             until PLRec2.Next() = 0;


            //         PLRec1.Reset();
            //         PLRec1.SetRange(PLRec1."Document No.", "Purchase Header"."No.");
            //         // PLRec1.SetFilter(Type, '%1|%2', PLRec1.Type::Item, PLRec1.Type::"G/L Account");

            //         if PLRec1.FindSet() then
            //             repeat
            //                 //if (PLRec1."P & F Value" = true) OR (PLRec1."Freight Value" = true) OR (PLRec1."Cutting & Loading" = true) then begin

            //                 GSTSetup1.Get();//PT
            //                 // TaxTransValue1.SetRange("Tax Type", GSTSetup1."GST Tax Type");
            //                 // TaxTransValue1.SetRange("Tax Record ID", PLRec1.RecordId());
            //                 // TaxTransValue1.SetRange("Value Type", TaxTransValue1."Value Type"::COMPONENT);
            //                 // TaxTransValue1.SetFilter(Percent, '<>%1', 0);
            //                 if TaxTransValue1.FindSet() then
            //                     repeat
            //                         TaxComponentName1 := TaxTransValue1.GetAttributeColumName();
            //                         case TaxComponentName1 of
            //                             'IGST':
            //                                 begin
            //                                     IGST_perc1 := TaxTransValue1.Percent;
            //                                     evaluate(IGST_Amt2, TaxTransValue1."Column Value");
            //                                     IGST_Amt1 += IGST_Amt2;
            //                                 end;
            //                             'CGST':
            //                                 begin
            //                                     evaluate(CGST_Amt2, TaxTransValue1."Column Value");
            //                                     CGST_perc1 := TaxTransValue1.Percent;
            //                                     CGST_Amt1 += CGST_Amt2;
            //                                 end;
            //                             'SGST':
            //                                 begin
            //                                     evaluate(SGST_Amt2, TaxTransValue1."Column Value");
            //                                     SGST_perc1 := TaxTransValue1.Percent;
            //                                     SGST_Amt1 += SGST_Amt2;
            //                                 end;
            //                         end;
            //                     until TaxTransValue1.Next() = 0;
            //             until PLRec1.Next = 0;

            //         TotalTax1 := IGST_Amt1 + CGST_Amt1 + SGST_Amt1;
            //         Clear(Freight);
            //         Clear(PFValue);
            //         clear(CutingValue);

            //         Clear(PFValue1);
            //         Clear(Freight1);
            //         Clear(CutingValue1);
            //         PLRec.Reset();
            //         PLRec.SetRange("Document No.", "Purchase Header"."No.");
            //         if PLRec.FindSet() then
            //             repeat
            //                 // if PLRec."P & F Value" then
            //                 //     PFValue1 += PLRec.Amount;
            //                 // if PLRec."Freight Value" then
            //                 //     Freight1 += PLRec.Amount;
            //                 // if PLRec."Cutting & Loading" then
            //                     CutingValue1 += PLRec.Amount;
            //             until PLRec.Next = 0;

            //         TotalTax2 := PFValue1 + Freight1 + CutingValue1 + AMt1;
            //         GrandTotal1 := TotalTax2 + IGST_Amt1 + CGST_Amt1 + SGST_Amt1;

            //         CLEAR(AmountInWords);
            //         CLEAR(TAXAmountInWords);
            //     //     if "Purchase Header"."Currency Code" <> '' then begin
            //     //         Check.InitTextVariable;
            //     //         Check.FormatNoText(AmountInWords, Round(GrandTotal1), "Purchase Header"."Currency Code");
            //     //         Check.FormatNoText(TAXAmountInWords, Round(TotalTax2), "Purchase Header"."Currency Code");
            //     //     end else begin
            //     //         Check.InitTextVariable;
            //     //         Check.FormatNoText1(AmountInWords, Round(GrandTotal1), "Purchase Header"."Currency Code");
            //     //         Check.FormatNoText1(TAXAmountInWords, Round(TotalTax2), "Purchase Header"."Currency Code");
            //     //     END;
            //     // end;

            // }

        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Terms & Conditions';
                    field(Service; Service)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Service';
                        trigger OnValidate()
                        begin
                            if Service then
                                material := Editable(false)
                            else
                                material := Editable(true);
                        end;
                    }
                    field(material; material)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Material';
                        trigger OnValidate()
                        begin
                            if material then
                                Service := Editable(false)
                            else
                                Service := Editable(true);
                        end;
                    }

                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        CompanyInfo.CalcFields(CompanyInfo."Picture");
        // CompanyInfo.CalcFields(CompanyInfo."Released Picture");
        // CompanyInfo.CalcFields(CompanyInfo."Pending For Approval Picture");
        Sno := 0;

        if RecCountry.Get(CompanyInfo."Country/Region Code") then;

        //if RecState.Get(CompanyInfo."State Code") then;

        if (Service or material) <> true then
            Error('Terms & Condition must select');

    end;

    trigger OnPostReport()
    var
    begin

    end;

    var
        UserDepartment: Text[100];
        // TaxTransValue: Record "Tax Transaction Value";
        // GSTSetup: Record "GST Setup";
        TaxComponentName: Text;
        Sno: Integer;
        AMt1: Decimal;
        CompanyInfo: Record "Company Information";
        RecVendor: Record "Vendor";
        RecLocation: Record "Location";
        // Check: Report 50182;
        CHeck1: Report 1401;

        AmountInWords: array[2] of Text;
        TAXAmountInWords: array[2] of Text;
        TotalAmt: Decimal;
        GrandTotal: Decimal;
        // RecIncoTerms: Record 50118;
        // RecTermsCondTemp: Record 50121;
        TermsCondRemarks: Text;
        TermsCondRemarks1: Text;
        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        flag: Boolean;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        PFValue: Decimal;
        Freight: Decimal;
        CutingValue: Decimal;
        PFValue1: Decimal;
        Freight1: Decimal;
        CutingValue1: Decimal;
        SGST_Amt: Decimal;
        // RecGStRates: Page "GST Rates";
        TotalTax: Decimal;
        TotalTax1: Decimal;
        RecGenLedSetup: Record "General Ledger Setup";
        Service: Boolean;
        material: Boolean;
        RecCountry: Record "Country/Region";
        // RecState: Record State;
        RecCountry1: Record "Country/Region";
        // RecState1: Record State;
        RecPurchaser: Record "Salesperson/Purchaser";
        recpurchasequote: Record "Purchase Header";
        QuoteDate: Date;
        currencCode: Code[20];
        PLRec1: Record "Purchase Line";
        IGST_perc1: Decimal;
        IGST_Amt1: Decimal;
        CGST_perc1: Decimal;
        CGST_Amt1: Decimal;
        SGST_perc1: Decimal;
        SGST_Amt1: Decimal;
        // TaxTransValue1: Record "Tax Transaction Value";
        // GSTSetup1: Record "GST Setup";
        TaxComponentName1: Text;
        IGST_perc2: Decimal;
        DimVal: Record "Dimension Value";
        IGST_Amt2: Decimal;
        CGST_perc2: Decimal;
        CGST_Amt2: Decimal;
        SGST_perc2: Decimal;
        SGST_Amt2: Decimal;
        DocNo: Code[20];
        TotalTax2: Decimal;
        GrandTotal1: Decimal;
}