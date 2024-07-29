table 50020 salechatanswertemp
{
    Caption = 'salechatanswertemp';
    DataClassification = ToBeClassified;
    // TableType = Temporary;

    fields
    {
        field(1; lineno; Integer)
        {
            Caption = 'lineno';
        }
        field(2; Answers; Text[250])
        {
            Caption = 'Answers';
        }
        field(3; "recordid"; RecordId)
        {
            Caption = 'recordid';
        }
    }
    keys
    {
        key(PK; lineno)
        {
            Clustered = true;
        }
    }
}
