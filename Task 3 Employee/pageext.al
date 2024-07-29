// /// <summary>
// /// PageExtension purcorderext (ID 50131) extends Record Purchase Order.
// /// </summary>
// pageextension 50123 purcorderext extends "Purchase Order"
// {
//     layout
//     {
//         // Add changes to page layout here
//         addafter(Status)
//         {
//             field(EmpCode; Rec.EmpCode)
//             {
//                 AboutTitle = 'empcode';
//                 Caption = 'empcode';
//                 Lookup = true;
//                 ToolTip = '';
//                 ApplicationArea = all;
//                 trigger OnValidate()
//                 begin

//                 end;


//             }

//             field(FirstName; Rec.FirstName)
//             {
//                 Caption = 'first name';
//                 ApplicationArea = all;
//                 Importance = Promoted;

//             }
//             field(LastName; Rec.FirstName)
//             {
//                 ApplicationArea = all;
//             }
//             field(Department; Rec.Department)
//             {
//                 ApplicationArea = all;
//             }
//             field(Address; Rec.Address)
//             {
//                 ApplicationArea = all;
//             }
//             field("Mother Name"; Rec."Mother Name")
//             {
//                 ApplicationArea = all;
//             }

//             field("Father Name"; Rec."Father Name")
//             {
//                 ApplicationArea = all;
//             }

//             field("Organization Name"; Rec."Organization Name")
//             {
//                 ApplicationArea = all;
//             }
//             field(Work; Rec.Work)
//             {
//                 ApplicationArea = all;
//             }

//         }
//     }

//     actions
//     {
//         // Add changes to page actions here


//     }

//     var
//         myInt: Integer;
// }