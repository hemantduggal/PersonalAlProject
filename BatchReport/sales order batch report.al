/// <summary>
/// Report Sales order batch report (ID 50000).
/// </summary>
report 50005 "Sales order batch report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    caption = 'S-Batch report';
    Permissions = tabledata "Sales Invoice Line" = RIMD;
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            var
                SL: record "Sales Invoice Line";
                sh: Record "Sales Invoice Header";
            begin
                sh.Reset();
                if sh.FindSet then
                    repeat
                        sl.reset;
                        sl.SetRange(sl."Document No.", sh."No.");
                        sl.SetFilter(sl."No.", '<> %1', '');
                        if sl.FindSet() then
                            repeat
                                sl."External Doc no" := sh."External Document No.";
                                sl.Modify(false);
                            until sl.Next = 0;
                    until sh.next = 0;
                // Message('total of document no is updated : ,%1', "Sales Invoice Header"."External Document No.");
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(options)
                {
                    caption = 'options';
                    field(ExternalDocToApply; ExternalDocToApply)
                    {
                        ApplicationArea = All;
                        Caption = ' External doc to Apply ';
                        ToolTip = 'specify the no';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = all;
                        Caption = 'replace existing?';
                        ToolTip = 'replace?';
                    }
                    field(locationToApply; locationToApply)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnPostReport()
    var
    begin
        Message('updated');
    end;

    var
        ExternalDocToApply: Code[35];
        ReplaceExisting: Boolean;
        counter: Integer;
        locationToApply: text;
}