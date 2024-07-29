table 50573 "Solar Meter"
{
    Caption = 'Solar Meter';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Serial No."; Integer)
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Reading Meter - 01 (RM1) KVAH"; Decimal)
        {
            Caption = 'Reading Meter - 01 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 01 (RM1) KVAH" > rec."Reading Meter - 01 (RM1) KVAH" then
                        Error('Reading Meter - 01 (RM1) KVAH must be greater then from previous line value');
                calc();
            end;
        }
        field(4; "Reading Meter - 01 (RM1) KWH"; Decimal)
        {
            Caption = 'Reading Meter - 01 (RM1) KWH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 01 (RM1) KWH" > rec."Reading Meter - 01 (RM1) KWH" then
                        Error('Reading Meter - 01 (RM1) KWH must be greater then from previous line value');
                calc();
            end;
        }
        field(5; "Reading Meter - 02 (RM1) KVAH"; Decimal)
        {
            Caption = 'Reading Meter - 02 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 02 (RM1) KVAH" > rec."Reading Meter - 02 (RM1) KVAH" then
                        Error('Reading Meter - 01 (RM1) KWH must be greater then from previous line value');
                calc();
            end;
        }
        field(6; "Reading Meter - 02 (RM1) KWH"; Decimal)
        {
            Caption = 'Reading Meter - 02 (RM1) KWH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 02 (RM1) KWH" > rec."Reading Meter - 02 (RM1) KWH" then
                        Error('Reading Meter - 01 (RM1) KWH must be greater then from previous line value');
                calc();
            end;
        }
        field(7; "Reading Meter - 03 (RM1) KVAH"; Decimal)
        {
            Caption = 'Reading Meter - 03 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 03 (RM1) KVAH" > rec."Reading Meter - 03 (RM1) KVAH" then
                        Error('Reading Meter - 03 (RM1) KVAH must be greater then from previous line value');
                calc();
            end;
        }
        field(8; "Reading  Meter - 03 (RM1) KWH	"; Decimal)
        {
            Caption = 'Reading  Meter - 03 (RM1) KWH';
            DecimalPlaces = 0 : 9;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading  Meter - 03 (RM1) KWH	" > rec."Reading  Meter - 03 (RM1) KWH	" then
                        Error('Reading Meter - 03 (RM1) KWH must be greater then from previous line value');
                calc();
            end;
        }
        // field(9; "Reading Meter 04 (O2 Plant) KVAH"; Decimal)
        // {
        //     Caption = 'Reading Meter - 04 (O2 Plant) KVAH	';
        //     trigger OnValidate()
        //     begin
        //         calc();
        //     end;
        // }
        // field(10; "Reading Meter 04 (O2 Plant) KWH"; Decimal)
        // {
        //     Caption = 'Reading Meter - 04 (O2 Plant) KWH';
        //     trigger OnValidate()
        //     begin
        //         calc();
        //     end;
        // }
        field(11; "Reading Meter-04(O2 Plant)KVAH"; Decimal)
        {
            Caption = 'Reading Meter - 04 (O2 Plant) KVAH';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 9;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter-04(O2 Plant)KVAH" > rec."Reading Meter-04(O2 Plant)KVAH" then
                        Error('Reading Meter - 04 (O2 Plant) KVAH must be greater then from previous line value');
                calc();
            end;
        }
        field(12; "Reading Meter-04(O2 Plant)KWH"; Decimal)
        {
            Caption = 'Reading Meter - 04 (O2 Plant) KWH';
            DecimalPlaces = 0 : 9;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter-04(O2 Plant)KWH" > rec."Reading Meter-04(O2 Plant)KWH" then
                        Error('Reading Meter - 04 (O2 Plant) KVAH must be greater then from previous line value');
                calc();
            end;
        }
        field(13; "Reading Meter-06(B.Bar)KVAH"; Decimal)
        {
            Caption = 'Reading Meter - 06 (B.Bar) KVAH';
            DecimalPlaces = 0 : 9;
            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter-06(B.Bar)KVAH" > rec."Reading Meter-06(B.Bar)KVAH" then
                        Error('Reading Meter - 06 (B.Bar) KVAH must be greater then from previous line value');
                calc();
            end;
        }
        field(14; "Reading Meter - 06 (B.Bar) KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'Reading Meter - 06 (B.Bar) KWH';

            trigger OnValidate()
            var
                SOlarMeter: Record "Solar Meter";
            begin
                SOlarMeter.Reset();
                SOlarMeter.SetRange("Serial No.", Rec."Serial No." - 10000);
                if SOlarMeter.FindLast() then
                    if SOlarMeter."Reading Meter - 06 (B.Bar) KWH" > rec."Reading Meter - 06 (B.Bar) KWH" then
                        Error('Reading Meter - 06 (B.Bar) KWH must be greater then from previous line value');
                calc();
            end;
        }
        field(15; "GEN. TODAY Meter-01(RM1)KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 01 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(16; "GEN. TODAY Meter-01(RM1)KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 01 (RM1) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(17; "GEN. TODAY Meter-02(RM1)KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 02 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(18; "GEN. TODAY Meter-02(RM1)KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 02 (RM1) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(19; "GEN. TODAY Meter-03(RM1)KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 03 (RM1) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(20; "GEN. TODAY Meter-03(RM1)KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 03 (RM1) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(21; "GEN.TODAYMeter-04(O2Plant)KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 04 (O2 Plant) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(22; "GEN.TODAYMeter-04(O2 Plant)KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 04 (O2 Plant) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(23; "GEN. TODAY Meter-05 (NSY) KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 05 (NSY) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(24; "GEN. TODAY Meter- 05 (NSY) KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 05 (NSY) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(25; "GEN. TODAY Meter-06(B.Bar)KVAH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 06 (B.Bar) KVAH';
            DecimalPlaces = 0 : 9;
        }
        field(26; "GEN. TODAY Meter-06(B.Bar)KWH"; Decimal)
        {
            Caption = 'GENARATION TODAY Meter - 06 (B.Bar) KWH';
            DecimalPlaces = 0 : 9;
        }
        field(27; "GEN. TODATE Meter-01(RM1)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 01 (RM1) KVAH';
        }
        field(28; "GEN. TODATE Meter-01(RM1)KWh"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 01 (RM1) KWh';
        }
        field(29; "GEN. TODATE Meter-02(RM1)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 02 (RM1) KVAH';
        }
        field(30; "GEN. TODATE Meter-02(RM1)KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 02 (RM1) KWH';
        }
        field(31; "GEN. TODATE Meter-03(RM1)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 03 (RM1) KVAH';
        }
        field(32; "GEN. TODATE Meter -03(RM1)KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 03 (RM1)	KWH';
        }
        field(33; "GENTODATEMeter-04(O2Plant)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 04 (O2 Plant) KVAH';
        }
        field(34; "GEN.TODATEMeter-04(O2Plant)KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 04 (O2 Plant) KWH';
        }
        field(35; "GEN. TODATE Meter-05(NSY)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 05 (NSY) KVAH';
        }
        field(36; "GEN. TODATE Meter-05(NSY)KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 05 (NSY) KWH';
        }
        field(37; "GEN.TODATE Meter-06(B.Bar)KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 06 (B.Bar)	KVAH';
        }
        field(38; "GEN. TODATE Meter-06(B.Bar)KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'GENARATION TODATE Meter - 06 (B.Bar) KWH	';
        }
        field(39; "PF TODATE Meter - 01 (RM1)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 01 (RM1)';
        }
        field(40; "PF TODATE Meter - 02 (RM1)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 02 (RM1)';
        }
        field(41; "PF TODATE Meter - 03 (RM1)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 03 (RM1)';
        }
        field(42; "PF TODATE Meter-04(O2 Plant)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 04 (O2 Plant)';
        }
        field(43; "PF TODATE Meter - 05 (NSY)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 05 (NSY)';
        }
        field(44; "PF TODATE Meter - 06 (B.Bar)"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'PF TODATE Meter - 06 (B.Bar)';
        }
        field(45; "Total GEN. Todate	KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'Total Genaration Todate	KVAH';
        }
        field(46; "Total GEN. Todate	KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'Total Genaration Todate	KWH';
        }
        field(47; "Total GEN. Today KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'Total Genaration Today KVAH';
        }
        field(48; "Total GEN. Today KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'Total Genaration Today KWH';
        }
        field(49; "RM Gen. Total GEN. Today	KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'RM Generation Total Genaration Today	KVAH';
        }
        field(50; "RM Gen. Total GEN. Today	KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            Caption = 'RM Generation Total Genaration Today	KWH';
        }
        field(51; "Reading Meter - 05 (NSY) KVAH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            // Caption = 'Reading Meter - 04 (O2 Plant) KVAH';
            trigger OnValidate()
            begin
                calc();
            end;
        }
        field(52; "Reading Meter - 05 (NSY) KWH"; Decimal)
        {
            DecimalPlaces = 0 : 9;
            // Caption = 'Reading Meter - 04 (O2 Plant) KWH';
            trigger OnValidate()
            begin
                calc();
            end;
        }
        field(53; preview; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Serial No.")
        {
            Clustered = true;
        }
    }
    procedure calc()
    var
        solar: Record "Solar Meter";
        firsline: Record "Solar Meter";
    begin
        solar.Reset();
        solar.SetRange("Serial No.", Rec."Serial No." - 10000);
        if solar.FindFirst() then;

        firsline.Reset();
        firsline.SetRange("Serial No.", 10000);
        if firsline.FindFirst() then;

        if Rec."Serial No." > 10000 then begin
            Rec."GEN. TODATE Meter-01(RM1)KVAH" := (Rec."Reading Meter - 01 (RM1) KVAH" - firsline."Reading Meter - 01 (RM1) KVAH") * 8;
            Rec."GEN. TODATE Meter-01(RM1)KWH" := (Rec."Reading Meter - 01 (RM1) KWH" - firsline."Reading Meter - 01 (RM1) KWH") * 8;
            Rec."GEN. TODATE Meter-02(RM1)KVAH" := (Rec."Reading Meter - 02 (RM1) KVAH" - firsline."Reading Meter - 02 (RM1) KVAH") * 8;
            Rec."GEN. TODATE Meter-02(RM1)KWH" := (Rec."Reading Meter - 02 (RM1) KWH" - firsline."Reading Meter - 02 (RM1) KWH") * 8;
            Rec."GEN. TODATE Meter-03(RM1)KVAH" := (Rec."Reading Meter - 03 (RM1) KVAH" - firsline."Reading Meter - 03 (RM1) KVAH") * 8;
            Rec."GEN. TODATE Meter -03(RM1)KWH" := (Rec."Reading  Meter - 03 (RM1) KWH	" - firsline."Reading  Meter - 03 (RM1) KWH	") * 8;
            Rec."GEN.TODATEMeter-04(O2Plant)KWH" := (Rec."Reading Meter-04(O2 Plant)KVAH" - firsline."Reading Meter-04(O2 Plant)KVAH") * 8;
            Rec."GEN.TODATEMeter-04(O2Plant)KWH" := (Rec."Reading Meter-04(O2 Plant)KWH" - firsline."Reading Meter-04(O2 Plant)KWH") * 8;
            Rec."GEN. TODATE Meter-05(NSY)KVAH" := (Rec."Reading Meter - 05 (NSY) KVAH" - firsline."Reading Meter - 05 (NSY) KVAH") * 8;
            Rec."GEN. TODATE Meter-05(NSY)KWH" := (Rec."Reading Meter - 05 (NSY) KWH" - firsline."Reading Meter - 05 (NSY) KWH") * 8;
            Rec."GEN.TODATE Meter-06(B.Bar)KVAH" := (Rec."Reading Meter-06(B.Bar)KVAH" - firsline."Reading Meter-06(B.Bar)KVAH") * 8;
            Rec."GEN. TODATE Meter-06(B.Bar)KWH" := (Rec."Reading Meter - 06 (B.Bar) KWH" - firsline."Reading Meter - 06 (B.Bar) KWH") * 8;

            Rec."GEN. Today Meter-01(RM1)KVAH" := (Rec."Reading Meter - 01 (RM1) KVAH" - solar."Reading Meter - 01 (RM1) KVAH") * 8;
            Rec."GEN. TODAY Meter-01(RM1)KWH" := (Rec."Reading Meter - 01 (RM1) KWH" - solar."Reading Meter - 01 (RM1) KWH") * 8;
            Rec."GEN. TODAY Meter-02(RM1)KVAH" := (Rec."Reading Meter - 02 (RM1) KVAH" - solar."Reading Meter - 02 (RM1) KVAH") * 8;
            Rec."GEN. TODAY Meter-02(RM1)KWH" := (Rec."Reading Meter - 02 (RM1) KWH" - solar."Reading Meter - 02 (RM1) KWH") * 8;
            Rec."GEN. TODAY Meter-03(RM1)KVAH" := (Rec."Reading Meter - 03 (RM1) KVAH" - solar."Reading Meter - 03 (RM1) KVAH") * 8;
            Rec."GEN. TODAY Meter-03(RM1)KWH" := (Rec."Reading  Meter - 03 (RM1) KWH	" - solar."Reading  Meter - 03 (RM1) KWH	") * 8;
            Rec."GEN.TODAYMeter-04(O2Plant)KVAH" := (Rec."Reading Meter-04(O2 Plant)KVAH" - solar."Reading Meter-04(O2 Plant)KVAH") * 8;
            Rec."GEN.TODAYMeter-04(O2 Plant)KWH" := (Rec."Reading Meter-04(O2 Plant)KWH" - solar."Reading Meter-04(O2 Plant)KWH") * 8;
            Rec."GEN. TODAY Meter-05 (NSY) KVAH" := (Rec."Reading Meter - 05 (NSY) KVAH" - solar."Reading Meter - 05 (NSY) KVAH") * 8;
            Rec."GEN. TODAY Meter- 05 (NSY) KWH" := (Rec."Reading Meter - 05 (NSY) KWH" - solar."Reading Meter - 05 (NSY) KWH") * 8;
            Rec."GEN. TODAY Meter-06(B.Bar)KVAH" := (Rec."Reading Meter-06(B.Bar)KVAH" - solar."Reading Meter-06(B.Bar)KVAH") * 8;
            Rec."GEN. TODAY Meter-06(B.Bar)KWH" := (Rec."Reading Meter - 06 (B.Bar) KWH" - solar."Reading Meter - 06 (B.Bar) KWH") * 8;

            if Rec."GEN. TODATE Meter-01(RM1)KVAH" <> 0 then
                Rec."PF TODATE Meter - 01 (RM1)" := Rec."GEN. TODATE Meter-01(RM1)KWH" / Rec."GEN. TODATE Meter-01(RM1)KVAH";
            if Rec."GEN. TODATE Meter-02(RM1)KVAH" <> 0 then
                Rec."PF TODATE Meter - 02 (RM1)" := Rec."GEN. TODATE Meter-02(RM1)KWH" / Rec."GEN. TODATE Meter-02(RM1)KVAH";
            if Rec."GEN. TODATE Meter-03(RM1)KVAH" <> 0 then
                Rec."PF TODATE Meter - 03 (RM1)" := Rec."GEN. TODATE Meter -03(RM1)KWH" / Rec."GEN. TODATE Meter-03(RM1)KVAH";
            if Rec."GENTODATEMeter-04(O2Plant)KVAH" <> 0 then
                Rec."PF TODATE Meter-04(O2 Plant)" := Rec."GEN.TODATEMeter-04(O2Plant)KWH" / Rec."GENTODATEMeter-04(O2Plant)KVAH";
            if Rec."GEN. TODATE Meter-05(NSY)KVAH" <> 0 then
                Rec."PF TODATE Meter - 05 (NSY)" := Rec."GEN. TODATE Meter-05(NSY)KWH" / Rec."GEN. TODATE Meter-05(NSY)KVAH";
            if Rec."GEN.TODATE Meter-06(B.Bar)KVAH" <> 0 then
                // Rec."PF TODATE Meter - 06 (B.Bar)" := Rec."GEN. TODAY Meter - 06 (B.Bar) KVAH" / Rec."GEN.TODATE Meter-06(B.Bar)KVAH";
                Rec."PF TODATE Meter - 06 (B.Bar)" := rec."GEN. TODATE Meter-06(B.Bar)KWH" / Rec."GEN.TODATE Meter-06(B.Bar)KVAH";
            //  Message('%1..%2..%3', Rec."PF TODATE Meter - 06 (B.Bar)", rec."GEN. TODATE Meter - 06 (B.Bar) KWH	", Rec."GEN. TODAY Meter - 06 (B.Bar) KVAH");
            Rec."Total GEN. Todate	KVAH" := Rec."GEN. TODATE Meter-01(RM1)KVAH" +
            Rec."GEN. TODATE Meter-02(RM1)KVAH" +
            Rec."GEN. TODATE Meter-03(RM1)KVAH" +
            Rec."GENTODATEMeter-04(O2Plant)KVAH" +
            Rec."GEN. TODATE Meter-05(NSY)KVAH" +
            Rec."GEN.TODATE Meter-06(B.Bar)KVAH";

            Rec."Total GEN. Todate	KWH" := Rec."GEN. TODATE Meter-01(RM1)KWh" +
            Rec."GEN. TODATE Meter-02(RM1)KWH" +
             Rec."GEN. TODATE Meter -03(RM1)KWH" +
             Rec."GEN.TODATEMeter-04(O2Plant)KWH" +
             Rec."GEN. TODATE Meter-05(NSY)KWH" +
             Rec."GEN. TODATE Meter-06(B.Bar)KWH";

            //  Message('%1..%2..%3..%4..%5..%6', Rec."GEN. TODATE Meter-01(RM1)KWh", Rec."GEN. TODATE Meter - 02 (RM1) KWH", Rec."GEN. TODATE Meter - 03 (RM1)	KWH",
            // Rec."GEN. TODATE Meter - 04 (O2 Plant) KWH", Rec."GEN. TODATE Meter - 05 (NSY) KWH", Rec."GEN. TODAY Meter - 06 (B.Bar) KWH");

            rec."Total GEN. Today KVAH" := Rec."GEN. Today Meter-01(RM1)KVAH" +
            Rec."GEN. TODAY Meter-02(RM1)KVAH" +
            Rec."GEN. TODAY Meter-03(RM1)KVAH" +
            Rec."GEN.TODAYMeter-04(O2Plant)KVAH" +
            Rec."GEN. TODAY Meter-05 (NSY) KVAH" +
            Rec."GEN. TODAY Meter-06(B.Bar)KVAH";

            Rec."Total GEN. Today KWH" := Rec."GEN. TODAY Meter-01(RM1)KWH" +
            Rec."GEN. TODAY Meter-02(RM1)KWH" +
            Rec."GEN. TODAY Meter-03(RM1)KWH" +
            Rec."GEN.TODAYMeter-04(O2 Plant)KWH" +

            Rec."GEN. TODAY Meter- 05 (NSY) KWH" +
            Rec."GEN. TODAY Meter-06(B.Bar)KWH";

            Rec."RM Gen. Total GEN. Today	KVAH" := Rec."GEN. Today Meter-01(RM1)KVAH" +
            Rec."GEN. TODAY Meter-02(RM1)KVAH" +
            Rec."GEN. TODAY Meter-03(RM1)KVAH";

            Rec."RM Gen. Total GEN. Today	KWH" := Rec."GEN. TODAY Meter-01(RM1)KWH" +
            Rec."GEN. TODAY Meter-02(RM1)KWH" +
            Rec."GEN. TODAY Meter-03(RM1)KWH";
        end;
    end;
}
