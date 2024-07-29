/// <summary>
/// TableExtension items ledger (ID 501002) extends Record Item Ledger Entry.
/// </summary>
tableextension 50006 "items ledger" extends "Item Ledger Entry"
{
    fields
    {
        field(5002; "ItemUnitMeasure code"; code[20])
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
        field(50106; "Adv.Prepayment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "UseriD"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "2nd approver id"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50109; "DocumentNo."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Line No."; code[20])
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
        field(50114; "Unit ofMeasure"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50115; Amounts; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
}
