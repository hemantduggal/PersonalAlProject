tableextension 50015 "purch receipt line" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = ToBeClassified;
        }
        field(50001; "Size (in cm)"; Decimal)
        {
            Caption = 'Size (in cm)';
            DataClassification = ToBeClassified;
        }
    }
}
