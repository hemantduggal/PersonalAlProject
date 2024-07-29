/// <summary>
/// TableExtension postedpurchline (ID 50018) extends Record Purch. Inv. Line.
/// </summary>
tableextension 50019 postedpurchline extends "Purch. Inv. Line"
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
        // Add changes to table fields here
        // field(124; "Index no"; code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(117; Plank_no; Integer)
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(118; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(119; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
        field(120; "Excise Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(121; "Tax Amount"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(122; "Total GST Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(126; "Charges To Vendor"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(125; "Service Tax Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}