
/// <summary>
/// TableExtension SalesReceivablesSetupExt (ID 50001) extends Record Sales Receivables Setup.
/// </summary>
tableextension 50001 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50200; "Book Nos."; Code[20])
        {
            Caption = 'Book Nos.';
            TableRelation = "No. Series";
        }
        
    }
}