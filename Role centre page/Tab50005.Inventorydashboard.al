table 50005 "Inventory dashboard"
{
    Caption = 'Inventory dashboard';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CaptionNo; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Blob1; Blob)
        {
            Caption = 'Blob1';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; CaptionNo)
        {
            Clustered = true;
        }
    }
}
