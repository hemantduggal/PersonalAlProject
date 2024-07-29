// /// <summary>
// /// Report Sales order Report (ID 50126).
// /// </summary>
// report 50115 "Sale order Rep"
// {
//     UsageCategory = Administration;
//     Caption = 'Sale order Rep';
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'ReportLayout\SAle order.rdl';

//     dataset
//     {
//         dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
//         {
//             RequestFilterFields = "posting date";
//             DataItemTableView = sorting("Posting Date");

//             column(starting_date; starting_date)
//             {

//             }
//             column(ending_date; ending_date)
//             {

//             }





//             column(Posting_Date; "Posting Date")
//             {

//             }
//             column(CompanyName; CompanyInfo.Name)
//             {

//             }
//             column(dueDate; dueDate)
//             {

//             }
//             column(Vendor_No_; "Vendor No.")
//             {

//             }
//             column(Vendor_Name; vendName)// "Vendor Name")
//             {

//             }
//             column(vendName; vendName)
//             {

//             }
//             column(Currency_Code; "Currency Code")
//             {

//             }
//             column(Remaining_Amount; "Remaining Amount")
//             {

//             }
//             column(Amount; Amount)
//             {

//             }
//             column(CurMonthDue; CurMonthDue)
//             {

//             }
//             column(lastmonthdue1; lastmonthdue1)
//             {

//             }
//             column(lastmonthdue2; lastmonthdue2)
//             {

//             }
//             column(lastmonthdue3; lastmonthdue3)
//             {

//             }
//             column(lastmonthdue4; lastmonthdue4)
//             {

//             }
//             column(lastmonthdue5; lastmonthdue5)
//             {

//             }
//             column(lastmonthdue6; lastmonthdue6)
//             {

//             }
//             column(lastmonthdue7; lastmonthdue7)
//             {

//             }
//             column(lastmonthdue8; lastmonthdue8)
//             {

//             }
//             column(lastmonthdue9; lastmonthdue9)
//             {

//             }
//             column(lastmonthdue10; lastmonthdue10)
//             {

//             }
//             column(lastmonthdue11; lastmonthdue11)
//             {

//             }
//             column(Overalldue; Overalldue)
//             {

//             }
//             column(FirstDate1; FirstDate1)
//             {

//             }
//             column(FirtDate2; FirtDate2)
//             {

//             }
//             column(firstdate3; firstdate3)
//             {

//             }
//             column(firstDate4; firstDate4)
//             {

//             }
//             column(firstDate5; firstDate5)
//             {

//             }
//             column(firstDate6; firstDate6)
//             {

//             }
//             column(firstDate7; firstDate7)
//             {

//             }
//             column(firstDate8; firstDate8)
//             {

//             }
//             column(firstDate9; firstDate9)
//             {

//             }
//             column(firstDate10; firstDate10)
//             {

//             }
//             column(firstDate11; firstDate11)
//             {

//             }
//             column(firstDate12; firstDate12)
//             {

//             }
//             trigger OnPreDataItem()
//             begin
//                 SetRange("Due Date", 0D, dueDate);
//             end;
//  trigger OnAfterGetRecord()
//             var
//                 VLERec: Record "Vendor Ledger Entry";
//             begin
//                 Recvendor.Reset();
//                 if Recvendor.Get("Vendor No.") then
//                     VendName := Recvendor.Name;
//                      end;

//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     field(dueDate; dueDate)
//                     {
//                         ApplicationArea = all;
//                     }
//                     field(starting_date; starting_date)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Starting Date';
//                         trigger OnValidate()
//                         begin

//                         end;
//                     }
//                     field(ending_date; ending_date)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Ending Date';
//                         trigger OnValidate()
//                         begin

//                         end;
//                     }
//                 }
//             }
//         }


//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }
//      trigger OnInitReport()
//     begin
//         dueDate := System.Today;
//     end;
//     trigger OnPreReport()
//     var
//     begin
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(CompanyInfo.Picture);
//     end;

//     var
//         myInt: Integer;
//         CompanyInfo: Record "Company Information";
//         ending_date: Date;
//         starting_date: Date;




// }