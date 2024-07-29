tableextension 50007 customer extends Customer
{
    fields
    {
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
        field(50001; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Vendor Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "Active Credit limit"; Decimal)
        {
            DataClassification = ToBeClassified;


        }
        field(50004; "Remaining Credit limit"; Decimal)
        {
            DataClassification = ToBeClassified;
           // Editable = false;
        }

        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}