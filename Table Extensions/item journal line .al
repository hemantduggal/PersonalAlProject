/// <summary>
/// TableExtension  Sales head Gen. Journal Line (ID 50009) extends Record Gen. Journal Line.
/// </summary>
tableextension 50010 " item Journal Line" extends "Item Journal Line"
{

    fields
    {
        field(5003; "ItemUnitMeasure code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code;
        }
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
        field(120; "Index no"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(117; Plank_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(118; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(119; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
        field(121; userid; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(122; userid2; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50109; "DocumentNo."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50111; "ItemNo."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; Descriptions; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; Quantity1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Unit ofMeasure"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50115; Amounts; Decimal)
        {
            DataClassification = ToBeClassified;
        }


    }
}