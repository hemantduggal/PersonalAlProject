report 50019 "Bulk Approval Criteria"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            CalcFields = Amount;
            DataItemTableView = where(Status = filter(open), Amount = filter('<>0'));
            trigger OnAfterGetRecord()
            begin
                apprval("Purchase Header");  
            end;
        }
    }

    local procedure apprval(var Rec: Record "Purchase Header")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
            ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
    end;
}
