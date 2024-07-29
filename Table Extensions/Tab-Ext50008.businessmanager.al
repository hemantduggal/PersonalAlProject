tableextension 50008 "business manager" extends "Activities Cue"
{
    fields
    {
        field(50000; "Approval entry"; integer)
        {
            Caption = 'Approval entry';
            TableRelation = "Approval Entry";
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Document Type" = Filter("Order"),
                                                        Status = FILTER(Open)


            ));
        }
    }
}
