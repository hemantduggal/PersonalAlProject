table 50209 "Daily Cash Sales"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Denomination"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Count; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(5; lineno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; documentno; code[20])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(pk; documentno, lineno)
        {
            Clustered = true;
        }
    }



}