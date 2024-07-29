table 50068 BacklogN
{
    DataClassification = ToBeClassified;

    fields
    {

        field(37; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(pk; "Entry No")
        {
            Clustered = true;
        }
    }

    var

}