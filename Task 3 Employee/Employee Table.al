/// <summary>
/// Table Employee table (ID 50118).
/// </summary>
table 50120 "Employee Table"
{
    DataClassification = ToBeClassified;
    Caption = 'employee Table';
    Description = 'This is employee table  with various fields in it ';
    TableType = Normal;


    fields
    {
        field(1; EmpCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Emp code';
            Width = 20;
        }
        field(2; FirstName; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(10; LastName; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Department; Option)
        {
            OptionCaption = 'Departments';
            OptionMembers = It,Hr,accounts,sales,marketting;
            DataClassification = ToBeClassified;

        }

        field(4; Address; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Mother Name"; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(6; "Father Name"; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Organization Name"; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(8; Work; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(9; "Company Name"; Text[100])
        {

            FieldClass = FlowField;
            Caption = 'Company Name';
            CalcFormula = lookup(Contact.Name where("No." = field("Company Name")));
            Editable = false;

        }
        field(11; "Parents Name"; Text[100])
        {

            FieldClass = FlowField;
            Caption = 'Parents Name';
            CalcFormula = lookup("Employee Table"."Father Name" where("Father Name" = field("Parents Name")));
            Editable = false;

        }


    }

    keys
    {
        key(Pk; EmpCode)
        {
            Clustered = true;
        }

        key(Sk; Department)
        {

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
        Message('Data Modify');
    end;

    trigger OnDelete()
    begin
        Message('Data Delete');
    end;

    trigger OnRename()
    begin
        Message('Data Renamed');
    end;

}