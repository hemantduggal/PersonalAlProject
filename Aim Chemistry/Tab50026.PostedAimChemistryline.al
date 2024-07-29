table 50026 "Posted Aim Chemistry line"
{
    Caption = 'Posted Aim Chemistry Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Element; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","%C","%Mn","%Si","%S","%P","%Cr","%Ni","%Mo","%V","%AI","%Cu","%B","%Ca","%NB","%Co";
        }
        field(4; "Min Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Min';
        }
        field(5; "Max Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Max';
        }

    }
    keys
    {
        key(pk; "Document No", "line No")
        {
            Clustered = true;
        }
    }
}

