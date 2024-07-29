
page 50209 "Daily Cash WORKSHEET Page"
{
    ApplicationArea = Basic, Suite;
    AutoSplitKey = true;
    Caption = 'Daily Cash WORKSHEET';
    // DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    UsageCategory = Tasks;
    PromotedActionCategories = 'New,Process,Report,Bank,Application,Payroll,Approve,Page,Post/Print,Line,Account';
    SourceTable = "Gen. Journal Line";


    layout
    {
        area(Content)
        {
            group(Control120)
            {
                ShowCaption = false;
                // field(CurrentJnlBatchName; CurrentJnlBatchName)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Batch Name';
                //     Lookup = true;
                //     ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the journal is based on.';

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         CurrPage.SaveRecord();
                //         ItemJnlMgt.LookupName(CurrentJnlBatchName, rec);

                //         CurrPage.Update(false);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                //         CurrentJnlBatchNameOnAfterVali();
                //     end;

                field("Current Jnl Batch Name"; CurrentJnlBatchName)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Batch Name';
                    Lookup = true;
                    ToolTip = 'Specifies the name of the journal batch.';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CurrPage.SaveRecord();
                        GenJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                        SetControlAppearanceFromBatch();
                        // Set simple view when batch is changed
                        SetDataForSimpleModeOnBatchChange();
                        CurrPage.Update(false);
                    end;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                        CurrentJnlBatchNameOnAfterVali();
                        SetDataForSimpleModeOnBatchChange();
                    end;
                }
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Posting Date"; Rec."Posting Date")
                { ApplicationArea = all; }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    // TableRelation = "Closing Bal Statementheader".Accountno;
                    // trigger OnValidate()
                    // var
                    //     cl: record "Closing Bal Statementheader";
                    // begin
                    //     if cl.Get(rec."Document No.") then begin


                    //         cl.CalcFields("Total amount");
                    //         rec.Amount := cl."Total amount";
                    //     end;


                    // end;


                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    Editable = false;
                    //TableRelation = "Closing Bal Statementheader";
                    // TableRelation = "Closing Bal Statementheader".Accountno;
                    trigger OnValidate()
                    var
                        cl: record "Closing Bal Statementheader";
                    begin
                        if cl.Get(rec."Document No.") then begin


                            cl.CalcFields("Total amount");
                            rec.Amount := cl."Total amount";
                        end;


                    end;

                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = all;

                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = all;

                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Cash Statement")
            {
                // RunPageLink = Accountno = field("Document No.");
                // RunObject = page "Closing Balnce CARD PAGE";
                Promoted = true;
                // RunPageMode = Create;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    day: Record "Closing Bal Statementheader";
                    day2: Record "Closing Bal Statementheader";
                    day1: Record "Closing Bal Statementheader";
                    line: Record "Closing Bal StatementLine";
                    pag: page "Closing Balnce CARD PAGE";


                begin

                    day.Reset();
                    day.SetRange(Accountno, rec."Document No.");//////set range and set filter both are same but set range is applying a simple filter and set filter is a filter what we specify

                    if day.FindFirst() then begin
                        pag.SetTableView(day);
                        pag.RunModal();
                    end
                    else begin
                        day2.Init();
                        day2.Accountno := rec."Document No.";

                        day2.Postingdate := rec."Posting Date";
                        //Message(rec."Document No.");
                        if day2.Insert(true) then begin
                            line.Init();
                            line.documentno := rec."Document No.";
                            line.lineno := 10000;
                            line.Denomination := 1;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 20000;
                            line.Denomination := 2;
                            line.Insert(true);
                            day1.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 30000;
                            line.Denomination := 5;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 40000;
                            line.Denomination := 10;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 50000;
                            line.Denomination := 20;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 60000;
                            line.Denomination := 50;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 70000;
                            line.Denomination := 100;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 80000;
                            line.Denomination := 200;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 90000;
                            line.Denomination := 500;
                            line.Insert(true);
                            line.Reset();
                            line.documentno := rec."Document No.";
                            line.lineno := 100000;
                            line.Denomination := 2000;
                            line.Insert(true);
                            line.Reset();

                            Commit();

                            day1.SetRange(Accountno, rec."Document No.");
                            pag.SetTableView(day1);
                            pag.RunModal();
                        end;

                    end;
                end;
            }
        }
        area(navigation)
        {
            group("Post/Print")
            {

                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic, Suite;

                    Caption = 'Post';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                    trigger OnAction()
                    var
                        day: Record "Closing Bal Statementheader";
                        genjnlline: Record "Gen. Journal Line";
                    begin
                        genjnlline.Reset();
                        genjnlline.SetRange("Journal Template Name", rec."Journal Template Name");
                        genjnlline.SetRange("Journal Batch Name", rec."Journal Batch Name");
                        if genjnlline.FindFirst() then
                            repeat
                                day.Reset();
                                day.SetRange(Accountno, genjnlline."Document No.");
                                if day.FindFirst() then begin
                                    day.Posted := true;
                                    day.Modify();
                                end;
                            until genjnlline.Next() = 0;
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Rec);
                        CurrentJnlBatchName := rec.GetRangeMax("Journal Batch Name");
                        if IsSimplePage then
                            if GeneralLedgerSetup."Post with Job Queue" then
                                NewDocumentNo()
                            else
                                SetDataForSimpleModeOnPost();
                        SetJobQueueVisibility();



                        CurrPage.Update(false);
                    end;
                }

                action(Preview)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Preview Posting';
                    Image = ViewPostedOrder;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ShortCutKey = 'Ctrl+Alt+F9';
                    ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';

                    trigger OnAction()
                    var
                        GenJnlPost: Codeunit "Gen. Jnl.-Post";
                    begin
                        GenJnlPost.Preview(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        ClientTypeManagement: Codeunit "Client Type Management";
    begin
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        if ClientTypeManagement.GetCurrentClientType() <> ClientType::ODataV4 then
            UpdateBalance();
        // EnableApplyEntriesAction();
        //SetControlAppearance();
        // PostedFromSimplePage is set to TRUE when 'POST' / 'POST+PRINT' action is executed in simple page mode.
        // It gets set to FALSE when OnNewRecord is called in the simple mode.
        // After posting we try to find the first record and filter on its document number
        // Executing LoaddataFromRecord for incomingDocAttachFactbox is also forcing this (PAG39) page to update
        // and for some reason after posting this page doesn't refresh with the filter set by POST / POST-PRINT action in simple mode.
        // To resolve this only call LoaddataFromRecord if PostedFromSimplePage is FALSE.
        // if not PostedFromSimplePage then
        //     CurrPage.IncomingDocAttachFactBox.Page.LoadDataFromRecord(Rec);
        SetJobQueueVisibility();
    end;

    trigger OnAfterGetRecord()
    begin
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        // ShowShortcutDimCode(ShortcutDimCode);
        HasIncomingDocument := rec."Incoming Document Entry No." <> 0;
        //CurrPage.rec.IncomingDocAttachFactBox.Page.SetCurrentRecordID(RecordId());
        //SetUserInteractions();
        NarrationText := VoucherFunctions.ShowOldNarration(Rec);
        //  ShowOldNarration();
    end;

    trigger OnInit()
    var
        ClientTypeManagementL: Codeunit "Client Type Management";
    begin
        TotalBalanceVisible := true;
        BalanceVisible := true;
        AmountVisible := true;
        // Get simple / classic mode for this page except when called from a webservices (SOAP or ODATA)
        if ClientTypeManagementL.GetCurrentClientType() in [ClientType::SOAP, ClientType::OData, ClientType::ODataV4]
        then
            IsSimplePage := false
        else
            IsSimplePage := GenJnlManagement.GetJournalSimplePageModePreference(Page::"Cash Receipt Voucher");

        GeneralLedgerSetup.Get();
        SetJobQueueVisibility();
    end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     CurrPage.IncomingDocAttachFactBox.Page.SetCurrentRecordID(RecordId());
    // end;

    trigger OnModifyRecord(): Boolean
    begin
        //SetUserInteractions();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateBalance();
        //EnableApplyEntriesAction();
        // SetUpNewLine(xRec, Balance, BelowxRec);
        // set values from header for currency code, doc no. and posting date
        // for show less columns or simple page mode
        if IsSimplePage then begin
            PostedFromSimplePage := false;
            SetDataForSimpleModeOnNewRecord();
        end;
        Clear(ShortcutDimCode);
        Clear(AccName);
        //SetUserInteractions();
    end;

    trigger OnOpenPage()
    var
        ServerSetting: Codeunit "Server Setting";
        EnvironmentInfo: Codeunit "Environment Information";
        ClientTypeManagement: Codeunit "Client Type Management";
        JnlSelected: Boolean;
        LastGenJnlBatch: Code[10];
        VoucherEnum: Enum "Gen. Journal Template Type";
    begin
        NarrationText := '';
        IsSaasExcelAddinEnabled := ServerSetting.GetIsSaasExcelAddinEnabled();
        if ClientTypeManagement.GetCurrentClientType() = ClientType::ODataV4 then
            exit;

        BalAccName := '';
        SetControlVisibility();
        SetDimensionVisibility();
        if rec.IsOpenedFromBatch() then begin
            CurrentJnlBatchName := rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            SetControlAppearanceFromBatch();
            SetDataForSimpleModeOnOpen();
            exit;
        end;
        VoucherFunctions.VoucherTemplateSelection(Page::"Cash Receipt Voucher", VoucherEnum::"Cash Receipt Voucher", false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');

        LastGenJnlBatch := GenJnlManagement.GetLastViewedJournalBatchName(Page::"Cash Receipt Voucher");
        if LastGenJnlBatch <> '' then
            CurrentJnlBatchName := LastGenJnlBatch;
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
        SetControlAppearanceFromBatch();

        IsSaaS := EnvironmentInfo.IsSaaS();
        SetDataForSimpleModeOnOpen();
        NarrationText := '';
    end;


    var

        postbool: Boolean;
        vend: page "Vendor List";
        GeneralLedgerSetup: Record "General Ledger Setup";
        GenJnlManagement: Codeunit GenJnlManagement;
        VoucherFunctions: Codeunit "Voucher Functions";
        CurrentJnlBatchName: Code[10];
        AccName: Text[100];
        BalAccName: Text[100];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        HasIncomingDocument: Boolean;
        ApplyEntriesActionEnabled: Boolean;
        [InDataSet]


        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;
        StyleTxt: Text;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesOnJnlBatchExist: Boolean;
        OpenApprovalEntriesOnJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
        ShowWorkflowStatusOnBatch: Boolean;
        ShowWorkflowStatusOnLine: Boolean;
        CanCancelApprovalForJnlBatch: Boolean;
        CanCancelApprovalForJnlLine: Boolean;
        IsSaasExcelAddinEnabled: Boolean;
        CanRequestFlowApprovalForBatch: Boolean;
        CanRequestFlowApprovalForBatchAndAllLines: Boolean;
        CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
        CanCancelFlowApprovalForBatch: Boolean;
        CanCancelFlowApprovalForLine: Boolean;
        AmountVisible: Boolean;
        DebitCreditVisible: Boolean;
        IsSaaS: Boolean;
        IsSimplePage: Boolean;
        JobQueuesUsed: Boolean;
        JobQueueVisible: Boolean;
        CurrentDocNo: Code[20];
        CurrentPostingDate: Date;
        CurrentCurrencyCode: Code[10];
        IsChangingDocNo: Boolean;
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;
        PostedFromSimplePage: Boolean;
        NarrationText: Text[2000];
        CashReceiptInsertedMsg: Label 'Cash Receipt Voucher lines have been successfully inserted from Standard Cash Receipt Voucher %1.', Comment = '%1 = Standard General Journal.Code';
        GeneralJournalCreatedMsg: Label 'Standard General Journal %1 has been successfully created.', Comment = '%1 = Standard General Journal.Code';
        MissingExchangeRatesQst: Label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';

    // procedure SetUserInteractions()
    // begin
    //     StyleTxt := GetStyle();
    // end;

    procedure NewDocumentNo()
    var
        GenJournalLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LastDocNo: Code[20];
    begin
        if rec.Count() = 0 then
            exit;
        GenJnlBatch.Get(rec."Journal Template Name", CurrentJnlBatchName);
        GenJournalLine.Reset();
        GenJournalLine.SetCurrentKey("Document No.");
        GenJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
        if GenJournalLine.FindLast() then begin
            LastDocNo := GenJournalLine."Document No.";
            rec.IncrementDocumentNo(GenJnlBatch, LastDocNo);
        end else
            LastDocNo := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", rec."Posting Date");

        CurrentDocNo := LastDocNo;
        SetDocumentNumberFilter(CurrentDocNo);
    end;

    local procedure UpdateBalance()
    begin
        GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    // local procedure EnableApplyEntriesAction()
    // begin
    //     ApplyEntriesActionEnabled :=
    //       ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::Employee]) or
    //       ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::Employee]);
    // end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord();
        GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
        SetControlAppearanceFromBatch();
        CurrPage.Update(false);
    end;

    local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "Gen. Journal Line"): Boolean
    begin
        CurrPage.SetSelectionFilter(GenJournalLine);
        exit(GenJournalLine.FindSet());
    end;

    // local procedure SetControlAppearance()
    // var
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
    //     CanRequestFlowApprovalForLine: Boolean;
    // begin
    //     OpenApprovalEntriesExistForCurrUser :=
    //       OpenApprovalEntriesExistForCurrUser or
    //       ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId());

    //     OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId());
    //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist or OpenApprovalEntriesOnJnlLineExist;

    //     ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.Page.SetFilterOnWorkflowRecord(RecordId());

    //     CanCancelApprovalForJnlLine := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId());

    //     // SetPayrollAppearance();
    //     VoucherFunctions.SetPayrollAppearance();

    //     WorkflowWebhookManagement.GetCanRequestAndCanCancel(RecordId(), CanRequestFlowApprovalForLine, CanCancelFlowApprovalForLine);
    //     CanRequestFlowApprovalForBatchAndCurrentLine := CanRequestFlowApprovalForBatch and CanRequestFlowApprovalForLine;
    // end;

    // local procedure IterateDocNumbers(FindTxt: Text; NextNum: Integer)
    // var
    //     GenJournalLine: Record "Gen. Journal Line";
    //     CurrentDocNoWasFound: Boolean;
    //     NoLines: Boolean;
    // begin
    //     if Count() = 0 then
    //         NoLines := true;
    //     GenJournalLine.Reset();
    //     GenJournalLine.SetCurrentKey("Document No.", "Line No.");
    //     GenJournalLine.SetRange("Journal Template Name", "Journal Template Name");
    //     GenJournalLine.SetRange("Journal Batch Name", "Journal Batch Name");
    //     // if GenJournalLine.Find('+') then
    //     if GenJournalLine.Find(FindTxt) then
    //         repeat
    //             if NoLines then begin
    //                 SetDataForSimpleMode(GenJournalLine);
    //                 exit;
    //             end;
    //             // Find the rec for current doc no.
    //             if not CurrentDocNoWasFound and (GenJournalLine."Document No." = CurrentDocNo) then
    //                 CurrentDocNoWasFound := true;
    //             if CurrentDocNoWasFound and (GenJournalLine."Document No." <> CurrentDocNo) then begin
    //                 SetDataForSimpleMode(GenJournalLine);
    //                 exit;
    //             end;
    //         until GenJournalLine.Next(NextNum) = 0;
    // end;

    local procedure SetControlAppearanceFromBatch()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
        CanRequestFlowApprovalForAllLines: Boolean;
    begin
        if (rec."Journal Template Name" <> '') and (rec."Journal Batch Name" <> '') then
            GenJournalBatch.Get(rec."Journal Template Name", rec."Journal Batch Name")
        else
            if not GenJournalBatch.Get(rec.GetRangeMax(rec."Journal Template Name"), CurrentJnlBatchName) then
                exit;

        //ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.Page.SetFilterOnWorkflowRecord(GenJournalBatch.RecordId());
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RecordId());
        OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RecordId());

        OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
          OpenApprovalEntriesOnJnlBatchExist or
          ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries(rec."Journal Template Name", rec."Journal Batch Name");

        CanCancelApprovalForJnlBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RecordId());

        WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(
          GenJournalBatch, CanRequestFlowApprovalForBatch, CanCancelFlowApprovalForBatch, CanRequestFlowApprovalForAllLines);
        CanRequestFlowApprovalForBatchAndAllLines := CanRequestFlowApprovalForBatch and CanRequestFlowApprovalForAllLines;
    end;

    local procedure SetControlVisibility()
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        if IsSimplePage then begin
            AmountVisible := false;
            DebitCreditVisible := true;
        end else begin
            AmountVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Debit/Credit Only");
            DebitCreditVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Amount Only");
        end;
    end;

    local procedure SetDocumentNumberFilter(DocNoToSet: Code[20])
    var
        OriginalFilterGroup: Integer;
    begin
        OriginalFilterGroup := rec.FilterGroup();
        rec.FilterGroup := 25;
        rec.SetFilter("Document No.", DocNoToSet);
        rec.FilterGroup := OriginalFilterGroup;
    end;

    local procedure SetDimensionVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        if not IsSimplePage then
            DimMgt.UseShortcutDims(
              DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);
    end;

    local procedure GetTotalDebitAmt(): Decimal
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        if IsSimplePage then begin
            GenJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
            GenJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
            GenJournalLine.SetRange("Document No.", CurrentDocNo);
            GenJournalLine.CalcSums("Debit Amount");
            exit(GenJournalLine."Debit Amount");
        end
    end;

    local procedure GetTotalCreditAmt(): Decimal
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        if IsSimplePage then begin
            GenJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
            GenJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
            GenJournalLine.SetRange("Document No.", CurrentDocNo);
            GenJournalLine.CalcSums("Credit Amount");
            exit(GenJournalLine."Credit Amount");
        end
    end;

    local procedure SetDataForSimpleMode(GenJournalLine1: Record "Gen. Journal Line")
    begin
        CurrentDocNo := GenJournalLine1."Document No.";
        CurrentPostingDate := GenJournalLine1."Posting Date";
        CurrentCurrencyCode := GenJournalLine1."Currency Code";
        SetDocumentNumberFilter(CurrentDocNo);
    end;

    local procedure SetDataForSimpleModeOnOpen()
    begin
        if IsSimplePage then begin
            // Filter on the first record
            rec.SetCurrentKey("Document No.", "Line No.");
            if rec.FindFirst() then
                SetDataForSimpleMode(Rec)
            else begin
                // if no rec is found reset the currentposting date to workdate and currency code to empty
                CurrentPostingDate := WorkDate();
                Clear(CurrentCurrencyCode);
            end;
        end;
    end;

    local procedure SetDataForSimpleModeOnBatchChange()
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJnlManagement.SetLastViewedJournalBatchName(Page::"Cash Receipt Voucher", CurrentJnlBatchName);
        // Need to set up simple page mode properties on batch change
        if IsSimplePage then begin
            GenJournalLine.Reset();
            GenJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
            GenJournalLine.SetRange("Journal Batch Name", CurrentJnlBatchName);
            IsChangingDocNo := false;
            if GenJournalLine.FindFirst() then
                SetDataForSimpleMode(GenJournalLine);
        end;
    end;

    local procedure SetDataForSimpleModeOnNewRecord()
    begin
        // No lines shown
        if rec.Count() = 0 then
            // If xrec."Document No." is empty that means this is the first entry for a batch
            // In this case we want to assign current doc no. to the document no. of the record
            // But if user changes the doc no. then we want to use whatever value they enter for
            // current doc no.
            if ((xRec."Document No." = '') or (xRec."Journal Batch Name" <> rec."Journal Batch Name")) and (not IsChangingDocNo) then
                CurrentDocNo := rec."Document No."
            else begin
                rec."Document No." := CurrentDocNo;
                // Clear out credit / debit for empty page since these
                // might have been set if suggest balance amount is checked on the batch
                rec.Validate("Credit Amount", 0);
                rec.Validate("Debit Amount", 0);
            end
        else
            rec."Document No." := CurrentDocNo;

        rec."Currency Code" := CurrentCurrencyCode;
        if CurrentPostingDate <> 0D then
            rec.Validate("Posting Date", CurrentPostingDate);
    end;

    local procedure SetDataForSimpleModeOnPropValidation(FiledNumber: Integer)
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        if IsSimplePage and (rec.Count() > 0) then begin
            GenJournalLine.Reset();
            GenJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
            GenJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
            GenJournalLine.SetRange("Document No.", CurrentDocNo);
            if GenJournalLine.Find('-') then
                repeat
                    case FiledNumber of
                        GenJournalLine.FieldNo("Currency Code"):
                            GenJournalLine.Validate("Currency Code", CurrentCurrencyCode);
                        GenJournalLine.FieldNo("Posting Date"):
                            GenJournalLine.Validate("Posting Date", CurrentPostingDate);
                    end;
                    GenJournalLine.Modify();
                until GenJournalLine.Next() = 0;
        end;
        CurrPage.Update(false);
    end;

    local procedure SetDataForSimpleModeOnPost()
    begin
        PostedFromSimplePage := true;
        rec.SetCurrentKey("Document No.", "Line No.");
        if rec.FindFirst() then
            SetDataForSimpleMode(Rec)
    end;

    local procedure UpdateCurrencyFactor(FieldNo: Integer)
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        if CurrentCurrencyCode <> '' then
            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrentPostingDate, CurrentCurrencyCode) then
                SetDataForSimpleModeOnPropValidation(FieldNo)
            else
                if ConfirmManagement.GetResponseOrDefault(
                     StrSubstNo(MissingExchangeRatesQst, CurrentCurrencyCode, CurrentPostingDate), true)
                then begin
                    UpdateCurrencyExchangeRates.OpenExchangeRatesPage(CurrentCurrencyCode);
                    UpdateCurrencyFactor(FieldNo);
                end else begin
                    CurrentCurrencyCode := rec."Currency Code";
                    CurrentPostingDate := rec."Posting Date";
                end
        else
            SetDataForSimpleModeOnPropValidation(FieldNo);
    end;

    local procedure SetJobQueueVisibility()
    begin
        JobQueueVisible := rec."Job Queue Status" = rec."Job Queue Status"::"Scheduled for Posting";
        JobQueuesUsed := GeneralLedgerSetup.JobQueueActive();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        genbatch: Record "Gen. Journal Batch";
        docno: code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recgensetup: Record "General Ledger Setup";
        inventorySetup: Record "General Ledger Setup";
    begin
        // genbatch.get(rec."Journal Template Name", rec."Journal Batch Name");
        // rec.IncrementDocumentNo(genbatch, docno);
        // Message(docno);
        inventorySetup.get();
        NoSeriesMgt.InitSeries(inventorySetup."Daily cash", xRec."No. Series", rec."Posting Date", docno, Rec."No. Series");//// table ext field
        rec."Document No." := docno;

    end;
}