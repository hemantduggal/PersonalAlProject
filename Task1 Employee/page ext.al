// /// <summary>
// /// PageExtension purcorderext (ID 50131) extends Record Purchase Order.
// /// </summary>
// pageextension 50124 purchse extends "Purchase Invoice"
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

//             }


//             field(FirstName; Rec.FirstName)
//             {

//             }
//             field(LastName; Rec.FirstName)
//             {

//             }
//             field(Department; Rec.Department)
//             {

//             }
//             field(Address; Rec.Address)
//             {

//             }
//             field("Mother Name"; Rec."Mother Name")
//             {

//             }

//             field("Father Name"; Rec."Father Name")
//             {

//             }

//             field("Organization Name"; Rec."Organization Name")
//             {

//             }
//             field(Work; Rec.Work)
//             {

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