// report 50111 "Barcode 2"
// {
//     UsageCategory = ReportsAndAnalysis;
//     Caption = 'Barcode 2';
//     DefaultLayout = RDLC;
//     ApplicationArea = all;
//     RDLCLayout = 'ReportLayout/GeneratePOBarCode.rdl';


//     dataset
//     {
//         dataitem("4G QC Barcode Buffer"; "4G QC Barcode Buffer")
//         {
//             RequestFilterFields = Barcode;
//             column(No_; "Released Production Order No")
//             {

//             }
//             column(Item_No_; "Item No.")
//             {

//             }
//             column(ComapnyInformation; ComapnyInformation.Picture)
//             {

//             }
//             column(Barcode; EncodedText)
//             {
//             }
//             column(POcodedLineText; POcodedLineText)
//             {
//             }
//             column(EncodedLineText; EncodedLineText)
//             {

//             }
//             column(SerialEncodedLineText; SerialEncodedLineText)
//             {

//             }

//             column(MN_Serial_No; Barcode)
//             {

//             }
//             trigger OnPreDataItem()
//             begin
//                 ComapnyInformation.Get();
//                 ComapnyInformation.CalcFields(Picture);
//             end;

//             trigger OnAfterGetRecord()
//             begin
//                 //  ImageBarcodePrint();
//                 //  IDMBarcodeGenerater();
//                 IDMBarcodeGenerater1;
//             end;

//             // trigger OnPreDataItem()
//             // begin
//             //     SetRange("User Id", UserId);
//             // end;
//         }

//     }

//     var

//         BarcodeString1: Text[1000];
//         BarcodeSymbol: Enum "Barcode Symbology";
//         BarcodeFont: Interface "Barcode Font Encoder 2D";
//         //   barci:Interface "Barcode Font Encoder 2D";
//         barcodeStr: Code[500];
//         EncodedText: Text[1000];
//         POcodedLineText: Text[1000];
//         EncodedLineText: Text[1000];
//         SerialEncodedLineText: Text[1000];
//         ComapnyInformation: Record "Company Information";
//         PONoBarcode: Record "TempBlobC";
//         ItemBarcode: Record "TempBlobC";
//         SerialBarcode: Record "TempBlobC";
//         BarcodeMgt: Codeunit "Barcode Mgt.";


//     local procedure ImageBarcodePrint()
//     var
//         BarcodeString: Text;
//     begin
//         // Set data string source 

//         Clear(BarcodeString);
//         Clear(BarcodeMgt);
//         BarcodeString := "4G QC Barcode Buffer".Barcode;
//         if BarcodeString <> '' then
//             BarcodeMgt.EncodeCode128(CopyStr(BarcodeString, 1, 255), 20, false, PONoBarcode);

//         Clear(BarcodeString);
//         Clear(BarcodeMgt);
//         BarcodeString := "4G QC Barcode Buffer".Barcode;
//         if BarcodeString <> '' then
//             BarcodeMgt.EncodeCode128(CopyStr(BarcodeString, 1, 255), 20, false, ItemBarcode);

//         Clear(BarcodeString);
//         Clear(BarcodeMgt);
//         BarcodeString := "4G QC Barcode Buffer".Barcode;
//         if BarcodeString <> '' then
//             BarcodeMgt.EncodeCode128(CopyStr(BarcodeString, 1, 255), 20, false, SerialBarcode);


//     end;

//     local procedure IDMBarcodeGenerater1()
//     var
//         BarcodeString: Text;
//         BarcodeSymbology: Enum "Barcode Symbology";
//         BarcodeFontProvider: Interface "Barcode Font Provider";
//     begin
//         BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;

//         // Declare the font using the barcode symbology enum
//         BarcodeSymbology := Enum::"Barcode Symbology"::Code39;

//         BarcodeString := "4G QC Barcode Buffer"."Item No.";
//         BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         // BarcodeFontProvider.va(BarcodeString, BarcodeSymbology);
//         EncodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//         // EncodedLineText := EncodeBarcode128(BarcodeString);
//         // end;

