tableextension 50200 glledg extends "General Ledger Setup"
{
    fields
    {
        field(5000; "Daily cash"; Code[20])
        {
            Caption = 'Daily Cash';
            TableRelation = "No. Series";
        }
        field(50001; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50002; "Posted requisition Header"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(50003; "Requisition Header"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

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