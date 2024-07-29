
table 50100 mastertable
{
    DataClassification = ToBeClassified;
    LookupPageId = masterpage;

    fields
    {
        field(50000; no; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Close frequency"; DateFormula)
        {
            DataClassification = ToBeClassified;


        }



    }

    keys
    {
        key(Key1; no)
        {
            Clustered = true;
        }
    }
}