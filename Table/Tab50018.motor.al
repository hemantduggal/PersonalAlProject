table 50018 "Motar Checklist"
{
    Caption = 'Motar Checklist';
    DataClassification = ToBeClassified;

    fields
    {
        field(2; "S.No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     NoSeriesMgt: Codeunit NoSeriesManagement;
            // begin
            //     IF "S.No" <> xRec."S.No" THEN BEGIN
            //         invsetup.GET;
            //         NoSeriesMgt.TestManual(invsetup.);
            //         NoSeriesMgt.SetSeries("S.No");
            //         "No. Series" := '';

            //     END;
            // end;
        }
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Area"; Code[20])
        {
            Caption = 'Area';
            DataClassification = ToBeClassified;
            // OptionMembers = ,EAF,LRF,VD,CCM,"LT Room","EOT Crane";
            //    TableRelation = "Mech. Area Master";
        }
        field(5; "Equpiment"; Text[300])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(6; "TEMPERATURE (°C)DE"; text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "TEMPERATURE (°C)NDE"; text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "TEMPERATURE (°C)BODY"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "CURRENT(AMPS)LOAD"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "CURRENT(AMPS)NO LOAD"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "VIBRATION(MM/SEC)DE"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "VIBRATION (MM/SEC)NDE"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Remarks"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "employee name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(15; "No. Series"; Code[10])
        {
            DataClassification = Tobeclassified;
            TableRelation = "No. Series";
        }
        field(16; dOC; CODE[20])
        {
            DataClassification = Tobeclassified;
        }

    }
    keys
    {
        key(Pk; "Line No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }

    trigger OnInsert()
    var
        UserSetRec: Record "User Setup";
    begin

        // IF "S.No" = '' THEN BEGIN
        //     invsetup.GET;
        //     invsetup.TESTFIELD("Sales RFQ Nos");
        //     NoSeriesMgt.InitSeries(invsetup."Sales RFQ Nos", Rec."No. Series", 0D, "S.no", "No. Series");
        // END;
    end;

    var
        invsetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit 396;
}
