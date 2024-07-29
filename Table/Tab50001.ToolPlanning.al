table 50001 "Tool Planning"
{
    Caption = 'Tool Planning';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Workstation No."; Code[20])
        {
            Caption = 'Workstation No.';
            TableRelation = "Work Center"."No.";
            DataClassification = ToBeClassified;
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "",Patch,Dye;
            DataClassification = ToBeClassified;
        }
        field(4; "Dye No."; Code[20])
        {
            Caption = 'Dye No.';
            TableRelation = Item;
            DataClassification = ToBeClassified;
        }
        field(5; "Lifetime Capacity"; Integer)
        {
            Caption = 'Lifetime Capacity';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if rec."Lifetime Capacity" < 0 then Error('Your value should not be negative');
                rec."Remaining Qty" := rec."Lifetime Capacity" - "Tracking Qty";

            end;
        }
        field(6; "Tracking Qty"; Integer)
        {
            Caption = 'Tracking Qty';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if rec."Lifetime Capacity" < 0 then Error('Your value should not be negative');
                if rec."Tracking Qty" > rec."Lifetime Capacity" then Error('Your Value is greater than Lifetime Capacity');
                rec."Remaining Qty" := rec."Lifetime Capacity" - "Tracking Qty";

            end;
        }
        field(7; "Remaining Qty"; Integer)
        {
            Caption = 'Remaining Qty';
            DataClassification = ToBeClassified;
        }
        field(8; "Alert Capacity"; Integer)
        {
            Caption = 'Alert Capacity';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
