page 50042 "Posted Aim Chemistry"
{
    ApplicationArea = All;
    Caption = 'Posted Aim Chemistry';
    PageType = List;
    SourceTable = "Posted Aim Chemistry header";
    UsageCategory = Administration;
    CardPageId = "Posted Aim chemistry Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("NO."; Rec."NO.")
                {
                    ToolTip = 'Specifies the value of the Aim Chemistry No. field.';
                    ApplicationArea = all;
                }
            }
        }
    }
}
