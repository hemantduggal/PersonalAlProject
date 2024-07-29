table 50010 "Vendor Item Catalog"
{
    Caption = 'Vendor Item Catalog	';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            TableRelation = Vendor."No.";

        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = item."No.";
            // trigger OnValidate()
            // var
            //     item: record item;
            // begin
            //     if item.Get("Item No.") then begin
            //         rec."Unit Cost" := item."Unit Cost";
            //     end;

            // end;
        }
        field(3; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(4; Weight; Decimal)
        {
            Caption = 'Weight';
        }
        field(5; SIZE; Decimal)
        {
            Caption = 'SIZE';
        }
        field(6; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            OptionMembers = "",Normal,Advance;
        }
        field(7; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(8; "Vendor ID"; Code[20])
        {
            Caption = 'Vendor ID';
        }
    }
    keys
    {
        key(PK; "Vendor No", "Line No")
        {
            Clustered = true;
        }
    }
}
