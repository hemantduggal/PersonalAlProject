table 50012 storereqheader
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "NO."; code[20])
        {
            DataClassification = ToBeClassified;
            trigger onValidate()
            var
                myInt: Integer;
                srl: Record "Store requisition line";

            begin
                IF "NO." <> xRec."NO." THEN BEGIN
                    InventorySetup.Get();
                    userset.GET(USERID);
                    NoSeriesMgt.TestManual(InventorySetup."store req No");
                    "No. Series" := '';
                END;

                srl.Reset();
                srl.SetRange("DocumentNo.", rec."NO.");
                if srl.FindFirst() then
                    srl."DocumentNo." := rec."NO.";
            end;

        }
        field(2; Description; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "document date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                rec."document date" := Today;
            end;

        }
        field(4; status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "",Open,"Pending for Approval",Approved,Rejected;
            // Editable = false;
        }
        field(5; storelocation; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code where("Store location" = const(true));


        }
        field(6; "Required Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Location.Code;
            TableRelation = Location.Code where("Store location" = const(false));


        }
        field(7; "Requested By"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = User;
            Editable = false;

        }
        field(8; Shortcutdim1; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(9; Shortcutdim2; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(10; ApproverComment; Text[20])
        {
            DataClassification = ToBeClassified;



        }
        field(11; Approvaldate; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; status1; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "",Open,released;
            // Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "1stapprover"; code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "User Setup";
            TableRelation = "User Setup" where("1st Approver" = const(true));
        }
        field(15; "2ndapprover"; code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "User Setup";
            TableRelation = "User Setup" where("2nd approver" = const(true));
        }
        field(16; "2ApproverComment"; Text[20])
        {
            DataClassification = ToBeClassified;



        }



    }

    keys
    {
        key(pk; "NO.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

        invsetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        USERMGT: Codeunit "User Setup Management";
        userset: Record "User Setup";
        InventorySetup: Record "Inventory Setup";


    trigger OnInsert()
    begin
        if "No." = '' then begin
            inventorySetup.Get();
            inventorySetup.TestField("store req No");
            NoSeriesMgt.InitSeries(inventorySetup."store req No", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        "Document Date" := Today;
        "Requested By" := UserId;


    end;



}