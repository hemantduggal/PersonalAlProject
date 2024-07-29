/// <summary>
/// TableExtension items (ID 50101) extends Record Item.
/// </summary>
tableextension 50101 items extends Item
{
    fields
    {
        field(111; brand; Option)
        {
            Caption = 'brand';
            DataClassification = ToBeClassified;
            OptionMembers = yageo,samwha,dexi,rayex;

        }
        field(112; itemcategorycode; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(113; heatno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(114; Billet_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(115; Size; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(116; Dia; Decimal)
        { DataClassification = ToBeClassified; }
        field(123; "Index no"; code[20])
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
        field(5000; "ItemUnitMeasure code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code;
        }

    }
}
