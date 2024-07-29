codeunit 50006 Saleorder
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean)
    var
        Cust: Record Customer;
        SLRec: Record "Sales Line";
    begin
        if SalesHeader."Document Type" in [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice] then begin
            if cust.get(SalesHeader."Sell-to Customer No.") then begin
                SalesHeader.CalcFields(Amount);
                SLRec.Reset();
                SLRec.SetRange("Document No.", SalesHeader."No.");
                if SLRec.FindFirst() then
                    cust.CalcFields("Balance (LCY)");
                cust."Remaining Credit Limit" := cust."Credit Limit (LCY)" - cust."Balance (LCY)" - (SalesHeader.Amount);
                //cust."Remaining Credit Limit" := cust."Active Credit limit" - Cust."Balance (LCY)";
                cust.Modify();
            end;
        END
        else
            if SalesHeader."Document Type" in [SalesHeader."Document Type"::"Credit Memo"] then begin
                if cust.get(SalesHeader."Sell-to Customer No.") then begin
                    SalesHeader.CalcFields(Amount);
                    SLRec.Reset();
                    SLRec.SetRange("Document No.", SalesHeader."No.");
                    if SLRec.FindFirst() then
                        cust.CalcFields("Balance (LCY)");
                    cust."Remaining Credit Limit" := cust."Credit Limit (LCY)" + cust."Balance (LCY)" + (SalesHeader.Amount);
                    //cust."Remaining Credit Limit" := cust."Active Credit limit" + Cust."Balance (LCY)";
                    cust.Modify();
                end;
            end;
    end;
}
