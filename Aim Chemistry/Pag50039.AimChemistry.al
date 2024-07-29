page 50039 "Aim Chemistry"
{
    ApplicationArea = All;
    Caption = 'Aim Chemistry';
    PageType = List;
    SourceTable = "Aim Chemistry header";
    UsageCategory = Administration;
    CardPageId = "Aim Chemistrys";
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
