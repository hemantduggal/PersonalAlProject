/// <summary>
/// Table Equipment Line (ID 50421).
/// </summary>
table 50421 "Equipment Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Equipment Line';
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
        field(6; equipmentno; Code[20])
        {
            trigger OnValidate()
            var

            begin
                if equipmentno <> xRec.equipmentno then begin
                    inventorySetup.Get();
                    NoSeriesMgt.TestManual(inventorySetup."Book Nos.");
                    "No. Series" := '';
                end;
            end;

        }
        field(11; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        if equipmentno = '' then begin
            inventorySetup.Get();
            inventorySetup.TestField("Book Nos.");
            NoSeriesMgt.InitSeries(inventorySetup."Book Nos.", xRec."No. Series", 0D, "equipmentno", "No. Series");
        end;
    end;

    var

        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        RecNoSeries: Record "No. Series";
        inventorySetup: Record "Inventory Setup";
        userset: Record "User Setup";
        USERMGT: Codeunit "User Setup Management";
        RecDimension: Record "Dimension Value";
}













