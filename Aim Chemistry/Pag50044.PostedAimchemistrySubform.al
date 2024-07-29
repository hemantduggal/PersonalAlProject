page 50044 "Posted Aim chemistry Subform"
{
    // ApplicationArea = All;
    // Caption = 'Posted Aim chemistry Subform';
    caption = 'Chemical Analysis';
    PageType = ListPart;
    SourceTable = "Posted Aim Chemistry line";
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
