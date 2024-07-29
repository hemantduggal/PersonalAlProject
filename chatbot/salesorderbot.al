page 50100 salesorderbot
{
    ApplicationArea = all;
    Caption = 'Sales Order Bot';
    UsageCategory = Administration;
    SourceTable = 50020;
    DataCaptionExpression = '';

    layout
    {
        area(Content)
        {
            field(question; question)
            {
                ApplicationArea = all;
                Caption = 'Ask Chatbot';
                trigger OnValidate()
                begin
                    calc(question);
                end;
            }
            repeater(Answer)
            {
                Editable = false;
                field(Answers; Rec.Answers)
                {
                    ApplicationArea = all;
                    trigger OnDrillDown()
                    var
                        recref: RecordRef;
                        salinv: Record "Sales Invoice Header";
                    begin
                        recref := rec.recordid.GetRecord();
                        case recref.Number of
                            Database::"Sales Invoice Header":
                                begin
                                    recref.SetTable(salinv);
                                    page.Run(page::"Posted Sales Invoice", salinv);
                                end;

                        end;
                    end;
                }
            }
        }
    }
    procedure calc(qestn: Text)
    var
        possalinv: Record "Sales Invoice Header";
        lines: Record "Sales Invoice Line";
        query: List of [Text];
        item: text;
        arr: array[12] of Text;
        check: array[12] of Integer;
        year: Integer;
        month: Integer;
        startdate: Date;
        enddate: Date;
        meta: Record 50021;
        i: Integer;
        j: Integer;
    begin
        Clear(check);

        arr[1] := 'highest;largest;biggest;sale;in;month';
        arr[2] := 'highest;largest;biggest;sale;in;year';
        arr[3] := 'minimum;lowest;sale;in;year';
        arr[4] := 'lowest;minimum;sale;in;month';
        arr[5] := 'highest;largest;biggest;sale;in;2021;2022;2023;2024;2025;2020;2019;2018;2017;2016;2015;2014;2013;2012';
        arr[6] := 'lowest;minimum;sale;in;2021;2022;2023;2024;2025;2020;2019;2018;2017;2016;2015;2014;2013;2012';
        arr[7] := 'Top;5;five;sale;in;year';
        arr[8] := 'Top;10;ten;sale;in;year';
        arr[9] := 'Top;5;five;sale;in;2021;2022;2023;2024;2025;2020;2019;2018;2017;2016;2015;2014;2013;2012';
        arr[10] := 'Top;10;ten;sale;in;2021;2022;2023;2024;2025;2020;2019;2018;2017;2016;2015;2014;2013;2012';
        arr[11] := 'Top;5;five;sale;in;month';
        arr[12] := 'Top;10;ten;sale;in;month';
        query := qestn.Split(' ');
        ans.Reset();
        ans.DeleteAll();

        foreach item in query do begin
            item := item.ToLower();
            if arr[1].Contains(item) then
                check[1] += 1;
            if arr[2].Contains(item) then
                check[2] += 1;
            if arr[3].Contains(item) then
                check[3] += 1;
            if arr[4].Contains(item) then
                check[4] += 1;
            if arr[5].Contains(item) then
                check[5] += 1;
            if arr[6].Contains(item) then
                check[6] += 1;
            if arr[7].Contains(item) then
                check[7] += 1;
            if arr[8].Contains(item) then
                check[8] += 1;
            if arr[9].Contains(item) then
                check[9] += 1;
            if arr[10].Contains(item) then
                check[10] += 1;
            if arr[11].Contains(item) then
                check[11] += 1;
            if arr[12].Contains(item) then
                check[12] += 1;
        end;
        meta.DeleteAll();
        for i := 1 to 12 do begin
            meta.Init();
            meta.check := 'check' + format(i);
            meta."no. of check" := check[i];
            meta.Insert();
        end;
        meta.Reset();
        meta.SetView('sorting ("no. of check")');
        meta.SetFilter("no. of check", '>%1', 2);
        if meta.FindLast() then begin


            //>>>>>'highest;largest;biggest;sale;in;month';
            if meta.check = 'check1' then begin
                year := Date2DMY(Today, 3);
                month := Date2DMY(Today, 2);
                possalinv.Reset();
                startdate := DMY2Date(01, month, year);
                if month = 2 then
                    enddate := DMY2Date(29, month, year)
                else
                    enddate := DMY2Date(31, month, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindLast() then begin
                    ans.Reset();
                    ans.DeleteAll();
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Highest sale this month was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end else begin
                    ans.Reset();
                    ans.DeleteAll();
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'highest;largest;biggest;sale;in;year';
            if meta.check = 'check2' then begin
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindLast() then begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Highest sale this year was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'minimum;lowest;sale;in;year';
            if (meta.check = 'check3') then begin
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.Findfirst() then begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Lowest sale this year was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end
                else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'lowest;minimum;sale;in;month';

            if meta.check = 'check4' then begin
                year := Date2DMY(Today, 3);
                month := Date2DMY(Today, 2);
                possalinv.Reset();
                startdate := DMY2Date(01, month, year);
                if month = 2 then
                    enddate := DMY2Date(29, month, year)
                else
                    enddate := DMY2Date(31, month, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindLast() then begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Lowest  sale this month was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'highest;largest;biggest;sale;in;2021;2022;2023;2024;
            if (meta.check = 'check5') then begin
                Clear(i);
                year := 2027;
                for i := 0 to 23 do begin
                    if qestn.Contains(format(year - i)) then begin
                        year := year - i;
                    end;
                end;
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindLast() then begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Highest sale in ' + format(year) + ' year was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end
                else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'lowest;minimum;sale;in;2021;2022;2023;2024;
            if (meta.check = 'check6') then begin
                Clear(i);
                year := 2027;
                for i := 0 to 23 do begin
                    if qestn.Contains(format(year - i)) then begin
                        year := year - i;
                    end;
                end;
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.Findfirst() then begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Lowest sale in ' + format(year) + ' year was of ' + Format(possalinv.Amount) + ' which was invoice on ' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                    ans.recordid := possalinv.RecordId;
                    ans.Insert();
                end
                else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;
            //>>'Top;5;sale;in;year'

            if (meta.check = 'check7') then begin
                Clear(j);
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 6 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this year ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'Top;10;sale;in;year'

            if (meta.check = 'check8') then begin
                Clear(j);
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 11 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this year ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'Top;5;sale;in;2021;2022;
            if (meta.check = 'check9') then begin
                Clear(i);
                year := 2027;
                for i := 0 to 23 do begin
                    if qestn.Contains(format(year - i)) then begin
                        year := year - i;
                    end;
                end;
                Clear(j);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 6 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this year ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            //>>'Top;5;sale;in;2021;2022;
            if (meta.check = 'check10') then begin
                Clear(i);
                year := 2027;
                for i := 0 to 23 do begin
                    if qestn.Contains(format(year - i)) then begin
                        year := year - i;
                    end;
                end;
                Clear(j);
                possalinv.Reset();
                startdate := DMY2Date(01, 01, year);
                enddate := DMY2Date(31, 12, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 11 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this year ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;

            ///>>'Top;5;sale;in;month';
            if (meta.check = 'check11') then begin
                Clear(j);
                month := Date2DMY(Today, 2);
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, month, year);
                if month = 2 then
                    enddate := DMY2Date(29, month, year)
                else
                    enddate := DMY2Date(31, month, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 6 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this month ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;

            end;

            // >>'Top;10;sale;in;month';
            if (meta.check = 'check11') then begin
                Clear(j);
                month := Date2DMY(Today, 2);
                year := Date2DMY(Today, 3);
                possalinv.Reset();
                startdate := DMY2Date(01, month, year);
                if month = 2 then
                    enddate := DMY2Date(29, month, year)
                else
                    enddate := DMY2Date(31, month, year);
                possalinv.SetView(StrSubstNo('sorting (Amount) order(descending) where("Posting Date" = filter(%1..%2))', startdate, enddate));
                if possalinv.FindFirst() then begin
                    repeat
                        j += 1;
                        if j < 11 then begin
                            ans.Init();
                            ans.lineno := j * 10000;
                            ans.Answers := 'Top ' + Format(j) + ' Sale of this month ' + Format(possalinv.Amount) + ' which was invoice on' + Format(possalinv."Posting Date") + ' with document no. ' + possalinv."No.";
                            ans.recordid := possalinv.RecordId;
                            ans.Insert();
                        end;
                    until (possalinv.Next() = 0);
                end else begin
                    ans.Init();
                    ans.lineno := 10000;
                    ans.Answers := 'Data not Found';
                    ans.Insert();
                end;
            end;
        end else begin
            ans.Reset();
            ans.DeleteAll();
            ans.Init();
            ans.lineno := 10000;
            ans.Answers := 'We are not having any answers for this question at this moment. Try asking more clearly';
            ans.Insert();
        end;
    end;

    trigger OnOpenPage()
    var
        meta: Record checkmeta;
        ans: Record 50020;
    begin
        meta.DeleteAll();
        ans.DeleteAll();
        CurrPage.Caption := 'Sales Order ChatBot';
    end;

    var
        question: Text;
        ans: Record 50020;
}