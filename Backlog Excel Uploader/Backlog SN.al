table 50069 BAcklogSn
{
    DataClassification = ToBeClassified;
    caption = 'Backlog-SN';

    fields
    {

        field(1; Shiptocode; code[50])
        {
            DataClassification = ToBeClassified;
            caption = 'Ship-to-code';
        }
        field(2; Sono; Code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'So No.';

        }
        field(3; "item No"; code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(4; iteminsertdate; Date)
        {
            DataClassification = ToBeClassified;
            caption = 'Item Insert Date';

        }
        field(6; "PO No"; code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Commercial Product"; code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(8; RD; Date)
        {
            DataClassification = Tobeclassified;
        }

        field(9; CD; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(10; EDD; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(11; "Open QTy"; Decimal)
        {
            DataClassification = Tobeclassified;

        }
        field(12; "Backlog Price"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(13; Value; Decimal)
        {
            DataClassification = Tobeclassified;

        }

        field(14; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }



    }

    keys
    {
        key(pk; "Entry No")
        {
            Clustered = true;
        }
    }


    var

}