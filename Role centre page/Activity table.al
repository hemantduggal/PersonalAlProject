table 50015 "Activities table"
{
    Caption = 'Activities Table Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }

        field(4; "Ongoing Sales Invoices"; Integer)
        {
            CalcFormula = Count("Sales Header"
                          where("Document Type" = filter(Invoice)));
            FieldClass = FlowField;
        }
        field(5; "Ongoing Purchase Invoices"; Integer)
        {
            CalcFormula = Count("Purchase Header"
                          where("Document Type" = filter(Invoice)));
            FieldClass = FlowField;
        }
        field(6; "Sales This Month"; Decimal)
        {
        }
        field(7; "Top 10 Customer Sales YTD"; Decimal)
        {
        }

        field(11; "Ongoing Sales Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header"
                          where("Document Type" = filter(Quote)));
            FieldClass = FlowField;
        }
        field(12; "Sales quotes"; code[20])
        {

        }
        field(13; "Sales Orders"; code[20])
        {

        }
        field(14; "Sales Invoices"; code[20])
        {

        }
        field(15; "Purchase order"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Order)));
        }
       
    }
    var
        ac: page "Accountant Role Center";
}