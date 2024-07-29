#pragma warning disable DOC0101
/// <summary>
/// Report Job Work pending Material (ID 50252).
/// </summary>
//report 50252 "Job Work pending Material"
#pragma warning restore DOC0101
// //report 50253 "Job Work pending Materia1"
// {
//     UsageCategory = Administration;
//     Caption = 'Job Work pending Material';
//     ApplicationArea = all;
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(Vendor; Vendor)
//         {
//             column(FromDate; ToDate)
//             {

//             }
//             column(ToDate; ToDate)
//             {

//             }
//             column(VendorNo; VendorNo)
//             {

//             }

//             trigger OnPreDataItem()
//             var
//             begin


//                 if VendorNo <> '' then
//                     SetRange("No.", VendorNo);

//                 // SetRange("Posting Date", FromDate, ToDate);

//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(CompanyInfo.Name, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Dhandari Khurd,Near Phase VII, Focal Point,Ludhiana-141010', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Phone No.: 0161-7140000, GSTIN: 03AABCA4111E1ZN', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Date Filter', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(FromDate, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('To', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(ToDate, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Job Work Pending Material Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn('Vendor Name', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Opening Qty', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Issues(MTS)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Received(MTS)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Closing Qty(MTS)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//             end;

//             trigger OnAfterGetRecord()
//             Begin
//                 Clear(OpenQty);
//                 Clear(CloseQty);
//                 Clear(RecOutH);
//                 clear(RecOutL);
//                 clear(OutQty);
//                 Clear(RecInH);
//                 clear(RecInL);
//                 Clear(InQty);
//                 Clear(openinginqty);
//                 Clear(openingOutBurningLoss);
//                 Clear(openingoutQty);
//                 Clear(InBurningLoss);
//                 Clear(TotalInQty);
//                 Clear(openingInBurningLoss);
//                 outgoingdata := false;
//                 incomingdata := false;
//                 //>>>>>opening
//                 RecOuth.Reset();
//                 RecOuth.SetRange(RecOuth."Posting Date", 0D, FromDate - 1);
//                 if VendorNo <> '' then
//                     RecOutH.SetRange(RecOutH."Vendor No.", VendorNo)
//                 else
//                     RecOutH.SetRange(RecOutH."Vendor No.", Vendor."No.");
//                 if RecOuth.FindFirst() then begin
//                     repeat
//                         RecOutL.Reset();
//                         RecOutL.SetRange(RecOutL."Document No.", RecOutH."Document No.");
//                         //RecOutL.SetRange(RecOutL.No, "Outgoing Matrial Line".No);
//                         if RecOutL.FindSet() then bEgin
//                             repeat
//                                 openingoutQty += RecOutL.Quantity;
//                                 openingOutBurningLoss += RecOutL."Burning Loss";
//                             until RecOutL.Next() = 0;
//                         end;
//                     until RecOuth.Next() = 0;
//                 end;

//                 RecInH.Reset();
//                 RecInH.SetRange(RecInH."Posting Date", 0D, FromDate - 1);
//                 if VendorNo <> '' then
//                     RecInH.SetRange(RecInH."Vendor No.", VendorNo)
//                 else
//                     RecInH.SetRange(RecInH."Vendor No.", Vendor."No.");
//                 if RecInH.FindFirst() then begin
//                     repeat
//                         RecInL.Reset();
//                         RecInL.SetRange(RecInL."Document No.", RecInH."Document No.");
//                         // RecInL.SetRange(RecInL.No, "incoming Matrial Line".No);
//                         if RecInL.FindSet() then
//                             repeat
//                                 openinginqty += RecInL.Quantity;
//                                 openingInBurningLoss += RecInL."Burning Loss";//new change
//                             unTiL RecInL.Next() = 0;
//                     until RecInH.Next() = 0;
//                 end;
//                 //   OpenQty := openingoutQty + openinginqty + openingOutBurningLoss;//pehle
//                 OpenQty := openingoutQty - openinginqty - openingInBurningLoss;
//                 //<<<<<opening

//                 RecOuth.Reset();
//                 RecOuth.SetRange(RecOuth."Posting Date", FromDate, ToDate);
//                 if VendorNo <> '' then
//                     RecOutH.SetRange(RecOutH."Vendor No.", VendorNo)
//                 else
//                     RecOutH.SetRange(RecOutH."Vendor No.", Vendor."No.");
//                 if RecOuth.FindFirst() then begin
//                     repeat
//                         RecOutL.Reset();
//                         RecOutL.SetRange(RecOutL."Document No.", RecOutH."Document No.");
//                         //RecOutL.SetRange(RecOutL.No, "Outgoing Matrial Line".No);
//                         if RecOutL.FindSet() then bEgin
//                             repeat
//                                 outQty += RecOutL.Quantity;
//                                 //Message('%1', outQty);
//                                 OutBurningLoss += RecOutL."Burning Loss";
//                                 outgoingdata := true;
//                             until RecOutL.Next() = 0;
//                         end;
//                     //OpenQty += "Outgoing Matrial Line".Quantity + "Incoming Matrial Line".Quantity + "Burning Loss";
//                     until RecOuth.Next() = 0;
//                 end;

