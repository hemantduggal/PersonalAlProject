table 50025 "Posted Aim Chemistry header"
{
    Caption = 'Posted Aim Chemistry Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "NO."; Code[20])
        {
            Caption = 'Aim Chemistry No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    inventorysetup.Get();
                    NoSeriesMgt.TestManual(inventorysetup."Posted Aim Chemistry No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Casting Plan No"; Code[20])
        {
            Caption = 'Casting Plan No';
        }
        field(3; "RPO No"; Code[20])
        {
            Caption = 'RPO No';
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
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
        if "No." = '' then begin
            inventorysetup.Get();
            inventorysetup.TestField("Posted Aim Chemistry No.");
            NoSeriesMgt.InitSeries(inventorysetup."Posted Aim Chemistry No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        myInt: Integer;
        inventorysetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

