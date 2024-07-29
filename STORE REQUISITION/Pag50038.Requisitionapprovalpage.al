page 50038 "Requisition approval page"
{
    ApplicationArea = All;
    Caption = 'Requisition approval page';
    PageType = List;
    SourceTable = "Requistion approval entries";
    UsageCategory = Lists;
    Editable = false;
    SourceTableView = where(status = filter(open | "2nd approval pending"));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }
                field(approverid2; Rec.approverid2)
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }

                field(Status; Rec.Status)
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Amount; Rec.Amount)
                {
                    applicationarea = all;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Open Document")
            {
                ApplicationArea = Basic, Suite;
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var

                    str: Record storereqheader;
                begin
                    if str.Get(rec."Document No.") then
                        page.run(50033, str);
                end;
            }

        }
    }
    trigger OnOpenPage()
    var
        userset: record "User Setup";
    begin
        if userset.Get(UserId) then
            if userset."1st approver" = false then
                if userset."2nd approver" = false then
                    Error('You do not have permission to Open the page');
    end;
}