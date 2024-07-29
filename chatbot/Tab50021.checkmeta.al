table 50021 checkmeta
{
    Caption = 'checkmeta';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; check; Text[50])
        {
            Caption = 'check';
        }
        field(2; "no. of check"; Integer)
        {
            Caption = 'no. of check';
        }
    }
    keys
    {
        key(PK; check)
        {
            Clustered = true;
        }
    }
}
