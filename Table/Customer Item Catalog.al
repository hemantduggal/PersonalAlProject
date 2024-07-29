table 50011 "Customer Item Catalog"
{
    Caption = 'Customer Item Catalog';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; customerNO; Code[20])
        {
            Caption = 'Customer No';
            TableRelation = Customer."No.";

        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = item."No.";

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
        field(6; "Customer Type"; Option)
        {
            Caption = 'Customer Type';
            OptionMembers = "",Normal,Advance;
        }
        field(7; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(8; "Customer ID"; Code[20])
        {
            Caption = 'Customer ID';
        }
    }
    keys
    {
        key(PK; customerNO, "Line No")
        {
            Clustered = true;
        }
    }
}
