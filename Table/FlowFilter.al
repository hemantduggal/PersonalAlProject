/// <summary>
/// Table Empl (ID 50107).
/// </summary>
table 50107 Empl
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry no.';

        }
        field(2; "Customer No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer no.';
            TableRelation = Customer;

        }
        field(3; "Total Revenue"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Total revenue';
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Amount (LCY)" = field("Customer No.")));
            editable = false;

        }

    }


}