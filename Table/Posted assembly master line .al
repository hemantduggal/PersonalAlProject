
/// <summary>
/// Table POSTED ASSEMBLY MASTER Line (ID 50007).
/// </summary>
table 50007 "POSTED ASSEMBLY MASTER Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Posted Line';
    fields
    {

        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "item";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            TableRelation = Item."No.";


            trigger OnValidate()
            var
                RecItem: Record Item;
            begin
                IF RecItem.GET("No.") THEN
                    "Description" := RecItem.Description;
            end;
        }
        field(5; "Description"; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(1; quantity; Integer)
        {

        }
        field(2; amount; Decimal)
        { }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
}