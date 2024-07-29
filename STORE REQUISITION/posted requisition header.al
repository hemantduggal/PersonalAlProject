table 50121 "posted Purchase req header"
{
    Caption = 'PostedPurchase req header';
    DataClassification = ToBeClassified;



    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GeneralledgSetup.Get();
                    NoSeriesMgt.TestManual(GeneralledgSetup."Posted requisition Header");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; Vendor_No; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = vendor."No.";
            //ValidateTableRelation = false;


            trigger OnValidate()
            var
                recvend: record vendor;
            begin
                if Vendor_No = '' then
                    Error('Enter vendor No');

                if recvend.get(rec.Vendor_No) then
                    //rec.vendor_no := rec.vendor_no;
                rec.vendor_name := recvend.Name;
                rec.vend_address := recvend."address";
                rec.location_code := recvend."Location Code";

                Rec.Modify();




            end;


        }
        field(4; Location_Code; Code[20])
        {
            DataClassification = ToBeClassified;
            //tablerelation = location;
            // editable = false;

        }
        field(5; vendor_name; Text[100])
        {
            DataClassification = ToBeClassified;


        }
        field(6; vend_address; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Document_Date; Date)
        {
            DataClassification = ToBeClassified;


        }
        field(8; Posting_date; Date)
        {
            DataClassification = ToBeClassified;

        }


        field(7; status; option)
        {
            DataClassification = ToBeClassified;
            optionmembers = "",Open,Released;
        }
        field(10; "Reference No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; rf; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Userid; Code[20])
        {
            DataClassification = ToBeClassified;
        }



    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            GeneralledgSetup.Get();
            GeneralledgSetup.TestField("Posted requisition Header");
            NoSeriesMgt.InitSeries(GeneralledgSetup."Posted requisition Header", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        myInt: Integer;
        GeneralledgSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

