/// <summary>
/// Table EquipmentHeader (ID 50415).
/// </summary>
table 50415 EquipmentHeader
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Equipment No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
            //SL: record "Equipment Line";
            begin
                if "Equipment No" <> xRec."Equipment No" then begin
                    inventorySetup.Get();
                    NoSeriesMgt.TestManual(inventorySetup."Book Nos.");
                    "No. Series" := '';

                    //     sl.Reset();
                    //     sl.SetRange("No.", SL."No.");

                    //     if sl.FindSet() then
                    //         sl.equipmentno := rec."Equipment No";

                    //     sl.Modify();
                    //     rec.Modify();
                end;
            end;


        }

        field(2; "Part No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Part Name"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Equipment Type Main"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Location; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(6; "Department"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(7; "Assembly Card Name"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Assembly No"; code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(9; "Fixed Asset No"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            var
                RecFA: Record "Fixed Asset";
            begin
                IF RecFA.GET("Fixed Asset No") THEN
                    "Fixed Asset Description" := RecFA.Description;
            end;
        }
        field(10; "Fixed Asset Description"; text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Equipment Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(Key1; "Equipment No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        if "Equipment No" = '' then begin
            inventorySetup.Get();
            inventorySetup.TestField("Book Nos.");
            NoSeriesMgt.InitSeries(inventorySetup."Book Nos.", xRec."No. Series", 0D, "Equipment No", "No. Series");
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