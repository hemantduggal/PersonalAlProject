table 50013 "Bulk Approval Criteria Setup"
{
    Caption = 'Bulk Approval Criteria Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[20])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Approved ID"; Code[20])
        {
            Caption = 'Approved ID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}
