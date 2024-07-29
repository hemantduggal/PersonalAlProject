page 50113 "Requisition List"
{
    ApplicationArea = All;
    Caption = 'Requisition list';
    PageType = List;
    SourceTable = "Purchase req header";
    UsageCategory = Administration;
    CardPageId = "Requisition card";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Vendor_No; Rec.Vendor_No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor_No field.';
                }
                field(Posting_date; Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting_date field.';
                }
            }
        }
    }
}
