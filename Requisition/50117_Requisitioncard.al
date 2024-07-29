page 50117 "Requisition card"
{
    Caption = 'Requisition card';
    PageType = Card;
    SourceTable = "Purchase req header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Requisition Doc No.';
                    ToolTip = 'Specifies the value of the No. field.';
                    Editable = editfield;


                }
                field(Document_Date; Rec."Document Date")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Document_Date field.';
                    Editable = editfield;

                }
                field(Posting_date; Rec."Posting date")
                {
                    ApplicationArea = All;
                    Editable = editfield;
                    ToolTip = 'Specifies the value of the Posting_date field.';

                }
                field("Global Dim 1"; Rec."Global Dim 1")
                {
                    ApplicationArea = all;
                    Editable = editfield;
                }
                field("Global Dim 2"; Rec."Global Dim 2")
                {
                    ApplicationArea = all;
                    Editable = editfield;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                    Editable = editfield;
                }
                field("To Location"; Rec."To Location")
                {
                    ApplicationArea = All;
                    Editable = editfield;
                    ToolTip = 'Specifies the value of the Location_Code field.';
                }
                field(Vendor_No; Rec.Vendor_No)
                {
                    ApplicationArea = All;
                    Editable = editfield;
                    ToolTip = 'Specifies the value of the Vendor_No field.';

                }

                field(status; Rec.status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the status field.';
                    Editable = false;
                }

                field("Production order No."; Rec."Production order No.")
                {
                    ApplicationArea = all;
                    Editable = editfield;
                }
                field("Sale order No."; Rec."Sale order No.")
                {
                    ApplicationArea = all;
                    Editable = editfield;
                }
            }

            part("Requisition Subform"; "Requisition SubForm")
            {
                SubPageLink = "Document No" = FIELD("No.");
                Visible = true;
                // Editable = true;
                Editable = editfield;
                ApplicationArea = all;
                UpdatePropagation = Both;
            }
        }


    }
    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = Suite;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                trigger OnAction()
                var
                begin
                    Rec.Status := Rec.Status::Released;
                    Message('Status Changed to Released');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Re&open';
                Image = ReOpen;
                PromotedCategory = Process;
                Promoted = true;
                PromotedOnly = true;
                ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message('Status Changed to Open');
                end;

            }

        }
    }


    procedure editable()
    begin
        if rec.status = rec.status::Released then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            editfield := false
        else
            editfield := true;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            editfield := false
        else
            editfield := true;
    end;



    var
        editfield: Boolean;
}
