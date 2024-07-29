table 50016 "Store requisition line"
{
    Caption = 'Store requisition line';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "DocumentNo."; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'DocumentNo.';
            Editable = false;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No';
            Editable = false;
        }
        field(3; NO; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'NO';
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                item: Record Item;
                sh: Record storereqheader;
            begin
                //vis := false;
                if item.Get(rec.NO) then
                    rec.description := item.Description;
                rec.UOM := item."Base Unit of Measure";

                // sh.Reset();
                // sh.SetRange("NO.", rec."DocumentNo.");
                // if sh.FindFirst() then begin
                //     if sh.status1 = sh.status1::released then
                // vis := true;
                // end;
                //sh.Reset();
                if sh.Get("DocumentNo.") then begin
                    //sh.SetRange("NO.", rec."DocumentNo.");
                    //if sh.FindFirst() then begin
                    sh.status1 := sh.status1::released;
                    rec."Store Location" := sh.storelocation;
                    rec."Required location" := sh."Required Location";
                    rec.Shortcutdim1 := sh.Shortcutdim1;
                    rec.Shortcutdim2 := sh.Shortcutdim2;
                    rec."1stapprover" := sh."1stapprover";
                    // sh.Modify();
                    // rec.Modify();

                end;


            end;






        }
        field(4; description; Text[40])
        {
            DataClassification = ToBeClassified;
            Caption = 'description';
            Editable = false;
        }
        field(5; UOM; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'UOM';
            Editable = false;
        }
        field(6; "Store Location"; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Store Location';
            Editable = false;
        }
        field(7; "Required location"; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Required location';
            Editable = false;
        }
        field(8; "Requested Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Requested Quantity';
        }
        field(9; "Issue Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Issue Quantity';



        }
        field(10; "Available Stock"; Decimal)
        {
            Caption = 'Available Stock';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field(NO)));

        }
        field(11; Shortcutdim1; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shortcutdim1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
            Editable = false;
        }
        field(12; Shortcutdim2; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shortcutdim2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
            Editable = false;
        }
        field(14; "1stapprover"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup" where("1st Approver" = const(true));
        }
    }
    keys
    {
        key(PK; "DocumentNo.", "Line No")
        {
            Clustered = true;
        }
    }
    var
        vis: Boolean;
}
