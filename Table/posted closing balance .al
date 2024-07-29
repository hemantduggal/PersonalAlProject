table 50203 "PostedClosing Statementheader"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Total amount"; Decimal)
        {
            // DataClassification = ToBeClassified;
            // AutoFormatType = 1;
            CalcFormula = sum("Closing Bal StatementLine".Amount where(documentno = field(Accountno)));
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;



        }
        field(2; Postingdate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Accountno; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No';
            trigger OnValidate()
            var
            begin
                IF Accountno <> xRec.Accountno THEN BEGIN
                    recgensetup.GET;
                    NoSeriesMgt.TestManual(recgensetup."Daily cash");///for this added field in General Ledger Setup
                    "No. Series" := '';
                END;
            end;
        }
        field(6; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Editable = false;
        }


        field(4; Amount; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Bal. Account No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Acc; code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'Account';
        }
        field(8; docno; code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(pk; Accountno)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if Accountno = '' then begin
            inventorySetup.Get();
            inventorySetup.TestField("Daily cash");
            NoSeriesMgt.InitSeries(inventorySetup."Daily cash", xRec."No. Series", 0D, "Accountno", "No. Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recgensetup: Record "General Ledger Setup";
        inventorySetup: Record "General Ledger Setup";



}