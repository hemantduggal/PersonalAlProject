page 50032 "Approved store req list"
{
    ApplicationArea = All;
    Caption = 'Approved store req list';
    PageType = List;
    SourceTable = storereqheader;
    UsageCategory = Lists;
    CardPageId = "Approved req card";
    SourceTableView = where(status = const(Approved));
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("NO."; Rec."NO.")
                {
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
