page 50033 "Approved req card"
{

    Caption = 'Approved req card';
    PageType = Card;
    SourceTable = storereqheader;
    // Editable = false;

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
                    Editable = false;
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
            part(subform; "Approved req subform")
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
                SubPageLink = "DocumentNo." = FIELD("NO.");

            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(Issue)
            {
                ApplicationArea = Basic, Suite;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    h: record storereqheader;
                    l: Record "Store requisition line";

                begin
                    //NegativeAdjmtPost(h, Rec);
                    l.Reset();
                    l.SetRange("DocumentNo.", rec."NO.");
                    if l.FindFirst() then
                        l.Modify();
                    NegativeAdjmtPost(l, Rec);
                    NegativeAdjmtPostN(l, Rec);
                    Message('Posted In ILE');
                end;
            }
        }
    }
    local procedure NegativeAdjmtPost(sline: Record "Store requisition line"; sheader: Record storereqheader)
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlPostLine: Codeunit 22;
        ItemRec: Record Item;
        itemledg: record "Item Ledger Entry";
    begin

        ItemJnlLine.INIT;
        ItemJnlLine."Document Type" := ItemJnlLine."Document Type"::" ";
        ItemJnlLine."Posting Date" := sheader."document date";
        ItemJnlLine."Document No." := sline."DocumentNo.";
        ItemJnlLine."Document Date" := sheader."document date";
        ItemJnlLine."Document Line No." := sline."Line No";
        ItemJnlLine.userid := sheader."1stapprover";
        ItemJnlLine.userid2 := sheader."2ndapprover";
        // if sheader.storelocation = sheader.storelocation then
        ItemJnlLine."Location Code" := sheader.storelocation;
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        ItemJnlLine."Location Code" := Rec.storelocation;
        // if sheader."Required Location" = sheader."Required Location" then
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Positive Adjmt.";
        ItemJnlLine."Location Code" := sheader."Required Location";
        ItemJnlLine."Location Code" := Rec."Required Location";

        ItemJnlLine."Item No." := sline.No;
        ItemJnlLine.Description := sline.Description;
        // ItemJnlLine."Location Code" := sline."Store Location";
        ItemJnlLine."Shortcut Dimension 1 Code" := sline.Shortcutdim1;
        ItemJnlLine."Shortcut Dimension 2 Code" := sline.Shortcutdim2;
        ItemJnlLine.Quantity := sline."Issue Quantity";
        ItemJnlLine.userid := sline."1stapprover";
        ItemRec.Get(sline.No);
        ItemJnlLine."Gen. Prod. Posting Group" := ItemRec."Gen. Prod. Posting Group";
        ItemJnlLine."Inventory Posting Group" := ItemRec."Inventory Posting Group";
        ItemJnlLine."Invoiced Quantity" := sline."Requested Quantity";
        ItemJnlLine."Quantity (Base)" := sline."Issue Quantity";
        ItemJnlLine."Invoiced Quantity" := sline."Requested Quantity";
        ItemJnlPostLine.RunWithCheck(ItemJnlLine);
    END;


    local procedure NegativeAdjmtPostN(sline: Record "Store requisition line"; sheader: Record storereqheader)
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlPostLine: Codeunit 22;
        ItemRec: Record Item;
        itemledg: record "Item Ledger Entry";
    begin

        ItemJnlLine.INIT;
        itemledg.Init;


        ItemJnlLine."Document Type" := ItemJnlLine."Document Type"::" ";
        ItemJnlLine."Posting Date" := sheader."document date";
        ItemJnlLine."Document No." := sline."DocumentNo.";
        ItemJnlLine."Document Date" := sheader."document date";
        ItemJnlLine."Document Line No." := sline."Line No";
        ItemJnlLine.userid := sheader."1stapprover";
        // if sheader.storelocation = sheader.storelocation then
        // ItemJnlLine."Location Code" := sheader.storelocation;
        // ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        // ItemJnlLine."Location Code" := Rec.storelocation;
        // if sheader."Required Location" = sheader."Required Location" then
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
        ItemJnlLine."Location Code" := sheader.storelocation;
        ItemJnlLine."Location Code" := Rec.storelocation;

        ItemJnlLine."Item No." := sline.No;
        ItemJnlLine.Description := sline.Description;
        itemledg.UseriD := sline."1stapprover";
        ItemJnlLine.userid2 := sheader."2ndapprover";
        // ItemJnlLine."Location Code" := sline."Store Location";
        ItemJnlLine."Shortcut Dimension 1 Code" := sline.Shortcutdim1;
        ItemJnlLine."Shortcut Dimension 2 Code" := sline.Shortcutdim2;
        ItemJnlLine.Quantity := sline."Issue Quantity";
        ItemJnlLine.userid := sline."1stapprover";
        ItemRec.Get(sline.No);
        ItemJnlLine."Gen. Prod. Posting Group" := ItemRec."Gen. Prod. Posting Group";
        ItemJnlLine."Inventory Posting Group" := ItemRec."Inventory Posting Group";
        ItemJnlLine."Invoiced Quantity" := sline."Requested Quantity";
        ItemJnlLine."Quantity (Base)" := sline."Issue Quantity";
        ItemJnlLine."Invoiced Quantity" := sline."Requested Quantity";
        ItemJnlPostLine.RunWithCheck(ItemJnlLine);
    END;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    begin
        rec.Approvaldate := WorkDate();
    end;

    var

}
