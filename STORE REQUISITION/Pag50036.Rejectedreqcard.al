page 50036 "Rejected req card"
{

    Caption = 'Rejected req card';
    PageType = Card;
    SourceTable = storereqheader;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("NO."; Rec."NO.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the NO. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("document date"; Rec."document date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the document date field.';
                }
                field(status; Rec.status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the status field.';
                }
                field(storelocation; Rec.storelocation)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the storelocation field.';
                }
                field("Required Location"; Rec."Required Location")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Required Location field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field(Shortcutdim1; Rec.Shortcutdim1)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Shortcutdim1 field.';
                }
                field(Shortcutdim2; Rec.Shortcutdim2)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Shortcutdim2 field.';
                }
                field("1stapprover"; Rec."1stapprover")
                {
                    ApplicationArea = all;
                }
                field("2ndapprover"; Rec."2ndapprover")
                {
                    ApplicationArea = all;
                }
                field(ApproverComment; Rec.ApproverComment)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ApproverComment field.';
                    Editable = false;
                }
                field("2ApproverComment"; Rec."2ApproverComment")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ApproverComment field.';
                    Editable = false;
                }
                field(Approvaldate; Rec.Approvaldate)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Approvaldate field.';
                }
                field(status1; Rec.status1)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the status1 field.';
                }
            }
            part(subform; "Rejected req subform")
            {
                Visible = true;
                ApplicationArea = all;
                UpdatePropagation = Both;
                SubPageLink = "DocumentNo." = FIELD("NO.");
            }
        }
    }
}
