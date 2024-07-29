page 50043 "Posted Aim chemistry Card"
{
    // ApplicationArea = All;
    // Caption = 'Posted Aim chemistry Card';
    Caption = 'Posted Aim Chemistrys';
    PageType = Card;
    SourceTable = "Posted Aim Chemistry header";
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
            part("Posted Aim Chemistry Subform"; "Posted Aim Chemistry Subform")
            {
                ApplicationArea = all;
                UpdatePropagation = Both;
                SubPageLink = "Document No" = FIELD("NO.");
                Visible = true;
            }
        }
    }
}
