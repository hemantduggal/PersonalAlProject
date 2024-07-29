
/// <summary>
/// Table Student Table (ID 50112).
/// </summary>
table 50112 "Student Header Table"
{
    DataClassification = ToBeClassified;
    Caption = 'This is a sample table';
    TableType = Normal;
    Description = 'This is A Student table Description ';


    fields
    {
        field(1; No; code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Width = 20;

        }
        field(3; Address; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; PhoneNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Pincode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; State; text[20])
        {
            //OptionMembers = Delhi,Haryana,Up,Gujrat,"Andhra-Pradesh","Arunachal Pradesh",Assam,Bihar,Chhattisgarh,Goa;
            DataClassification = ToBeClassified;
        }
        field(7; City; text[20])
        {
            //OptionMembers = Mumbai,chennai,banglore,kolkata,pune,jaipur,ahmedabad,faridabad,okhla,raipur;
            DataClassification = ToBeClassified;

        }
        field(8; "Sales order"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Header"."No.";

            Caption = 'Sales Order';
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                recsales: record "Sales Header";
            begin
                if xRec."Sales order" <> Rec."Sales order" then begin
                    recsales.Reset();
                    if recsales.get("Sales order") then begin

                    end;

                end;

            end;

        }





    }

    keys
    {
        key(Pk; No)
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