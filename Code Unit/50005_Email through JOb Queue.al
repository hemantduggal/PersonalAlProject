codeunit 50005 "Hemant Email Items"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        if Rec."Parameter String" = '' then
            Error('Parameters are required for this job queue.\ Format -  <Date Formula>:<Email To>:<Email CC> \* Email CC is Optional');
        DecryptParameters(Rec."Parameter String");
        EmailItems();
    end;

    local procedure EmailItems()
    var
        TempEmailItem: Record "Email Item" temporary;
    begin
        TempEmailItem."Send to" := EmailReceipnt;
        if EmailCCTo <> '' then
            TempEmailItem."Send CC" := EmailCCTo;
        TempEmailItem.Subject := 'Sales order report';
        TempEmailItem."Plaintext Formatted" := true;
        TempEmailItem.SetBodyText('Hi Team, <br> Please find attached Sales order Report.');
        AddReportPDF(TempEmailItem);
        TempEmailItem.Send(true, Enum::"Email Scenario"::Default);
    end;

    local procedure AddReportPDF(var TempEmailItem: Record "Email Item" temporary)
    var
        SDHItems: Report 50126;
        TempBlob: Codeunit "Temp Blob";
        reportinstream: InStream;
        reportoutstream: OutStream;
    begin
        TempBlob.CreateOutStream(reportoutstream);
        TempBlob.CreateInStream(reportinstream);
        SDHItems.SaveAs('', ReportFormat::Pdf, reportoutstream);
        TempEmailItem.AddAttachment(reportinstream, 'Sales order report.pdf');
    end;

    local procedure DecryptParameters(ParameterString: Text[250])
    var
        MailManagement: Codeunit "Mail Management";
        SplittedParameters: List of [Text];
    begin
        SplittedParameters := ParameterString.Split(':');

        if not Evaluate(DateCalcForumla, SplittedParameters.Get(1)) then
            Error('First Parameter Should be a Date Formula');

        if SplittedParameters.Get(2, EmailReceipnt) then
            MailManagement.CheckValidEmailAddress(EmailReceipnt)
        else
            Error('Second Parameter Should be a Email of Receipnt.');

        if SplittedParameters.Get(3, EmailCCTo) then
            if EmailCCTo <> '' then
                MailManagement.CheckValidEmailAddress(EmailCCTo);
    end;

    var
        DateCalcForumla: DateFormula;
        EmailReceipnt: Text[80];
        EmailCCTo: Text[80];
}