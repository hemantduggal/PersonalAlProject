// /// <summary>
// /// Report MyReport (ID 50125).
// /// </summary>
// report 50125 "Purchase order report"
// {

//     ApplicationArea = All;
//     Caption = 'Purchase Order report';
//     UsageCategory = Administration;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'ReportLayout\Po.rdl';

//     dataset
//     {
//         // dataitem(Integer; "Integer")
//         // {
//         //     DataItemTableView = sorting("Number");

//         // }

//         dataitem("Purchase Header"; "Purchase Header")
//         {
//             // DataItemTableView = sorting("No.");
//             // RequestFilterFields = "No.";
//             // RequestFilterFields = "Buy-from Vendor No.";
//             // //RequestFilterFields = Amount;


//             column(No; "No.")
//             {
//             }

//             column(Company_Name; "Company Name")
//             {

//             }

//             // column(company_picture;"Company Picture")
//             // {

//             // }
//             column(Caption; "Caption")
//             {

//             }
//             column(Details; "VDetails")
//             {

//             }
//             column(Details2; "BDetails")
//             {

//             }
//             column(Details3; "CDetails")
//             {

//             }
//             column(Details4; "otherdetails")
//             {

//             }
//             column(Details5; "amountdetails")
//             {

//             }
//             column(TermsAndCondition; "TermsAndConditions")
//             {

//             }

//             column(Address; Address)
//             {

//             }

//             column(Pay_to_Address; "Pay-to Address")
//             {

//             }


//             column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
//             {

//             }
//             column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
//             {

//             }
//             column(Buy_from_Address; "Buy-from Address")
//             {

//             }

//             column(Buy_from_City; "Buy-from City")
//             {

//             }

//             column(Document_Date; format("Document Date"))
//             {

//             }
//             column(Document_Type; "Document Type")
//             {

//             }
//             column(Order_Date; "Order Date")
//             {

//             }
//             column(Buy_from_Contact_No_; "Buy-from Contact No.")
//             {

//             }

//             column(Buy_from_Contact; "Buy-from Contact")
//             {

//             }
//             column(Buy_from_County; "Buy-from County")
//             {

//             }

//             column(Buy_from_Post_Code; "Buy-from Post Code")
//             {

//             }
//             column(Ship_to_Address; "Ship-to Address")
//             {

//             }
//             column(Ship_to_Address_2; "Ship-to Address 2")
//             {

//             }
//             column(Ship_to_City; "Ship-to City")
//             {

//             }
//             column(Ship_to_Code; "Ship-to Code")
//             {

//             }
//             column(Ship_to_Contact; "Ship-to Contact")
//             {

//             }

//             column(Ship_to_County; "Ship-to County")
//             {

//             }
//             column(Ship_to_Name; "Ship-to Name")
//             {

//             }

//             column(Ship_to_Post_Code; "Ship-to Post Code")
//             {

//             }
//             column(Vendor_Shipment_No_; "Vendor Shipment No.")
//             {

//             }



//             column(Payment_Discount__; "Payment Discount %")
//             {

//             }
//             column(Quote_No_; "Quote No.")
//             {

//             }
//             column(FirstName; FirstName)
//             {

//             }
//             column(EmpCode; EmpCode)
//             {

//             }


//             dataitem("Purchase Line"; "Purchase Line")
//             {
//                 DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
//                 DataItemLink = "Document No." = field("No.");

//                 //DataItemLinkReference = "Purchase Header";


//                 column(Amount; Amount)
//                 {

//                 }
//                 column(Description; Description)
//                 {

//                 }
//                 column(Quantity; Quantity)
//                 {

//                 }
//                 column(Sales_Order_No_; "Sales Order No.")
//                 {

//                 }
//                 column(No_; "No.")
//                 {

//                 }
//                 column(Item_Category_Code; "Item Category Code")
//                 {

//                 }
//                 column(Unit_of_Measure; "Unit of Measure")
//                 {

//                 }
//                 column(Outstanding_Quantity; "Outstanding Quantity")
//                 {

//                 }
//                 column(Unit_Cost; "Unit Cost")
//                 {

//                 }
//                 column(Unit_Price__LCY_; "Unit Price (LCY)")
//                 {

//                 }
//                 column(Line_Discount__; "Line Discount %")
//                 {

//                 }

//                 // column(Inv__Discount_Amount; "Inv. Discount Amount")
//                 // {

//                 // }
//                 column(Direct_Unit_Cost; "Direct Unit Cost")
//                 {

//                 }
//                 //   trigger OnAfterGetRecord()
//                 //   var
//                 //   myint:Integer;
//                 //   begin

//                 //   end;

//                 // trigger OnPreDataItem()
//                 //   var
//                 //   myInt:Integer;
//                 //   begin


//                 //   end;

//             }
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
//         // myInt: Integer;
//         Caption: Label ' Purchase Order';
//         VDetails: Label 'Vendor Details';
//         BDetails: Label 'Billing Details';
//         CDetails: Label 'Consignee Details';
//         otherdetails: label 'Please arrange to supply the below Materials/Services as per given specification';
//         amountDetails: label 'Total Order Amount in Words:';
//         TermsAndConditions: Label 'TermsAndConditions';

// }