/// <summary>
/// TableExtension salesorders (ID 50106) extends Record Sales Line.
/// </summary>
tableextension 50106 salesorderss extends "Sales Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = ToBeClassified;
        }
        field(50001; "Size (in cm)"; Decimal)
        {
            Caption = 'Size (in cm)';
            DataClassification = ToBeClassified;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                item: record Item;
            begin
                if item.Get("No.") then begin
                    rec."ItemUnitMeasure code" := item."ItemUnitMeasure code";
                end;
            end;
        }
        field(1128; "External Doc no"; code[50])
        {
            //DataClassification = ToBeClassified;
            //TableRelation = "Sales Header"."External Document No.";
            caption = 'externaldocno';
            // FieldClass = FlowField;

            // trigger OnValidate()
            // var

            // begin
            //     if "External Doc no" <> '' then begin
            //         GetSalesHeader();
            //         if GetSalesHeader."External Document No." <> '' then
            //             Validate("External Doc no", GetSalesHeader."External Document No.") else
            //             Validate("External Doc no");



            //     end;


            // end;
        }

        field(1111; StudentNO; code[20])
        {
            Caption = 'StudentNO';
            DataClassification = ToBeClassified;
            TableRelation = "Student line Table".studentNo;
            trigger OnValidate()
            var
                recstudent: record "Student line Table";
            begin
                if recstudent.get(Rec.StudentNO) then
                    //rec.StudentSubject := recstudent.Subject;
                rec.StudentSubject := recstudent.StudentSubject;
                rec.marks := recstudent.Marks;
                rec."Date of birth" := recstudent."Date of birth";
                rec.Age := recstudent.Age;
                Rec.Modify()



            end;







        }
        field(1119; StudentSubject; Text[20])
        {

            DataClassification = ToBeClassified;
            Caption = 'subjects';
            //OptionMembers = English,physics,chemistry,bio,math;




        }
        field(1120; Marks; Integer)
        {

            DataClassification = ToBeClassified;
            //TableRelation = "Student line Table";


        }
        field(1121; "Date of birth"; Date)
        {

            DataClassification = ToBeClassified;
            //TableRelation = "Student line Table";


        }
        field(1122; Age; Integer)
        {

            DataClassification = ToBeClassified;
            //TableRelation = "Student line Table";


        }
        field(1123; item_category_code; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;

            trigger OnValidate()
            var
                itemR: record item;
            begin
                if itemR.get(Rec."No.") then
                    Rec.item_category_code := itemR.itemcategorycode;
                Rec.HEat_no := itemR.heatno;
                rec.Billet_no := itemR.Billet_no;
                rec.Size := itemR.Size;
                rec.Dia := itemR.Dia;



                Rec.Modify()



            end;







        }
        field(1127; HEat_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1124; Billet_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1125; Size; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1126; Dia; Decimal)
        { DataClassification = ToBeClassified; }
        field(1129; sales_type; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(1130; sales_code; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1131; start_date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(1132; end_date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(1133; location; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(1134; Item_no; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1135; closingfrequency; DateFormula)
        {
            DataClassification = ToBeClassified;

        }
        field(5003; "ItemUnitMeasure code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code;
        }



    }
}