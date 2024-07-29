page 50123 "Posted Requisition header"
{
    ApplicationArea = All;
    Caption = 'Posted Requisition list';
    PageType = List;
    SourceTable = "posted Purchase req header";
    UsageCategory = Administration;
    Editable = false;
    CardPageId = "posted Requisition card";
    //SourceTableView = where(Posted = filter(true));

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
                field(Posting_date; Rec.Posting_date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting_date field.';
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Report)
            {
                ApplicationArea = all;
                caption = 'Requisition Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;

                RunObject = report "Requisition Report";
                trigger OnAction()
                var
                begin


                end;
            }
        }
    }
    // trigger OnOpenPage()
    // var
    //     req: record "posted Purchase req header";
    //     salereceivableSetup: Record "Sales & Receivables Setup";

    // begin
    //     req."No." := salereceivableSetup."Posted requisition Header";

    // end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        salereceivableSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        docno: Code[20];

    begin
        // if rec."No." = '' then begin
        //     salereceivableSetup.Get();
        //     salereceivableSetup.TestField("Posted requisition Header");
        //     NoSeriesMgt.InitSeries(salereceivableSetup."Posted requisition Header", xRec."No. Series", docno, Rec."No. Series");//// table ext field
        //     rec."No." := docno;

        // end;
    end;
}
