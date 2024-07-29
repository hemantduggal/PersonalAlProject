// /// <summary>
// /// XmlPort 50001.
// /// </summary>
// xmlport 50001 "Equipment ImportData"
// {
//     Caption = 'import  data';
//     Format = VariableText;
//     Direction = Import;
//     TextEncoding = UTF8;
//     UseRequestPage = false;
//     //Permissions = tabledata "EquipmentHeader" = rimd;

//     // FileName = '';

//     TableSeparator = '<NewLine>';
//     FieldDelimiter = '';
//     FieldSeparator = ',';

//     schema
//     {
//         textelement(root)
//         {
//             tableelement(Header; EquipmentHeader)
//             {
//                 AutoSave = true;


//                 XmlName = 'Import';

//                 AutoReplace = true;

//                 AutoUpdate = true;


//                 // textattribute("EquipmentNo")
//                 // {

//                 // }
//                 // textattribute("EquipmentTypeMain")
//                 // {

//                 // }
//                 // textattribute("EquipmentName") { }
//                 // textattribute("PartNo") { }
//                 // textattribute("PartName") { }
//                 // textattribute(Location) { }
//                 // textattribute(Department) { }
//                 // textattribute("AssemblyNo") { }
//                 // textattribute("FixedAssetNo") { }
//                 // textattribute("FixedAssetDescription") { }

//                 // trigger OnBeforeInsertRecord()
//                 // begin
//                 //     IF Heading then begin  ////skip heading of csv
//                 //         Heading := false;
//                 //         currxmlport.skip;
//                 //     end;

//                 //     if Docno <> EquipmentNo then begin
//                 //         RecHeader.Init();

//                 //         RecHeader.Validate("Equipment No", EquipmentNo);
//                 //         RecHeader.Validate("Equipment Name", EquipmentName);
//                 //         RecHeader.Validate("Part No", PartNo);
//                 //         RecHeader.Validate("Part Name", PartName);
//                 //         RecHeader.Validate(Location, Location);
//                 //         RecHeader.Validate(Department, Department);
//                 //         RecHeader.Validate("Assembly No", AssemblyNo);
//                 //         RecHeader.Validate("Fixed Asset No", FixedAssetNo);
//                 //         RecHeader.Validate("Fixed Asset Description", FixedAssetDescription);
//                 //         // RecHeader.Insert();
//                 //         /// RecHeader.Modify();
//                 //         RecHeader.Insert();
//                 //         Docno := EquipmentNo;


//                 //     end;
//                 // end;





//                 // fieldelement("EquipmentNo"; Header."Equipment No")
//                 // {

//                 // }
//                 // fieldelement("EquipmentTypeMain"; Header."Equipment Type Main")
//                 // { }
//                 // fieldelement("EquipmentName"; Header."Equipment Name") { }
//                 // fieldelement("PartNo"; Header."Part No") { }
//                 // fieldelement("PartName"; Header."Part Name") { }
//                 // fieldelement(Location; header.Location) { }
//                 // fieldelement(Department; header.Department) { }
//                 // fieldelement("AssemblyNo"; header."Assembly No") { }
//                 // fieldelement("AssemblyCardName"; header."Assembly Card Name") { }
//                 // fieldelement("FixedAssetNo"; header."Fixed Asset No") { }
//                 // fieldelement("FixedAssetDescription"; header."Fixed Asset Description") { }











//                 ///line
//                 /// 
//                 ///



//                 tableelement(line; "Equipment Line")
//                 {
//                     AutoSave = true;


//                     XmlName = 'Import';

//                     AutoReplace = true;

//                     AutoUpdate = true;

//                     fieldelement(equipmentno; line.equipmentno) { }
//                     fieldelement(no; line."No.") { }
//                     fieldelement(amount; line.amount) { }
//                     fieldelement(quantity; line.quantity) { }


//                     //header

//                     trigger OnBeforeInsertRecord()
//                     var
//                     begin
//                         if Docno <> Header."Equipment No" then begin
//                             if DocnoL <> line.equipmentno then begin
//                                 RecHeader.Init();
//                                 recLine.init();

//                                 Docno := header."Equipment No";
//                                 DocnoL := line.equipmentno;
//                             end;
//                         end;
//                     end;



//                     trigger OnAfterGetRecord()
//                     var
//                     begin

//                         Header.Modify();
//                         line.Modify();

//                     end;


//                     // trigger OnBeforeInsertRecord()
//                     // var
//                     // begin
//                     //     if Docno <> line."No." then begin
//                     //         RecHeader.Init();

//                     //         Docno := line."No.";
//                     //     end;
//                     // end;



//                     // trigger OnAfterGetRecord()
//                     // var
//                     // begin

//                     //     line.Modify();

//                     // end;

//                 }
//             }

//         }

//     }


//     trigger OnPreXmlPort()
//     begin
//         Heading := true;

//     end;

//     trigger OnPostXmlPort()
//     begin
//         Message('Data Updated Successfully');
//     end;

//     var
//         Heading: Boolean;
//         custrec: record EquipmentHeader;
//         customer: record EquipmentHeader;


//         RecHeader: Record "EquipmentHeader";
//         Docno: Code[20];
//         recLine: Record "Equipment Line";
//         docnoL: code[20];
// }