// report 50010 Incomingmaterial
// {
//     ApplicationArea = All;
//     Caption = 'Incoming Material Order Report';
//     UsageCategory = ReportsAndAnalysis;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'ReportLayout/incomingmaterial.rdl';
//     dataset
//     {
//         dataitem(InternalWorkOrderHeader; "Internal Work Order Header")
//         {
//             column(WorkOrderNo; "Work Order No.")
//             {
//             }
//             column(CustomerNo; "Customer No.")
//             {
//             }
//             column(CustomerName; "Customer Name")
//             {
//             }
//             column(Address; Address)
//             {
//             }
//             column(Address2; "Address 2")
//             {
//             }
//             column(City; City)
//             {
//             }
//             column(State; State)
//             {
//             }
//             column(PostCode; "Post Code")
//             {
//             }
//             column(internallineItemNo; internalline."G/L Account No.") { }
//             column(internallineItemCode; items."Item Code") { }
//             column(internallineQTY; internalline.Quantity) { }
//             column(incomingheadDOcno; incominghead."Document No.") { }
//             column(incominglineItemno; incomingline.No) { }

//             column(incominglineqty; incomingline.Quantity) { }
//             column(outgoingitemcode; items2."Item Code") { }
//             dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
//             {
//                 DataItemLink = "Internal Work Order" = field("work order no.");
//                 column(tranno; "No.")
//                 {
//                 }
//                 column(recptqty; transferline.Quantity) { }

//                 trigger OnAfterGetRecord()
//                 begin
//                     transferline.Reset();
//                     transferline.SetRange("Document No.", "Transfer Receipt Header"."No.");
//                     if transferline.FindFirst() then;
//                 end;
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 internalline.Reset();
//                 internalline.SetRange("Work Order No.", "Work Order No.");
//                 if internalline.FindFirst() then;

//                 if items.get(internalline."G/L Account No.") then;

//                 incominghead.Reset();
//                 incominghead.SetRange("Internal Work Order No.", "Work Order No.");
//                 if incominghead.FindFirst() then;

//                 incomingline.Reset();
//                 incomingline.SetRange("Document No.", incominghead."Document No.");
//                 if incomingline.FindFirst() then;

//                 if items2.get(incomingline.No) then;
//             end;
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
//             }
//         }
//     }
//     var
//         items: Record item;
//         items2: Record item;
//         internalline: Record "Internal Incoming Line";
//         incominghead: Record "Incoming Matrial Header";
//         incomingline: Record "Incoming Matrial Line";
//         transferhead: Record "Transfer Receipt Header";
//         transferline: Record "Transfer Receipt Line";
// }
