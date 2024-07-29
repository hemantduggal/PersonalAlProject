page 50015 "Activities p"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Activities table";
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            cuegroup(Control54)
            {
                CueGroupLayout = Wide;
                ShowCaption = false;
                field("Purchase order"; Rec."Purchase order")
                {
                    ApplicationArea = all;
                    DrillDownPageId = 9307;
                }
                // field("Purchase Pending For Approval"; Rec."Purchase Pending For Approval")
                // {
                //     ApplicationArea = all;
                //     DrillDownPageId = "Purchase Order";
                //     trigger OnDrillDown()
                //     begin
                //         page.Run(page::"Purchase Order");
                //     end;
                // }
            }
            cuegroup("Ongoing Purchases")
            {
                Caption = 'Ongoing Purchases';
                field("Purchase Orders"; Rec."Purchase order")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies purchases orders that are not posted or only partially posted.';
                }
                field("Ongoing Purchase Invoices"; Rec."Ongoing Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Purchase Invoices";
                    ToolTip = 'Specifies purchases invoices that are not posted or only partially posted.';
                }
                // field("Purch. Invoices Due Next Week"; Rec."Purch. Invoices Due Next Week")
                // {
                //     ApplicationArea = Basic, Suite;
                //     ToolTip = 'Specifies the number of payments to vendors that are due next week.';
                // }
            }
            cuegroup("Sales Ongoing")
            {

                field("Sales Quotes"; rec."Sales quotes")
                {
                    Caption = 'Sales Quotes';
                    ApplicationArea = all;
                    DrillDownPageID = "Sales Quotes";
                }
                field("Sales Orders"; rec."Sales Orders")
                {
                    Caption = 'Sales Orders';
                    ApplicationArea = all;
                    DrillDownPageID = "Sales Order List";

                }
                field("Sales Invoices"; rec."Sales Invoices")
                {
                    Caption = 'Sales Invoices';
                    ApplicationArea = all;
                    DrillDownPageID = "Sales Invoice List";
                }
            }
        }
    }
    //end;
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
            Commit();
        end;
    end;
}