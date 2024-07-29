page 50022 "Packing List"
{
    ApplicationArea = All;
    Caption = 'Packing List';
    PageType = List;
    SourceTable = "Packing header";
    UsageCategory = Lists;
    CardPageID = "Packing Details";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Applicationarea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';

                    Applicationarea = All;
                }
                field("Customer PO Ref"; Rec."Customer PO Ref")
                {
                    ToolTip = 'Specifies the value of the Customer PO Ref field.';
                }

            }
        }
    }
}
