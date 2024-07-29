/// <summary>
/// TableExtension Posted Sales Haeder table (ID 50003) extends Record Sales Invoice Header.
/// </summary>
tableextension 50003 "Posted Sales Haeder table" extends "Sales Invoice Header"
{
    fields
    {

        field(50001; customerid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; customertype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }


        field(1119; "Contact person"; Text[100])
        {
            DataClassification = ToBeClassified;
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
    }
}
