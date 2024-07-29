
/// <summary>
/// TableExtension value entry  (ID 50023) extends Record Value Entry.
/// </summary>
tableextension 50023 "value entry " extends "Value Entry"
{
    fields
    {
        field(50000; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
            //Vend: Record Vendor;
            begin
                // if Vend.Get("Vendor No.") then
                //     Rec."Vendor Name" := Vend.Name;
                // Rec."Vendor Address" := Vend.Address;

            end;
        }
        field(50001; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Vendor Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
    }
}