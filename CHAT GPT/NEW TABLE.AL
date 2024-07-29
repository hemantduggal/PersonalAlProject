table 59999 HemantTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Notes; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Pk; Notes)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}