//                 RecInH.Reset();
//                 RecInH.SetRange(RecInH."Posting Date", FromDate, ToDate);
//                 if VendorNo <> '' then
//                     RecInH.SetRange(RecInH."Vendor No.", VendorNo)
//                 else
//                     RecInH.SetRange(RecInH."Vendor No.", Vendor."No.");
//                 if RecInH.FindFirst() then begin
//                     repeat
//                         RecInL.Reset();
//                         RecInL.SetRange(RecInL."Document No.", RecInH."Document No.");
//                         // RecInL.SetRange(RecInL.No, "incoming Matrial Line".No);
//                         if RecInL.FindSet() then
//                             repeat
//                                 inqty += RecInL.Quantity;
//                                 InBurningLoss += RecInL."Burning Loss";
//                                 TotalInQty := inqty + InBurningLoss;
//                                 incomingdata := true;
//                             until RecInL.Next() = 0;
//                     until RecInH.Next() = 0;
//                 end;


//                 CloseQty := (OpenQty + outQty) - TotalInQty;//neha-inqty;

//                 iF (outgoingdata = true) oR (incomingdata = true) then beGiN


//                     ExcelBuffer.NewRow;
//                     ExcelBuffer.AddColumn(Name, FALSE, '', FALSE, FALSE, FALSE, '0.000', ExcelBuffer."Cell Type"::text);
//                     ExcelBuffer.AddColumn(OpenQty, FALSE, '', FALSE, FALSE, FALSE, '0.000', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(outQty, FALSE, '', FALSE, FALSE, FALSE, '0.000', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(TotalInQty, FALSE, '', FALSE, FALSE, FALSE, '0.000', ExcelBuffer."Cell Type"::Number);
//                     ExcelBuffer.AddColumn(CloseQty, FALSE, '', FALSE, FALSE, FALSE, '0.000', ExcelBuffer."Cell Type"::Number);
//                 End;
//             End;

//         }


//     }
//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group("Options")
//                 {
//                     Caption = 'Options';
//                     field(FromDate; FromDate)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'From Date';
//                     }
//                     field(ToDate; ToDate)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'To Date';
//                     }
//                     field(VendorNo; VendorNo)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Vendor No.';
//                         TableRelation = Vendor."No.";

//                         trigger OnValidate()
//                         begin

//                         end;
//                     }
//                     field(PType; PType)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Type';

//                     }

//                 }
//             }
//         }
//     }

//     trigger OnPreReport()
//     var
//     begin
//         CompanyInfo.GET;
//         CompanyInfo.CalcFields(CompanyInfo.Picture);
//         ExcelBuffer.DELETEALL

//     end;

//     trigger OnPostReport()
//     begin
//         ExcelBuffer.CreateNewBook('Job Work Pending Material Report');
//         ExcelBuffer.WriteSheet('Job Work Pending Material Report', CompanyName, UserId);
//         ExcelBuffer.CloseBook();
//         ExcelBuffer.SetFriendlyFilename(StrSubstNo('Job Work Pending Material Report', CurrentDateTime, UserId));
//         ExcelBuffer.OpenExcel();

//     end;

//     var
//         ExcelBuffer: Record "Excel Buffer";
//         RecItem: Record Item;
//         Flag: Boolean;
//         CompanyInfo: Record "Company Information";
//         OpenQty: decimal;
//         CloseQty: Decimal;
//         FromDate: date;
//         ToDate: date;
//         VendorNo: Code[20];
//         PType: Option "External","Internal";
//         RecOutH: Record "Outgoing Matrial header";
//         RecOutL: Record "Outgoing Matrial Line";
//         RecInH: Record "Incoming Matrial header";
//         RecInL: Record "Incoming Matrial Line";
//         openingoutQty: Decimal;
//         openinginqty: decimal;
//         openingOutBurningLoss: Decimal;
//         openingInBurningLoss: Decimal;
//         outQty: Decimal;
//         inqty: decimal;
//         OutBurningLoss: Decimal;
//         InBurningLoss: Decimal;
//         TotalInQty: Decimal;
//         outgoingdata: Boolean;
//         incomingdata: Boolean;

// }