//         // if "Label Detail"."Serial No." <> '' then begin
//         Clear(BarcodeString);
//         BarcodeString := "4G QC Barcode Buffer".Barcode;
//         BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         //BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         SerialEncodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//         // end;

//         // if "Label Detail"."Document No." <> '' then begin
//         Clear(BarcodeString);
//         BarcodeString := "4G QC Barcode Buffer"."Part No.";
//         BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         //  BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         POcodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//     END;

//     local procedure IDMBarcodeGenerater()
//     var
//         BarcodeString: Text[1000];
//         BarcodeSymbology: Enum "Barcode Symbology 2D";
//         BarcodeFontProvider: Interface "Barcode Font Provider 2D";
//     begin
//         Clear(POcodedLineText);
//         Clear(EncodedLineText);
//         Clear(SerialEncodedLineText);
//         //IDAutomationHC39M
//         //IDAutomationC128M
//         // Declare the barcode provider using the barcode provider interface and enum
//         BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
//         // Declare the font using the barcode symbology enum
//         BarcodeSymbology := Enum::"Barcode Symbology 2D"::PDF417;
//         //BarcodeSymbology := Enum::"Barcode Symbology"::Code39;

//         // if "4G QC Barcode Buffer"."Item No." <> '' then begin

//         BarcodeString := "4G QC Barcode Buffer"."Item No.";
//         // BarcodeFontProvider.va(BarcodeString, BarcodeSymbology);
//         EncodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//         // EncodedLineText := EncodeBarcode128(BarcodeString);
//         // end;

//         // if "Label Detail"."Serial No." <> '' then begin
//         Clear(BarcodeString);
//         BarcodeString := "4G QC Barcode Buffer".Barcode;
//         //BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         SerialEncodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//         // end;

//         // if "Label Detail"."Document No." <> '' then begin
//         Clear(BarcodeString);
//         BarcodeString := "4G QC Barcode Buffer"."Part No.";
//         //  BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
//         POcodedLineText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
//         // end;
//     end;

//     local procedure EncodeBarcode128(CodeString: Text) "128BCodeString": Text[250]
//     var
//         Offset: Integer;
//         HighAscii: Integer;
//         Total: Integer;
//         iCounter: Integer;
//         Holder: Integer;
//         Check: Integer;
//         ASCIIValue: Integer;
//         CheckDigit: Integer;
//         Character: Char;
//     begin
//         Clear(Offset);
//         Clear(HighAscii);
//         Clear(Total);
//         Clear(iCounter);
//         Clear(Holder);
//         Clear(Check);
//         Clear(Character);
//         Clear(ASCIIValue);
//         Clear(CheckDigit);

//         Offset := 32;
//         HighAscii := 66;
//         "128BCodeString"[1] := 353;
//         Total := 104;

//         for iCounter := 1 to StrLen(CodeString) do begin
//             Character := CodeString[iCounter];
//             ASCIIValue := Character;
//             CheckDigit := ((ASCIIValue - Offset) * (iCounter));
//             Total += CheckDigit;
//             "128BCodeString"[iCounter + 1] := ASCIIValue;
//         end;
//         Check := Total mod 103;
//         Holder := 0;

//         if (Check + Offset >= 127) then begin
//             Holder := Check + Offset + HighAscii;
//             case Check of
//                 95:
//                     Holder := 8216;
//                 96:
//                     Holder := 8217;
//                 97:
//                     Holder := 8220;
//                 98:
//                     Holder := 8221;
//                 99:
//                     Holder := 8226;
//                 100:
//                     Holder := 8211;
//                 101:
//                     Holder := 8212;
//                 102:
//                     Holder := 732;
//             end;
//         end else
//             Holder := Check + Offset;

//         "128BCodeString"[StrLen("128BCodeString") + 1] := Holder;
//         Holder := 106 + Offset + HighAscii;
//         "128BCodeString"[StrLen("128BCodeString") + 1] := 339;
//         Clear(iCounter);

//         for iCounter := 1 to StrLen("128BCodeString") do
//             if ("128BCodeString"[iCounter] = 32) then
//                 "128BCodeString"[iCounter] := 8364;
//         exit("128BCodeString");
//     end;



// }