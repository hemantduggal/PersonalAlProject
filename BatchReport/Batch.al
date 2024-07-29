// /// <summary>
// /// Report Sales order batch report (ID 50000).
// /// </summary>
// report 50005 "Sales order batch report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     ProcessingOnly = true;
//     caption = 'S-Batch report';
//     Permissions = tabledata "Sales Invoice Header" = RIMD;

//     requestpage
//     {
//         SaveValues = true;
//         layout
//         {
//             area(Content)
//             {
//                 group(options)
//                 {
//                     caption = 'options';
//                     field(ExternalDocToApply; ExternalDocToApply)
//                     {
//                         ApplicationArea = All;
//                         Caption = ' External doc to Apply ';
//                         ToolTip = 'specify the no';

//                     }
//                     field(ReplaceExisting; ReplaceExisting)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'replace existing?';
//                         ToolTip = 'replace?';
//                     }
//                     field(locationToApply; locationToApply)
//                     {
//                         ApplicationArea = all;
//                     }
//                 }
//             }
//         }

//     }

//     trigger OnPreReport()
//     begin
//         if SalesHeader.FindSet() then begin
//             counter := SalesHeader.Count;
//             SalesHeader.ModifyAll("External Document No.", ExternalDocToApply);
//             SalesHeader.ModifyAll("Location Code", locationToApply)
//         end
//     end;

//     trigger OnPostReport()
//     var
//     begin
//         Message('Total No. of %1 documents updated ', counter, ExternalDocToApply);
//     end;





//     var
//         SalesHeader: Record "Sales Invoice Header";
//         ExternalDocToApply: Code[35];

//         ReplaceExisting: Boolean;
//         counter: Integer;
//         locationToApply: text;

// }