table 50014 "Packing header"
{
    Caption = 'Packing header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = Tobeclassified;

            trigger OnValidate()
            var
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    PurchSetup.GET;
                    NoSeriesMgt.TestManual(PurchSetup."Packing Nos");
                    NoSeriesMgt.SetSeries("No.");
                    "No. Series" := '';
                END;
            end;
        }

        field(28; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Invoice Header"."No.";
            trigger OnValidate()
            var
                sil: Record "Sales Invoice Line";
                Sih: Record "Sales Invoice Header";
                PackLine: Record "Packing Line";
                lineNo: Integer;
                cust: Record Customer;

            begin


                if Sih.Get("Document No.") then
                    Date := Sih."Posting Date";
                // "Customer PO Ref" := Sih."Customer PO No.";//uncomm
                // "Delivery Destination" := Sih."Final Destination";//uncomm
                "Payment Terms" := Sih."Payment Terms Code";
                // "Shipping Terms" := Sih.shipp;//uncomm
                "Bill-to No." := Sih."Bill-to Customer No.";
                "Ship-to No." := Sih."Ship-to Customer";
                "Ship-To Name" := sih."Ship-to Name";

                if cust.get("Bill-to No.") then;
                "Bill-To Name" := cust.Name;
                "Bill-To Address" := cust.Address;
                "Bill-To Address2" := cust."Address 2";
                "Bill-To city" := cust.City;
                "Bill-to Country/Region" := cust."Country/Region Code";
                "bill-to Fax" := cust."Fax No.";
                "Bill-to Phone" := cust."Phone No.";
                "Bill-To Post Code" := cust."Post Code";
                "Bill-To State" := cust."Post Code";


                if cust.get("Ship-to No.") then;
                "ship-To Name" := cust.Name;
                "Ship-To Address" := cust.Address;
                "Ship-To Address2" := cust."Address 2";
                "Ship-To city" := cust.City;
                "Ship-to Country/Region" := cust."Country/Region Code";
                "bill-to Fax" := cust."Fax No.";
                "Ship-to Phone" := cust."Phone No.";
                "Ship-To Post Code" := cust."Post Code";
                "Ship-To State" := cust."Post Code";
                Clear(lineNo);

                PackLine.Reset();
                PackLine.SetRange("Document No.", "Document No.");
                if PackLine.FindLast() then;
                sil.Reset();
                sil.SetRange("Document No.", "Document No.");
                if sil.FindFirst() then begin
                    repeat
                        lineNo := lineNo + 10000;
                        PackLine.Init();
                        PackLine."Document No." := "No.";
                        PackLine."Line No." := lineNo;
                        PackLine.Insert();
                        PackLine."Sale Line Document No." := sil."Document No.";
                        PackLine."Item No." := sil."No.";
                        PackLine.Description := sil.Description;///add produ name des
                        PackLine."Total Qty" := sil.Quantity;
                        PackLine.Modify();

                    until sil.Next() = 0;
                end;

            end;

        }
        field(2; "Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Posting Date';

        }
        field(3; "Customer PO Ref"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Delivery Destination"; text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;

        }
        field(5; "Payment Terms"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms".Code;

        }
        field(6; "Shipping Terms"; text[100])
        {
            DataClassification = ToBeClassified;


        }

        field(7; "Bill-To Name"; Text[100])
        {
            DataClassification = ToBeClassified;


        }
        field(8; "Bill-To Address"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Bill-To Address2"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Bill-To city"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Bill-To State"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Bill-To Post Code"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Bill-to Country/Region"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(14; "Bill-to Phone"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; "bill-to Fax"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(16; "Ship-To Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(17; "Ship-To Address"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(18; "Ship-To Address2"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Ship-To city"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(20; "Ship-To State"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Ship-To Post Code"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(22; "Ship-to Country/Region"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(23; "Ship-to Phone"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(24; "Ship-to Fax"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(25; "Bill-to No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                cust: Record Customer;
            begin
                if cust.get("Bill-to No.") then;
                "Bill-To Name" := cust.Name;
                "Bill-To Address" := cust.Address;
                "Bill-To Address2" := cust."Address 2";
                "Bill-To city" := cust.City;
                "Bill-to Country/Region" := cust."Country/Region Code";
                "bill-to Fax" := cust."Fax No.";
                "Bill-to Phone" := cust."Phone No.";
                "Bill-To Post Code" := cust."Post Code";
                "Bill-To State" := cust."Post Code";
            end;
        }
        field(26; "Ship-to No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                cust: Record Customer;
            begin

                if cust.get("Ship-to No.") then;
                "ship-To Name" := cust.Name;
                "Ship-To Address" := cust.Address;
                "Ship-To Address2" := cust."Address 2";
                "Ship-To city" := cust.City;
                "Ship-to Country/Region" := cust."Country/Region Code";
                "bill-to Fax" := cust."Fax No.";
                "Ship-to Phone" := cust."Phone No.";
                "Ship-To Post Code" := cust."Post Code";
                "Ship-To State" := cust."Post Code";

            end;
        }
        field(27; "Total CTNS"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(29; "No. Series"; Code[20])
        {
            DataClassification = Tobeclassified;
            TableRelation = "No. Series";
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
    begin

        IF "No." = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("Packing Nos");
            NoSeriesMgt.InitSeries(PurchSetup."Packing Nos", Rec."No. Series", 0D, "No.", "No. Series");
        END;
    end;

    var
        PurchSetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit 396;
}
