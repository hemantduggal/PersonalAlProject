/// <summary>
/// TableExtension vendor (ID 50001) extends Record Vendor Ledger Entry.
/// </summary>
tableextension 50012 vendor extends "Vendor Ledger Entry"
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
        field(1120; "Remarks"; Text[100])
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
        field(1123; "EFT/Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}
