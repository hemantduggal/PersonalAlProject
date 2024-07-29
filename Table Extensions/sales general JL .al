/// <summary>
/// TableExtension Gen. Journal Line (ID 50009) extends Record Gen. Journal Line.
/// </summary>
tableextension 50009 " Sales head Gen. Journal Line" extends "Gen. Journal Line"
{

    fields
    {
        field(50005; Vendorid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; Vendortype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }
        field(50001; customerorid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; customertype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }



        field(50000; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                if Vend.Get("Vendor No.") then
                    Rec."Vendor Name" := Vend.Name;
                Rec."Vendor Address" := Vend.Address;

            end;
        }
        field(50003; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; "Vendor Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(1129; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(1119; "Contact person"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            // trigger OnValidate()
            // var
            //     sh: record Customer;
            // begin
            //     if sh.get(Rec."Sell-to Customer No.") then
            //         Rec."Contact person" := sh.Contact;




            //     Rec.Modify()
            // end;
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

    }
}