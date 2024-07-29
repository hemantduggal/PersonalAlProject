/// <summary>
/// TableExtension  (ID 50103).
/// </summary>
tableextension 50103 """Detailed GST Ledger Entry""" extends "Sales Invoice Line"
{
    fields
    {
        field(5000; "ItemUnitMeasure code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code;
        }
        field(1128; "External Doc no"; code[50])
        {
            DataClassification = ToBeClassified;
            caption = 'externaldocno';
        }
        field(1123; item_category_code; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
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

        field(50100; "G/L entry"; Code[20])
        {
            Caption = 'G/L entry';
            DataClassification = ToBeClassified;
        }
        field(50101; "GST Component Code"; Code[20])
        {
            Caption = 'GST Component Code';
            DataClassification = ToBeClassified;
        }
        field(50102; "GST %"; Decimal)
        {
            Caption = 'GST %';
            DataClassification = ToBeClassified;
        }
        field(50103; "GST Amount"; Decimal)
        {
            Caption = 'GST Amount';
            DataClassification = ToBeClassified;
        }
    }
}
