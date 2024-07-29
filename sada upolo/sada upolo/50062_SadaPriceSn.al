table 50062 SadapricelistSn
{
    DataClassification = ToBeClassified;
    caption = 'Sada Price list-SN';

    fields
    {

        field(1; ProductBU; Text[100])
        {
            DataClassification = ToBeClassified;
            caption = 'Product Bu';
        }
        field(2; ProductBUCode; Code[50])
        {
            DataClassification = ToBeClassified;
            caption = 'Product Bu Code';

        }
        field(3; Productgroup; Option)
        {
            DataClassification = ToBeClassified;
            caption = 'Product Group';
            OptionMembers = "",AMS,ADG,MDG;
        }
        field(4; ProductGroupCode; text[100])
        {
            DataClassification = ToBeClassified;
            caption = 'Product Group Code';

        }
        field(6; MPN; code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Name; code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(8; Customer; code[100])
        {
            DataClassification = Tobeclassified;
        }

        field(9; "End Customer"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(10; "Debit Number"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(11; RegNo; code[50])
        {
            DataClassification = Tobeclassified;
            caption = 'Reg Number';
        }
        field(12; "E2 Contract Nr"; code[50])
        {
            DataClassification = Tobeclassified;
        }
        field(13; DebitStatus; Option)
        {
            DataClassification = Tobeclassified;
            OptionMembers = "",Authorized,Closed;
        }
        field(14; "Item Start Date"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(15; "Item Expiry Date"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(16; "Reg Item Exp Date"; Date)
        {
            DataClassification = Tobeclassified;
        }
        field(17; "Reg item Status"; Option)
        {
            DataClassification = Tobeclassified;
            OptionMembers = " ",Approved,Cancelled;
        }
        field(18; Currency; Code[20])
        {
            DataClassification = Tobeclassified;

        }
        field(19; "Debit Item Num"; Integer)
        {
            DataClassification = Tobeclassified;
        }
        field(20; "Debit Req Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(21; "Debit Ship Qty"; Decimal)
        {
            DataClassification = Tobeclassified;
        }
        field(22; "Debit Open Qty"; Decimal)
        {
            DataClassification = Tobeclassified;

        }
        field(23; "Adj. Cost"; Decimal)
        {
            DataClassification = Tobeclassified;
            DecimalPlaces = 0 : 5;
        }
        field(24; "Adj. Resale"; Decimal)
        {
            DataClassification = Tobeclassified;
            DecimalPlaces = 0 : 5;
        }
        field(25; "DBC"; Decimal)
        {
            DataClassification = Tobeclassified;
            DecimalPlaces = 0 : 5;
        }
        field(26; "Debit Open Qty Percentage"; Code[20])
        {
            DataClassification = Tobeclassified;
        }
        field(27; "Is MQ"; Option)
        {
            DataClassification = Tobeclassified;
            OptionMembers = "",Yes,No;
        }
        field(28; DistiShiptoname; text[100])
        {
            DataClassification = ToBeClassified;
            caption = 'Disti Ship To Name';

        }
        field(29; "Customer City"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Customer State"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Customer Zip"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Customer Country"; code[20])
        {
            DataClassification = ToBeClassified;
        }


        field(33; "End Customer City"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "End Customer State"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "End Customer Zip"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "End Customer Country"; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(37; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        // field(38; uploadtype; Option)
        // {
        //     DataClassification = ToBeClassified;
        //     OptionMembers = "",SN,HN;

        // }


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