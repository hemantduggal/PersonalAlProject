table 50002 "Bulk Approval Criteria "
{
    Caption = 'Bulk Approval Criteria ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Criteria ID"; Code[20])
        {
            Caption = 'Criteria ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Item Category"; code[20])
        {
            Caption = 'Item Category';
            TableRelation = "Item Category";
            DataClassification = ToBeClassified;
        }
        field(3; "Price From"; Decimal)
        {
            Caption = 'Price From';
            DataClassification = ToBeClassified;
        }
        field(4; "Price To"; Decimal)
        {
            Caption = 'Price To';
            DataClassification = ToBeClassified;
        }
        field(5; "Volume Threshold"; Decimal)
        {
            Caption = 'Volume Threshold';
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;


        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Criteria ID")
        {
            Clustered = true;
        }
    }
}
