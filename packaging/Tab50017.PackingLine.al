table 50017 "Packing Line"
{
    Caption = 'Packing Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }


        field(9; "Sale Line Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; "Line No."; Integer)
        {
            DataClassification = Tobeclassified;
        }
        field(3; "Marking"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = Tobeclassified;
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                ReqHead: Record "Requisition Header";
                RecItem: Record Item;
            begin
                RecItem.Reset();
                RecItem.get("Item No.");
                Description := RecItem.Description;///add  +RecItem."Product Name Description"

            end;

        }
        field(5; "Description"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Gross Weight(KG)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Net Weight(KG)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }


    keys
    {
        key(Key1; "Document No.", "Line No.")
        {

            Clustered = true;
        }
    }
}
