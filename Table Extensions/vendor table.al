/// <summary>
/// TableExtension vendo (ID 50017) extends Record Vendor.
/// </summary>
tableextension 50018 "vendo" extends Vendor
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

        field(1123; "Index no"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1124; Plank_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1125; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1126; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
        field(1127; "EFT/Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1128; "Vendor Ship No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }


    }
}