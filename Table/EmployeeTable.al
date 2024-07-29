/// <summary>
/// Table EmployeeTable (ID 50101).
/// </summary>
table 50101 EmployeeTable
{
    DataClassification = ToBeClassified;///table properties 
    Caption = 'Employee Table', Locked = true, Comment = 'Keep like this, do not translate.', MaxLength = 20;
    Access = Internal;
    TableType = Normal;
    CompressionType = Page;
    Description = 'This is A Employee table Description ';




    fields
    {
        field(1; "emp code"; Code[10])
        {
            DataClassification = ToBeClassified;

            AutoFormatExpression = 'USD';
            AutoFormatType = 1;

        }



        field(2; "emp name"; Text[15])
        {
            DataClassification = ToBeClassified;
            Width = 50;
        }

        field(3; salary; Decimal)
        {
            DataClassification = ToBeClassified;
            BlankNumbers = BlankNegAndZero;
        }
        field(4; DOJ; date)
        {
            DataClassification = ToBeClassified;
            ClosingDates = true;

        }
        field(5; City; Option)
        {
            OptionMembers = Chennai,banglore,delhi,haryana;
            DataClassification = ToBeClassified;


        }
        field(6; D; Integer) { AutoIncrement = true; }

        field(7; EditableField; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(8; email; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; "emp code")
        {
            Clustered = true;
        }
        key(sk; City)
        {

        }
    }


    trigger OnInsert()
    begin
        Message('Data inserted');

    end;

    trigger OnModify()
    begin
        Message('Data modified');
    end;

    trigger OnDelete()
    begin
        Message('Data Deleted');
    end;

    trigger OnRename()
    begin
        Message('Data renamed');
    end;


}


