table 50119 NonSadapricelist
{
    DataClassification = ToBeClassified;
    caption = 'Non Sada Price list';
    fields
    {
        field(1; "Disti Group"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Shipto; Code[50])
        {
            DataClassification = ToBeClassified;
            caption = 'Ship To';
        }
        field(3; "End Customer"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "End Customer BPM"; code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'End Cust BPM';
        }
        field(5; "Sales Unit"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Quote Num"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Item Num"; code[100])
        {
            DataClassification = Tobeclassified;
        }
        field(8; "SGA No"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(9; "Ext Reference"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(10; "Commercial product group code"; Code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(11; "Product Bu"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(12; "Creation Date"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(13; "creation Month"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(14; "SGA Expire"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(15; "Delivery start Date"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(16; "Delivery Stop"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(17; Quoteitemwrkflowstts; Option)
        {
            DataClassification = Tobeclassified;
            Caption = 'Quote Item. Workflow Status';
            OptionMembers = " ",Approved,Cancelled;
        }
        field(18; "Meet Tp"; Text[50])
        {
            DataClassification = Tobeclassified;
        }
        field(19; "Targert Price"; Decimal)
        {
            DataClassification = Tobeclassified;
            DecimalPlaces = 0 : 8;
        }
        field(20; "Approved Price"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(21; "Prisma Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(22; "Start Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
            // DecimalPlaces = 0 : 5;
        }
        field(23; "Used Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
            //DecimalPlaces = 0 : 5;
        }
        field(24; "Remaining Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
            // DecimalPlaces = 0 : 5;
        }
        field(25; "Used Qty Percentage"; Code[20])
        {
            DataClassification = Tobeclassified;
        }
        field(26; "Start Val"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(27; "Used val"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Remaining Val"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Used val %"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Entry No"; Integer)
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