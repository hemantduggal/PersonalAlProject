/// <summary>
/// PageExtension postedpurch (ID 500017) extends Record Posted Purch. Invoice Subform.
/// </summary>
pageextension 50017 postedpurch extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Job No.")
        {
            field(Weight; Rec.Weight)
            {
                ApplicationArea = all;
            }
            field("Size (in cm)"; Rec."Size (in cm)")
            {
                ApplicationArea = all;
            }


            // field("Index no"; Rec."Index no")
            // {
            //     ApplicationArea = all;

            // }
            // field(Plank_no; Rec.Plank_no)
            // {

            //     ApplicationArea = all;

            // }
            field("Currency Capacity"; Rec."Currency Capacity")
            {
                ApplicationArea = all;

            }
            field("unit od specification"; Rec."unit od specification")
            {
                ApplicationArea = all;

            } // Add changes to page layout here
            field("Excise Amount"; Rec."Excise Amount")
            {
                ApplicationArea = all;
            }
            field("Tax Amount"; Rec."Tax Amount")
            {
                ApplicationArea = all;
            }
            field("Total GST Amount"; Rec."Total GST Amount")
            {
                ApplicationArea = all;
            }
            field("Charges To Vendor"; Rec."Charges To Vendor")
            {
                ApplicationArea = all;
            }
            field("Service Tax Amount"; Rec."Service Tax Amount")
            {
                ApplicationArea = all;
            }
        }
    }



    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}