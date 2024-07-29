page 50040 "Aim Chemistrys"
{
    // ApplicationArea = All;
    Caption = 'Aim Chemistrys';
    PageType = Card;
    SourceTable = "Aim Chemistry header";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("NO."; Rec."NO.")
                {
                    ToolTip = 'Specifies the value of the Aim Chemistry No. field.';
                    ApplicationArea = all;
                }
            }
            part("Aim Chemistry Subform"; "Aim Chemistry Subform")
            {
                ApplicationArea = all;
                UpdatePropagation = Both;
                SubPageLink = "Document No" = FIELD("NO.");
                Visible = true;
            }
        }
    }
}
