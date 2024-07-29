page 50028 "Pending store req card"
{

    Caption = 'Pending store req card';
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
                }
                field("2ApproverComment"; Rec."2ApproverComment")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ApproverComment field.';
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
            part(Subform; "Pending store req subform")
            {
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
                SubPageLink = "DocumentNo." = FIELD("NO.");
                Visible = true;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Approve")
            {
                ApplicationArea = Basic, Suite;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    storer: Record storereqheader;
                    docno: Code[20];
                    reqline: record "Requistion approval entries";
                    storereql: record "Store requisition line";
                begin
                    storer.Reset();
                    storer.SetRange("NO.", docno);
                    storer.status := rec.status::Approved;
                    Rec.Status := Rec.Status::Approved;
                    rec.Approvaldate := Today;
                    Rec.Modify();


                    // reqline.SetRange("Document No.", rec."NO.");
                    // ReqLINE.Init();
                    // // ReqLINE."Document No." := '';
                    // if ReqLINE.Insert(true) then begin
                    //     reqline."Document No." := rec."NO.";
                    //     reqline."Document Date" := rec."document date";
                    //     reqline."Approver ID" := rec."1stapprover";
                    //     reqline."approverid2" := rec."2ndapprover";
                    //     reqline.Status := rec.status1;
                    //     // ReqLINE.TransferFields(Rec, false);
                    //     ReqLINE.Modify();

                    // end;
                    Message('Approved');
                end;
            }
            action("Reject")
            {
                ApplicationArea = Basic, Suite;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    storer: Record storereqheader;
                    docno: Code[20];
                begin
                    storer.Reset();
                    storer.SetRange("NO.", docno);
                    storer.status := rec.status::Rejected;
                    Rec.Status := Rec.Status::Rejected;
                    Rec.Modify();
                    Message('rejected');
                end;
            }
        }
    }
}

