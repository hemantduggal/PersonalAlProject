// /// <summary>
// /// TableExtension MyExtension (ID 50130) extends Record MyTargetTable.
// /// </summary>
// tableextension 50124 PurcHeaderEXt extends "Purchase Header"
// {


//     fields
//     {
//         field(111; EmpCode; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Emp code';
//             Width = 20;



//         }
//         field(222; FirstName; Text[50])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(100; LastName; Text[50])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(333; Department; Option)
//         {

//             OptionMembers = It,Hr,accounts,sales,marketting;
//             DataClassification = ToBeClassified;

//         }

//         field(44; Address; Text[50])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(555; "Mother Name"; Text[20])
//         {
//             DataClassification = ToBeClassified;

//         }

//         field(666; "Father Name"; Text[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(777; "Organization Name"; Text[20])
//         {
//             DataClassification = ToBeClassified;

//         }

//         field(888; Work; Text[20])
//         {
//             DataClassification = ToBeClassified;

//         }

//         field(999; "Company Name"; Text[100])
//         {

//             FieldClass = FlowField;
//             Caption = 'Company Name';
//             CalcFormula = lookup(Contact.Name where("No." = field("Company Name")));
//             Editable = false;

//         }
//         field(1111; "Parents Name"; Text[100])
//         {



//         }


//     }








// }

