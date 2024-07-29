table 50201 "Closing Bal StatementLine"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Denomination"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Count; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(5; lineno; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; documentno; code[20])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            // begin
            //     IF documentno <> xRec.documentno THEN BEGIN
            //         recgensetup.GET;
            //         NoSeriesMgt.TestManual(recgensetup."Daily cash");///for this added field in General Ledger Setup
            //         "No. Series" := '';
            //     END;

            // end;
        }
        // field(7; "No. Series"; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "No. Series";
        // }


    }

    keys
    {
        key(pk; documentno, lineno)
        {
            Clustered = true;
        }
    }
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recgensetup: Record "General Ledger Setup";



}