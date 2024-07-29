/// <summary>
/// Report Aged_report (ID 50006).
/// </summary>
report 50101 Aged_report
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'MonthWise Aged Payable report1';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\aged_report1.rdl';
    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            column(startdate; startdate)
            {

            }
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(dueDate; dueDate)
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vendor_Name; vendName)// "Vendor Name")
            {

            }
            column(vendName; vendName)
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Amount; Amount)
            {

            }
            column(CurMonthDue; CurMonthDue)
            {

            }
            column(lastmonthdue1; lastmonthdue1)
            {

            }
            column(lastmonthdue2; lastmonthdue2)
            {

            }
            column(lastmonthdue3; lastmonthdue3)
            {

            }
            column(lastmonthdue4; lastmonthdue4)
            {

            }
            column(lastmonthdue5; lastmonthdue5)
            {

            }
            column(lastmonthdue6; lastmonthdue6)
            {

            }
            column(lastmonthdue7; lastmonthdue7)
            {

            }
            column(lastmonthdue8; lastmonthdue8)
            {

            }
            column(lastmonthdue9; lastmonthdue9)
            {

            }
            column(lastmonthdue10; lastmonthdue10)
            {

            }
            column(lastmonthdue11; lastmonthdue11)
            {

            }
            column(Overalldue; Overalldue)
            {

            }
            column(FirstDate1; FirstDate1)
            {

            }
            column(FirtDate2; FirtDate2)
            {

            }
            column(firstdate3; firstdate3)
            {

            }
            column(firstDate4; firstDate4)
            {

            }
            column(firstDate5; firstDate5)
            {

            }
            column(firstDate6; firstDate6)
            {

            }
            column(firstDate7; firstDate7)
            {

            }
            column(firstDate8; firstDate8)
            {

            }
            column(firstDate9; firstDate9)
            {

            }
            column(firstDate10; firstDate10)
            {

            }
            column(firstDate11; firstDate11)
            {

            }
            column(firstDate12; firstDate12)
            {

            }
            trigger OnPreDataItem()
            begin
                SetRange("Due Date", 0D, dueDate);
                //SetRange("Due Date", 0D, startdate);

            end;

            trigger OnAfterGetRecord()
            var
                VLERec: Record "Vendor Ledger Entry";
            begin
                Recvendor.Reset();
                if Recvendor.Get("Vendor No.") then
                    VendName := Recvendor.Name;
                clear(Overalldue);
                Clear(CurMonthDue);
                Clear(FirstDate1);
                Clear(LastDate1);
                LastDate1 := CALCDATE('CM', dueDate);
                FirstDate1 := CALCDATE('-CM', dueDate);

                VLERec.Reset();
                VLERec.SetRange("Due Date", 0D, FirstDate1);
                VLERec.SetRange("Entry No.", "Entry No.");
                if VLERec.FindSet() then
                    repeat
                        Overalldue += "Remaining Amount";
                    until VLERec.Next() = 0;

                VLERec.Reset();
                VLERec.SetRange("Due Date", FirstDate1, LastDate1);
                VLERec.SetRange("Entry No.", "Entry No.");
                if VLERec.FindSet() then
                    repeat
                        CurMonthDue += "Remaining Amount";
                    until VLERec.Next() = 0;

                Clear(FirtDate2);
                Clear(lastmonthdue1);
                if FirstDate1 <> 0D then begin
                    FirtDate2 := CalcDate('<-1M>', FirstDate1);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", FirtDate2, FirstDate1);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue1 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                Clear(firstdate3);
                Clear(lastmonthdue2);
                if FirtDate2 <> 0D then begin
                    firstdate3 := CalcDate('<-1M>', FirtDate2);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstdate3, FirtDate2);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue2 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate4);
                Clear(lastmonthdue3);
                if firstdate3 <> 0D then begin

                    firstdate4 := CalcDate('<-1M>', FirstDate3);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate4, firstdate3);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue3 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;


                clear(firstDate5);
                Clear(lastmonthdue4);
                if firstDate4 <> 0D then begin
                    firstDate5 := CalcDate('<-1M>', firstDate4);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate5, firstDate4);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue4 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;


                clear(firstDate6);
                Clear(lastmonthdue5);
                if firstDate5 <> 0D then begin
                    firstDate6 := CalcDate('<-1M>', firstDate5);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate6, firstDate5);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue5 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;


                clear(firstDate7);
                Clear(lastmonthdue6);
                if firstDate6 <> 0D then begin
                    firstDate7 := CalcDate('<-1M>', firstDate6);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate7, firstDate6);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue6 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate8);
                Clear(lastmonthdue7);
                if firstDate7 <> 0D then begin
                    firstDate8 := CalcDate('<-1M>', firstDate7);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate8, firstDate7);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue7 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate9);
                Clear(lastmonthdue8);
                if firstDate8 <> 0D then begin
                    firstDate9 := CalcDate('<-1M>', firstDate8);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate9, firstDate8);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue8 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate10);
                Clear(lastmonthdue9);
                if firstDate9 <> 0D then begin
                    firstDate10 := CalcDate('<-1M>', firstDate9);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate10, firstDate9);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue9 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate11);
                Clear(lastmonthdue10);
                if firstDate10 <> 0D then begin
                    firstDate11 := CalcDate('<-1M>', firstDate10);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate11, firstDate10);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue10 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;

                clear(firstDate12);
                Clear(lastmonthdue11);
                if firstDate11 <> 0D then begin
                    firstDate12 := CalcDate('<-1M>', firstDate11);
                    VLERec.Reset();
                    VLERec.SetRange("Due Date", firstDate12, firstDate11);
                    VLERec.SetRange("Entry No.", "Entry No.");
                    if VLERec.FindSet() then
                        repeat
                            lastmonthdue11 += "Remaining Amount";
                        until VLERec.Next() = 0;
                end;


















            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(dueDate; dueDate)
                    {
                        ApplicationArea = all;
                    }
                    field(startdate; startdate)
                    {
                        ApplicationArea = all;
                    }
                    field(edms;
                    edms)
                    {
                        Caption = 'Save Document';
                        Editable = false;
                        ApplicationArea = All;

                        trigger OnDrillDown()
                        var
                            FileName: Text[100];
                            //EDMSLin1: DotNet EDMSL;
                            Resp: Text[2999];
                        begin
                            FileName := 'D:\Upload\' + 'Upload' + '.pdf';
                            //REPORT.SaveAsPdf(REPORT::Aged_report, FileName, "Vendor Ledger Entry");
                            // EDMSLin1 := EDMSLin1.EDMSUpload();
                            // Resp := EDMSLin1.UploadFile('1040', '1050', FileName, 'BC200', 'Catering');
                            Message(Resp);
                        end;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {

            }
        }
    }
    trigger OnInitReport()
    begin
        dueDate := System.Today;

    end;

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
    end;

    var
        companyinfo: Record "Company Information";
        dueDate: Date;
        LastDate1: Date;
        FirstDate1: date;
        CurMonthDue: Decimal;
        FirtDate2: date;
        lastmonthdue1: Decimal;
        firstdate3: Date;
        lastmonthdue2: Decimal;
        lastmonthdue3: Decimal;
        lastmonthdue4: decimal;
        lastmonthdue5: Decimal;
        lastmonthdue6: Decimal;
        lastmonthdue7: Decimal;
        lastmonthdue8: Decimal;
        lastmonthdue9: Decimal;
        lastmonthdue10: Decimal;
        lastmonthdue11: Decimal;
        Overalldue: Decimal;
        firstDate4: date;
        firstDate5: Date;
        firstDate6: Date;
        firstDate7: Date;
        firstDate8: Date;
        firstDate9: Date;
        firstDate10: Date;
        firstDate11: Date;
        firstDate12: Date;
        recvendor: record Vendor;
        vendName: text[100];
        edms: Label 'Click to Save';
        startdate: date;

}