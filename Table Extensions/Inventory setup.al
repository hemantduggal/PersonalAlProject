/// <summary>
/// TableExtension inventorySetupExt (ID 500012) extends Record Inventory Setup.
/// </summary>
tableextension 50002 inventorySetupExt extends "Inventory Setup"
{
    fields
    {
        field(50200; "Book Nos."; Code[20])
        {
            Caption = 'Book Nos.';
            TableRelation = "No. Series";
        }
        field(50000; "NRGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50001; "4G Rework Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(50002; "Store requisition Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50003; "No Series Code"; Option)
        {
            OptionMembers = "Store Requisition","Offering Note","QA Result";
        }
        field(50004; "Prod Consumption Jnl Batch"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Prod Consumption Jnl Template"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Prod Output Jnl Batch"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Prod Output Jnl Template"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "FARGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50009; "Offering No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50010; "Sequence No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50011; "Consumption Temp No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50012; "Relation Ship No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50013; "Inventory Planning No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50014; "Posted RGP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50015; "Customer Sub Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50016; "BSNL Offering No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50017; "IGA No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50018; "4G WIP No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50019; "Work Order"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50020; "Posted NRGP No"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50021; "SR No"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50022; "IGI No"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50023; "store req No"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50024; "Requisition No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50025; "Aim Chemistry No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50026; "Posted Aim Chemistry No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(50027; "Packing Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;

        }
    }
}