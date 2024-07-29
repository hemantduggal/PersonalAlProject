/// <summary>
/// TableExtension custo (ID 50010) extends Record Detailed Cust. Ledg. Entry.
/// </summary>
tableextension 50011 "custo" extends "Detailed Cust. Ledg. Entry"
{

    fields
    {
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
            //Vend: Record Vendor;
            begin
                // if Vend.Get("Vendor No.") then
                //     Rec."Vendor Name" := Vend.Name;
                // Rec."Vendor Address" := Vend.Address;

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
    }
}