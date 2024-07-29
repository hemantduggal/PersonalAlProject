page 50101 "Calibration Calender"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CalibrationCalender;
    caption = 'Calibration Calender';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Sr No."; Rec."Sr No.")
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Area"; rec."Area")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Tag No."; rec."Tag No.")
                {
                    ApplicationArea = All;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        mnth: Integer;
                    begin

                        if rec.Frequency = Rec.Frequency::Quaterly then begin
                            mnth := Date2DMY(rec.Startdate, 2);
                            if mnth = 1 then begin
                                rec.Apr := CalcDate('<+3M>', rec.Startdate);
                                rec.Jul := CalcDate('<+6M>', rec.Startdate);
                                rec.Oct := CalcDate('<+9M>', rec.Startdate);
                            end else
                                if mnth = 2 then begin
                                    rec.May := CalcDate('<+3M>', rec.Startdate);
                                    rec.Aug := CalcDate('<+6M>', rec.Startdate);
                                    rec.Nov := CalcDate('<+9M>', rec.Startdate);
                                end else
                                    if mnth = 3 then begin
                                        rec.Jun := CalcDate('<+3M>', rec.Startdate);
                                        rec.Sep := CalcDate('<+6M>', rec.Startdate);
                                        rec.dec := CalcDate('<+9M>', rec.Startdate);
                                    end;


                        end


                        else
                            if rec.Frequency = Rec.Frequency::" " then
                                Clear(rec.Jan);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Feb);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Mar);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Apr);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.May);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Jun);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Jul);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Aug);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Sep);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Oct);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Nov);
                        if rec.Frequency = Rec.Frequency::" " then
                            Clear(rec.Dec);




                        // if rec.Startdate = Expr1 then begin
                        //     Clear(rec.Jan);
                        //     Clear(rec.Feb);
                        //     Clear(rec.Mar);
                        //     //Clear(rec.Apr);
                        //     Clear(rec.May);
                        //     clear(rec.Jun);
                        //     clear(rec.Aug);
                        //     Clear(rec.Sep);
                        //     Clear(rec.Nov);
                        //     Clear(rec.Dec);

                        //     if rec.Startdate = Expr2 then begin
                        //         Clear(rec.Jan);
                        //         Clear(rec.Feb);
                        //         Clear(rec.Mar);
                        //         Clear(rec.Apr);
                        //         //Clear(rec.May);
                        //         clear(rec.Jun);
                        //         clear(rec.Jul);
                        //         Clear(rec.Sep);
                        //         Clear(rec.Oct);
                        //         Clear(rec.Dec);
                        //     end;

                        // if rec.Startdate = expr2 then
                        //     Clear(rec.Jan);
                        // Clear(rec.Feb);
                        // Clear(rec.mar);
                        // Clear(rec.Apr);

                        // Clear(rec.May);
                        // Clear(rec.Jun);

                        // Clear(rec.Aug);
                        // Clear(rec.Sep);

                        // Clear(rec.nov);




                        // if rec.Startdate = expr2 then
                        //     Clear(rec.Feb);
                        // Clear(rec.mar);
                        // Clear(rec.Apr);

                        // if rec.Startdate = expr3 then
                        //     Clear(rec.mar);
                        // Clear(rec.Apr);
                        // Clear(rec.May);

                        // if rec.Startdate = expr4 then
                        //     Clear(rec.Apr);
                        // Clear(rec.May);
                        // Clear(rec.Jun);

                        // if rec.Startdate = expr5 then
                        //     Clear(rec.May);
                        // Clear(rec.Jun);
                        // Clear(rec.Jul);

                        // if rec.Startdate = expr4 then
                        //     Clear(rec.Jun);
                        // Clear(rec.Jul);
                        // Clear(rec.Aug);

                        // if rec.Startdate = expr5 then
                        //     Clear(rec.Jul);
                        // Clear(rec.Aug);
                        // Clear(rec.Sep);

                        // if rec.Startdate = expr6 then
                        //     Clear(rec.Aug);
                        // Clear(rec.Sep);
                        // Clear(rec.Oct);

                        // if rec.Startdate = expr7 then
                        //     Clear(rec.Sep);
                        // Clear(rec.Oct);
                        // Clear(rec.Nov);

                        // if rec.Startdate = expr8 then
                        //     Clear(rec.Oct);
                        // Clear(rec.Nov);
                        // Clear(rec.dec);

                        // if rec.Startdate = expr9 then
                        //     Clear(rec.Nov);
                        // Clear(rec.Dec);
                        // Clear(rec.Jan);

                        // if rec.Startdate = expr10 then
                        //     Clear(rec.dec);
                        // Clear(rec.Jan);
                        // Clear(rec.Feb);

                        // if rec.Startdate = expr11 then
                        //     Clear(rec.Jan);
                        // Clear(rec.Feb);
                        // Clear(rec.mar);

                        // if rec.Startdate = expr12 then
                        //     Clear(rec.Feb);
                        // Clear(rec.Mar);
                        // Clear(rec.Apr);




                    end;
                    //  end;\

                }
                field(Startdate; Rec.Startdate)
                {
                    ApplicationArea = all;
                }
                field(Jan; Rec.Jan)
                {
                    ApplicationArea = all;
                }
                field(Feb; Rec.Feb)
                {
                    ApplicationArea = all;
                }
                field(Mar; Rec.Mar)
                {
                    ApplicationArea = all;
                }
                field(Apr; Rec.Apr)
                {
                    ApplicationArea = all;
                }
                field(May; Rec.May)
                {
                    ApplicationArea = all;
                }
                field(Jun; Rec.Jun)
                {
                    ApplicationArea = all;
                }
                field(Jul; Rec.Jul)
                {
                    ApplicationArea = all;
                }
                field(Aug; Rec.Aug)
                {
                    ApplicationArea = all;
                }
                field(Sep; Rec.Sep)
                {
                    ApplicationArea = all;
                }
                field(Oct; Rec.Oct)
                {
                    ApplicationArea = all;
                }
                field(Nov; Rec.Nov)
                {
                    ApplicationArea = all;
                }
                field(Dec; Rec.Dec)
                {
                    ApplicationArea = all;
                }

                field(Calibration; Rec.Calibration)
                {
                    ApplicationArea = all;
                }

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    var
        Expr1: Date;
        expr2: date;
        Expr3: date;
        expr4: date;
        expr5: date;
        expr6: date;
        expr7: Date;
        expr8: date;
        expr9: date;
        expr10: date;
        expr11: date;
        expr12: date;

}