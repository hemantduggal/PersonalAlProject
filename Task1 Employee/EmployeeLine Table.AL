/// <summary>
/// Table EmployeeLine (ID 50109).
/// </summary>
table 50109 EmployeeLine
{
    DataClassification = ToBeClassified;
    Caption = 'EmployeeLine';
    Description = 'This Is A Employee Line Table';
    TableType = Normal;



    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; LineNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Basic; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(4; HRA; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; Conveyance; Decimal)
        {
            DataClassification = ToBeClassified;

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