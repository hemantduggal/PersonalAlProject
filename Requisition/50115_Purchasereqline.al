table 50115 Purchreqline
{
    DataClassification = ToBeClassified;
    caption = 'Purchase requisition line';


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
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST(Item)) Item;

            //TableRelation = Item."No.";
            trigger OnValidate()
            var
                RecItem: Record Item;
                recfa: Record "Fixed Asset";
                reqh: Record "Purchase req header";
            begin
                IF RecItem.GET("No.") THEN
                    Description := RecItem.Description;
                " Direct Unit cost" := recitem."Unit Cost";
                "Global Dim 1" := RecItem."Global Dimension 1 Code";
                "Global Dim 2" := RecItem."Global Dimension 2 Code";
                UOM := RecItem."Base Unit of Measure";


                IF recfa.GET("No.") THEN
                    Description := recfa.Description;
                "Global Dim 1" := recfa."Global Dimension 1 Code";
                "Global Dim 2" := recfa."Global Dimension 2 Code";
                UOM := RecItem."Base Unit of Measure";


                reqh.Reset();
                reqh.SetRange("No.", "Document No");
                if reqh.FindFirst() then
                    Rec."Global Dim 1" := reqh."Global Dim 1";
                Rec."Global Dim 2" := reqh."Global Dim 2";


            end;
        }
        field(5; "Description"; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Quantity; Integer)
        {

        }
        field(7; " Direct Unit cost"; decimal)
        {

        }
        field(8; "Global Dim 1"; Code[50])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(9; "Global Dim 2"; Code[50])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }


        field(10; "Employee Code"; code[20])
        {

        }



        field(13; "Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,"Fixed Asset";
        }

        field(14; UOM; code[20])
        {
            TableRelation = "Unit of Measure";


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



    var
        myInt: Integer;


}