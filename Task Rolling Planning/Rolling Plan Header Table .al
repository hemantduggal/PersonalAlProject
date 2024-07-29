/// <summary>
/// Table EmployeeHeader (ID 50108).
/// </summary>
table 50103 "Rolling Plan Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Rolling Plan Header';
    Description = 'This is A Rolling Plan Header Table';
    TableType = Normal;


    fields
    {
        field(13; Sno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Rolling Plan No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Userid; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; soNO; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Header"."No.";
            trigger OnValidate()
            var
                recsales: record "Sales Header";
            begin
                if xRec.soNO <> Rec.soNO then begin
                    recsales.Reset();
                    if recsales.get(soNO) then begin

                    end;

                end;

            end;


        }
        field(5; Heat_No; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Suffix; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(12; customerNo; code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Sales Header"."Sell-to Customer No.";
            // trigger OnValidate()
            // var
            //     recsales: record "Sales Header";
            // begin
            //     if xRec.customerNo <> Rec.customerNo then begin
            //         recsales.Reset();
            //         if recsales.get(customerNo) then begin

            //         end;

            //     end;

            // end;

        }
        field(11; customerName; text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Sales Header"."Sell-to Customer Name";
            // trigger OnValidate()
            // var
            //     recsales: record "Sales Header";
            // begin
            //     if xRec.customerName <> Rec.customerName then begin
            //         recsales.Reset();
            //         if recsales.get(customerName) then begin

            //         end;

            //     end;

            // end;


        }










    }

    keys
    {
        key(pK; "Rolling Plan No")
        {
            //Clustered = true;
        }
        key(pk2; customerName)
        {
            Clustered = true;
        }
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