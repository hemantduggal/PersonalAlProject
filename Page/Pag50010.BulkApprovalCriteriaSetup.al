page 50010 "Bulk Approval Criteria Setup"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria Setup';
    PageType = List;
    SourceTable = "Bulk Approval Criteria Setup";
    UsageCategory = Lists;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Approved ID"; Rec."Approved ID")
                {
                    ToolTip = 'Specifies the value of the Approved ID field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
