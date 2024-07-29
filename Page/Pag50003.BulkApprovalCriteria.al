page 50003 "Bulk Approval Criteria"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria';
    PageType = List;
    SourceTable = "Bulk Approval Criteria ";
    UsageCategory = Lists;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Criteria ID"; Rec."Criteria ID")
                {
                    ToolTip = 'Specifies the value of the Criteria ID field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ToolTip = 'Specifies the value of the Item Category field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Price From"; Rec."Price From")
                {
                    ToolTip = 'Specifies the value of the Price From field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Price To"; Rec."Price To")
                {
                    ToolTip = 'Specifies the value of the Price To field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Volume Threshold"; Rec."Volume Threshold")
                {
                    ToolTip = 'Specifies the value of the Volume Threshold field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
