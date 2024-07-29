/// <summary>
/// Table SafetyGuidlines (ID 50420).
/// </summary>
table 50000 SafetyGuidlines
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50000; "Maintenance Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Maintenance Closed Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Total Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Safety Norm to be maintained"; text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Safety Guidelines"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin


            end;

        }
        field(50005; SafetyNo; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Maintenance Job work"; code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; SafetyNo)
        {
            Clustered = true;
        }
    }
}