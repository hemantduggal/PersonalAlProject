page 50120 "posted Requisition card"
{
    Caption = 'Posted Requisition card';
    PageType = Card;
    SourceTable = "Posted Purchase req header";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Document_Date; Rec.Document_Date)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Document_Date field.';
                }
                field(Vendor_No; Rec.Vendor_No)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Vendor_No field.';
                }
                field(vend_address; Rec.vend_address)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the vend_address field.';
                }
                field(vendor_name; Rec.vendor_name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the vendor_name field.';
                }

                field(Posting_date; Rec.Posting_date)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Posting_date field.';
                }
                field(Userid; Rec.Userid)
                {
                    ApplicationArea = all;
                }


                field(status; Rec.status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the status field.';
                }

            }

            part("Requisition Subform"; "Posted Requisition SubForm")
            {

                SubPageLink = "Document No" = FIELD("No.");
                Visible = true;
                Editable = true;
                ApplicationArea = all;
                UpdatePropagation = Both;

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
                    preqheader: Record "posted Purchase req header";
                    para: text;
                    rep: Report "Requisition Report";
                    sa: Boolean;

                    XmlParameters: Text;
                                 begin

                    preqheader.Reset();
                    preqheader.SetRange("No.", Rec."No.");
                    if preqheader.FindFirst() then
                        //     Run(Report::"Requisition Report");
                        // Report.Run(50115, false, false, preqheader);
                        // end;
                        // sa := rep.isPreview;
                        // para := '<?xml version="1.0" standalone="yes"?><ReportParameters name="Requisition Report" id="50115"><DataItems><DataItem name="posted Purchase req header">VERSION(1) SORTING(Field1) WHERE(Field1=1(%1))</DataItem><DataItem name="PostedPurchreqline">VERSION(1) SORTING(Field1,Field2)</DataItem></DataItems></ReportParameters>';
                        // preqheader.SetRange("No.", rec."No.");

                        Report.RunModal(Report::"Requisition Report", false, false, preqheader);

                    // report.Execute(report::"Requisition Report", StrSubstNo(para, rec."No."));
                end;
            }
        }
    }





}
