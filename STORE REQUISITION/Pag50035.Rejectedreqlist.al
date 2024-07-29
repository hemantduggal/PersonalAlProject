page 50035 "Rejected req list"
{
    ApplicationArea = All;
    Caption = 'Rejected req list';
    PageType = List;
    SourceTable = storereqheader;
    UsageCategory = Lists;
    CardPageId = "Rejected req card";
    SourceTableView = where(status = const(Rejected));
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("NO."; Rec."NO.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the NO. field.';
                }
                field(status; Rec.status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the status field.';
                }
            }
        }
    }
}
