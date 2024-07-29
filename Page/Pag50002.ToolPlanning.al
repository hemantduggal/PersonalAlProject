page 50002 "Tool Planning"
{
    ApplicationArea = All;
    Caption = 'Tool Planning';
    PageType = List;
    SourceTable = "Tool Planning";
    UsageCategory = Administration;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Workstation No."; Rec."Workstation No.")
                {
                    ToolTip = 'Specifies the value of the Workstation No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Dye No."; Rec."Dye No.")
                {

                    ApplicationArea = all;
                    Caption = 'Spare No.';
                    ToolTip = 'Specifies the value of the Dye No. field.', Comment = '%';
                }
                field("Lifetime Capacity"; Rec."Lifetime Capacity")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Lifetime Capacity field.', Comment = '%';
                }
                field("Tracking Qty"; Rec."Tracking Qty")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Tracking Qty field.', Comment = '%';
                }
                field("Remaining Qty"; Rec."Remaining Qty")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Remaining Qty field.', Comment = '%';
                }
                field("Alert Capacity"; Rec."Alert Capacity")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Alert Capacity field.', Comment = '%';
                }
            }
        }
    }
}
