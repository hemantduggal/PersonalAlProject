/// <summary>
/// Table Archive Casting PlanningHeader (ID 50322).
/// </summary>
table 50322 "Archive Casting PlanningHeader"
{
    DataClassification = ToBeClassified;
    Caption = 'Archive Casting Planning Header';
    Description = 'This is A Archive Casting Planning Header Table';
    TableType = Normal;


    fields
    {
        field(13; Sno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Casting Plan No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     SL: record "Archive Casting PlanningLine";
            // begin
            //     sl.Reset();

            //     sl.SetRange("Casting Plan No", "Casting Plan No");

            //     if sl.FindSet() then
            //         sl."Casting Plan No" := rec."Casting Plan No";

            //     sl.Modify();
            //     rec.Modify();


            // end;

        }
        field(2; "Casting Plan Date"; Date)
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

        field(12; customerNo; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                recsales: record Customer;
            begin
                if xRec.customerNo <> Rec.customerNo then begin
                    recsales.Reset();
                    if recsales.get(customerNo) then begin
                        rec.customerName := recsales.Name;

                    end;

                end;

            end;

        }
        field(11; customerName; text[50])
        {
            DataClassification = ToBeClassified;


        }










    }

    keys
    {
        key(pK; "Casting Plan No")
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