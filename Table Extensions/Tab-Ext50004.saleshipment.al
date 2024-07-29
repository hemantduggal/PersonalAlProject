tableextension 50004 "sale shipment" extends "Sales Shipment Header"
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
