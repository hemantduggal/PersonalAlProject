/// <summary>
/// TableExtension vend (ID 50016) extends Record Detailed Vendor Ledg. Entry.
/// </summary>
tableextension 50016 "vend" extends "Detailed Vendor Ledg. Entry"
{

    fields
    {
        field(50001; Vendorid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Vendortype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }

        field(1119; "Contact person"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

        }
        field(1129; "Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(1121; Deal_date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(1122; "order category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Process,Raw,Finished;


        }
        field(1123; "Index no"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1117; Plank_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1118; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1120; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
    }
}