tableextension 50014 "purch receipt header" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50001; Vendorid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Vendortype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }
    }
}
