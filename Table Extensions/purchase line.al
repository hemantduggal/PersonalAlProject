/// <summary>
/// TableExtension purchline (ID 50020) extends Record Purchase Line.
/// </summary>
tableextension 50020 purchline extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        // field(125; "Index no"; code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(126; Plank_no; Integer)
        // {
        //     DataClassification = ToBeClassified;
        // }
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
        field(127; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(128; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
        field(50003; "Requisition No."; Code[20])
        {
            TableRelation = "Purchase req header";
        }
    }

    var
        myInt: Integer;
}