/// <summary>
/// PageExtension SalesReceivablesSetupPageExt (ID 50200) extends Record Sales  Receivables Setup.
/// </summary>
pageextension 50200 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Book Nos."; Rec."Book Nos.")
            {
                Caption = 'Book Nos.';
                ApplicationArea = All;
            }
        }
    }
}