report 50020 ComparativeExpenseReport
{
    UsageCategory = Administration;
    Caption = 'Comparative Expense Report';
    ApplicationArea = all;
    ProcessingOnly = true;
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            RequestFilterFields = "No.", "Account Category";
            trigger OnPreDataItem()
            var
            begin

                StartYear := DATE2DMY(StartDate, 3);
                ENdYear := Date2DMY(ENDDate, 3);
                apr := '0104' + Format(StartYear) + '..' + '3004' + Format(StartYear);
                may := '0105' + Format(StartYear) + '..' + '3105' + Format(StartYear);
                jun := '0106' + Format(StartYear) + '..' + '3006' + Format(StartYear);
                jul := '0107' + Format(StartYear) + '..' + '3107' + Format(StartYear);
                aug := '0108' + Format(StartYear) + '..' + '3108' + Format(StartYear);
                sep := '0109' + Format(StartYear) + '..' + '3009' + Format(StartYear);
                oct := '0110' + Format(StartYear) + '..' + '3110' + Format(StartYear);
                nov := '0111' + Format(StartYear) + '..' + '3011' + Format(StartYear);
                dec := '0112' + Format(StartYear) + '..' + '3112' + Format(StartYear);
                jan := '0101' + Format(ENdYear) + '..' + '3101' + Format(ENdYear);
                feb := '0102' + Format(ENdYear) + '..' + '2802' + Format(ENdYear);
                mar := '0103' + Format(ENdYear) + '..' + '3103' + Format(ENdYear);
                // Message('%1', StartYear);
                // Message('%1', ENdYear);

                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('Comparative Expense Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('GL No.', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);//neha
                ExcelBuffer.AddColumn('GL Account Name', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Account Category', FALSE, '', TRUE, FALSE, true, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Apr' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('May' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Jun' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Jul ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Aug ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Sep ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Oct ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Nov ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Dec ' + Format(StartYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                // Evaluate(ENdYear, t2);
                ExcelBuffer.AddColumn('Jan ' + Format(ENdYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn('Feb ' + Format(ENdYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                // ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Mar ' + Format(ENdYear), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                // ExcelBuffer.AddColumn('Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                // ExcelBuffer.AddColumn('Total Qty.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Total Amt.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

            end;

            trigger OnAfterGetRecord()
            var
            begin
                Clear(AprQty);
                Clear(AprAmt);
                Clear(mayQty);
                Clear(mayAmt);
                Clear(junQty);
                Clear(junAmt);
                Clear(julQty);
                Clear(julAmt);
                Clear(augQty);
                Clear(augAmt);
                Clear(sepQty);
                Clear(sepAmt);
                Clear(OctQty);
                Clear(OctAmt);
                Clear(NovQty);
                Clear(NovAmt);
                Clear(DecQty);
                Clear(DecAmt);
                Clear(JanQty);
                Clear(JanAmt);
                Clear(FebQty);
                Clear(FebAmt);
                Clear(MarQty);
                Clear(MarAmt);

                Clear(TotalQty);
                Clear(TotalAmt);

                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn("G/L Account"."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);//neha
                ExcelBuffer.AddColumn("G/L Account".Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("G/L Account"."Account Category", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

                ///For Type = GL Account 

                //  if "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item then begin
                // IF (LineType = LineType::"G/L Account") and (SIH.Type = SIH.Type::"G/L Account") AND (SCM.Type = SCM.Type::"G/L Account") THEN begin
                ///April

                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", apr);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        AprAmt += GLEntry.Amount;
                    // Message('%1', AprAmt);
                    until GLEntry.Next() = 0;

                ExcelBuffer.AddColumn(AprAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///May
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", may);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        mayAmt += GLEntry.Amount;
                    //  Message('%1', mayAmt);
                    until GLEntry.Next() = 0;

                ExcelBuffer.AddColumn(mayAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///June
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", jun);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        junAmt += GLEntry.Amount;
                    // Message('%1', junAmt);
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(junAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///July
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", jul);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        julAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(julAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Aug
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", aug);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        augAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(augAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Sep
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", sep);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        sepAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(sepAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Oct
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", oct);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        OctAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(OctAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Nov
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", nov);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        NovAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(NovAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Dec
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", dec);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        DecAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(DecAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Jan
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", Jan);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        JanAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(JanAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Feb
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", feb);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        FebAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(FebAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Mar
                GLEntry.Reset();
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                GLEntry.SetFilter("Posting Date", mar);
                if GLEntry.FindFirst() then
                    repeat
                        GLEntry.CalcSums(Amount);
                        MarAmt += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                ExcelBuffer.AddColumn(MarAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ///Totals
                TotalQty := AprQty + MayQty + junQty + julQty + augQty + sepQty + OctQty + NovQty + DecQty + JanQty + FebQty + MarQty;
                TotalAmt := AprAmt + mayAmt + junAmt + julAmt + augAmt + sepAmt + OctAmt + NovAmt + DecAmt + JanAmt + FebAmt + MarAmt;
                ExcelBuffer.AddColumn(TotalAmt, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
            end;
            //////linetype: item
        }

    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Options")
                {
                    Caption = 'Options';
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Start Date';
                    }
                    field(ENDDate; ENDDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'END Date';

                        trigger OnValidate()
                        begin

                        end;
                    }
                    /* field(LineType; LineType)
                     {
                         ApplicationArea = Basic, Suite;
                         Caption = 'Type';
                         trigger OnValidate()
                         begin

                         end;
                     }*/
                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin

        ExcelBuffer.DELETEALL

    end;

    trigger OnPostReport()
    begin
        ExcelBuffer.CreateNewBook('Comparative Expense Report');
        ExcelBuffer.WriteSheet('Comparative Expense Report', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(StrSubstNo('Comparative Expense Report', CurrentDateTime, UserId));
        ExcelBuffer.OpenExcel();

    end;

    var
        ExcelBuffer: Record "Excel Buffer";
        StartDate: Date;
        ENDDate: Date;
        Jan: text;
        Feb: text;
        mar: text;
        apr: text;
        may: text;
        jun: text;
        jul: text;
        aug: text;
        sep: text;
        oct: text;
        nov: text;
        dec: text;
        StartYear: Integer;
        ENdYear: Integer;
        SIH: Record "Sales Invoice Line";//113;
        SCM: Record "Sales Cr.Memo Line";
        AprQty: Decimal;
        AprAmt: Decimal;
        mayQty: Decimal;
        mayAmt: Decimal;
        junQty: Decimal;
        junAmt: Decimal;
        julQty: Decimal;
        julAmt: Decimal;
        augQty: Decimal;
        augAmt: Decimal;
        sepQty: Decimal;
        sepAmt: Decimal;
        OctQty: Decimal;
        OctAmt: Decimal;
        NovQty: Decimal;
        NovAmt: Decimal;
        DecQty: Decimal;
        DecAmt: Decimal;
        JanQty: Decimal;
        JanAmt: Decimal;
        FebQty: Decimal;
        FebAmt: Decimal;
        MarQty: Decimal;
        MarAmt: Decimal;
        TotalQty: Decimal;
        TotalAmt: Decimal;
        SIHRec: Record "Sales Invoice Header";
        SCMRec: Record "Sales Cr.Memo Header";
        LineType: enum "Sales Line Type";//Option "G/L Account;Item";
        GLEntry: Record "G/L Entry";
        T1: Text;
        T2: Text;


}