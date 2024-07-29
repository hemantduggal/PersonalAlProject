table 50122 PostedPurchreqline
{
    DataClassification = ToBeClassified;
    caption = 'posted Purchase req line';


    fields
    {
        field(1; "Document No"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "No."; Code[20])
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
                "Unit cost" := recitem."Unit Cost";
                UOM := RecItem."Base Unit of Measure";
            end;
        }
        field(5; "Description"; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Unit cost"; decimal)
        {

        }

        field(7; quantity; Integer)
        {

        }
        field(8; Amount; decimal)
        {
            trigger onvalidate()
            var

            begin
                Amount := rec.quantity * rec."Unit cost";

            end;

        }
        field(9; Remarks; text[20])
        {

        }
        field(10; "No"; Code[10])
        {
            Caption = 'PNo.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GeneralledgSetup.Get();
                    NoSeriesMgt.TestManual(GeneralledgSetup."Posted requisition Header");
                    "No. Series" := '';
                end;
            end;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; UOM; code[20])
        {


        }



    }

    keys
    {
        key(pk; "Document No", "line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            GeneralledgSetup.Get();
            GeneralledgSetup.TestField("Posted requisition Header");
            NoSeriesMgt.InitSeries(GeneralledgSetup."Posted requisition Header", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        myInt: Integer;
        GeneralledgSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}