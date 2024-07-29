page 50041 "Aim Chemistry Subform"
{
    // ApplicationArea = All;
    // Caption = 'Aim Chemistry Subform';
    Caption = 'Chemical Analysis';
    PageType = ListPart;
    SourceTable = "Aim Chemistry Line";
    AutoSplitKey = true;
    UsageCategory = Documents;
    // MultipleNewLines = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Element; Rec.Element)
                {
                    ApplicationArea = all;
                }
                field("Min Value"; Rec."Min Value")
                {
                    ApplicationArea = all;
                }
                field("Max Value"; Rec."Max Value")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
