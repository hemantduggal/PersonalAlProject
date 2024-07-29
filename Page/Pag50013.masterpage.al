page 50013 masterpage
{
    ApplicationArea = All;
    Caption = 'masterpage';
    PageType = List;
    SourceTable = mastertable;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec.no)
                {
                    ToolTip = 'Specifies the value of the no field.';
                }
                field(description; Rec.description)
                {
                    ToolTip = 'Specifies the value of the description field.';
                }
                field("Close frequency"; Rec."Close frequency")
                {
                    ToolTip = 'Specifies the value of the Close frequency field.';
                }
            }
        }
    }
}
