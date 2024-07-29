report 50312 "Sales order Rep"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata "Sales Header" = RIMD;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            var
                Sh: record "Sales Header";

            begin
                sh.Reset();
                if sh.FindSet then
                    repeat
                        Sh.reset;
                        sh.SetRange("No.", sh."No.");
                        sh.SetFilter(sh."No.", '<> %1', '');
                        if sh.FindSet() then
                            repeat
                                sh."Today Date" := Today;
                                sh.Modify(false);
                            until sh.Next = 0;
                    until sh.next = 0;
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

}