/// <summary>
/// Table EmployeeHeader (ID 50108).
/// </summary>
table 50108 EmployeeHeader
{
    DataClassification = ToBeClassified;
    Caption = 'Employee Header';
    Description = 'This is A employee Header Table';
    TableType = Normal;

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Address; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Address2; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; city; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; PostalCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; PhoneNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Message('Data inserted');
    end;

    trigger OnModify()
    begin
        Message('Data Modified');
    end;

    trigger OnDelete()
    begin
        Message('Data Deleted');
    end;

    trigger OnRename()
    begin
        Message('Data Renamed');
    end;

}