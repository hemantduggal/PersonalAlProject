table 50212 "Posted daily cash"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Document Type"; Text[50])
        {
            DataClassification = ToBeClassified;





        }
        field(2; Postingdate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No';
            // trigger OnValidate()
            // var
            // begin
            //     IF Accountno <> xRec.Accountno THEN BEGIN
            //         recgensetup.GET;
            //         NoSeriesMgt.TestManual(recgensetup."Daily cash");///for this added field in General Ledger Setup
            //         "No. Series" := '';
            //     END;
            // end;
        }



        field(4; Amount; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Bal. Account No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Editable = false;
        }
        field(7; "Account type"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Balance acc Type"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; accno; code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(pk; "Document No")
        {
            Clustered = true;
        }
    }


    var


}