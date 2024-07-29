/// <summary>
/// Table ASSEMBLY MASTER HEADER TABLE (ID 50003).
/// </summary>
table 50003 "ASSEMBLY MASTER HEADER TABLE"
{
    DataClassification = ToBeClassified;
    Caption = 'ASSEMBLY MASTER HEADER TABLE';
    Description = 'This is A ASSEMBLY MASTER HEADER TABLE';
    TableType = Normal;


    fields
    {
        field(1; "Equipment No"; Code[20])
        {
            DataClassification = ToBeClassified;


        }

        field(2; "Part No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Part Name"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Equipment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "ASSEMBLY";
        }
        field(5; Location; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(6; "Department"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CaptionClass = '1,2,1';
            Caption = 'Department';
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(7; "Assembly Name"; code[20])
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
        // field(11; "No. Series"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "No. Series";
        // }
        field(12; "SUb assembly card"; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(Key1; "Assembly No")
        {
            Clustered = true;
        }
    }



    var






}