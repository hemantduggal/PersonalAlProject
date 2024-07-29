table 50116 "Purchase req header"
{
    Caption = 'Purchase req header';
    DataClassification = ToBeClassified;
    //TableType = Normal;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'Requisition Doc No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    inventorysetup.Get();
                    NoSeriesMgt.TestManual(inventorysetup."Requisition No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;


        }
        field(4; "Posting date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Global Dim 2"; Code[50])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(6; "Global Dim 1"; Code[50])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(7; "Employee Code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(8; "To Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            tablerelation = location;

        }

        field(9; Vendor_No; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = vendor."No.";
            Caption = 'Contractor';

        }

        field(10; Status; option)
        {
            DataClassification = ToBeClassified;
            optionmembers = "",Open,Released,"Pending Approval";
        }
        field(11; "Production order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(12; "Sale order No."; Code[20])
        {
            DataClassification = ToBeClassified;
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
            inventorysetup.TestField("Requisition No.");
            NoSeriesMgt.InitSeries(inventorysetup."Requisition No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        myInt: Integer;
        inventorysetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

