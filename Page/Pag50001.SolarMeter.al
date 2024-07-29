page 50001 "Solar Meter"
{
    ApplicationArea = All;
    Caption = 'Solar Meter';
    PageType = List;
    SourceTable = "Solar Meter";
    UsageCategory = Administration;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Reading Meter - 01 (RM1) KVAH"; Rec."Reading Meter - 01 (RM1) KVAH")
                {
                    ToolTip = 'Specifies the value of the Reading Meter - 01 (RM1) KVAH field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Reading Meter - 01 (RM1) KWH"; Rec."Reading Meter - 01 (RM1) KWH")
                {
                    ToolTip = 'Specifies the value of the Reading Meter - 01 (RM1) KWH field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Reading Meter - 02 (RM1) KVAH"; Rec."Reading Meter - 02 (RM1) KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 02 (RM1) KVAH field.', Comment = '%';
                }
                field("Reading Meter - 02 (RM1) KWH"; Rec."Reading Meter - 02 (RM1) KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 02 (RM1) KWH field.', Comment = '%';
                }
                field("Reading Meter - 03 (RM1) KVAH"; Rec."Reading Meter - 03 (RM1) KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 03 (RM1) KVAH field.', Comment = '%';
                }
                field("Reading  Meter - 03 (RM1) KWH	"; Rec."Reading  Meter - 03 (RM1) KWH	")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading  Meter - 03 (RM1) KWH field.', Comment = '%';
                }
                field("Reading Meter-04(O2 Plant)KVAH"; Rec."Reading Meter-04(O2 Plant)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 04 (O2 Plant) KVAH field.', Comment = '%';
                }
                field("Reading Meter-04(O2 Plant)KWH"; Rec."Reading Meter-04(O2 Plant)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 04 (O2 Plant) KWH field.', Comment = '%';
                }
                field("Reading Meter-06(B.Bar)KVAH"; Rec."Reading Meter-06(B.Bar)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 06 (B.Bar) KVAH field.', Comment = '%';
                }
                field("Reading Meter - 06 (B.Bar) KWH"; Rec."Reading Meter - 06 (B.Bar) KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 06 (B.Bar) KWH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-01(RM1)KVAH"; Rec."GEN. TODAY Meter-01(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 01 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-01(RM1)KWH"; Rec."GEN. TODAY Meter-01(RM1)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 01 (RM1) KWH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-02(RM1)KVAH"; Rec."GEN. TODAY Meter-02(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 02 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-02(RM1)KWH"; Rec."GEN. TODAY Meter-02(RM1)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 02 (RM1) KWH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-03(RM1)KVAH"; Rec."GEN. TODAY Meter-03(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 03 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-03(RM1)KWH"; Rec."GEN. TODAY Meter-03(RM1)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 03 (RM1) KWH field.', Comment = '%';
                }
                field("GEN.TODAYMeter-04(O2Plant)KVAH"; Rec."GEN.TODAYMeter-04(O2Plant)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 04 (O2 Plant) KVAH field.', Comment = '%';
                }
                field("GEN.TODAYMeter-04(O2 Plant)KWH"; Rec."GEN.TODAYMeter-04(O2 Plant)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 04 (O2 Plant) KWH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-05 (NSY) KVAH"; Rec."GEN. TODAY Meter-05 (NSY) KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 05 (NSY) KVAH field.', Comment = '%';
                }
                field("GEN. TODAY Meter- 05 (NSY) KWH"; Rec."GEN. TODAY Meter- 05 (NSY) KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 05 (NSY) KWH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-06(B.Bar)KVAH"; Rec."GEN. TODAY Meter-06(B.Bar)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 06 (B.Bar) KVAH field.', Comment = '%';
                }
                field("GEN. TODAY Meter-06(B.Bar)KWH"; Rec."GEN. TODAY Meter-06(B.Bar)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODAY Meter - 06 (B.Bar) KWH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-01(RM1)KVAH"; Rec."GEN. TODATE Meter-01(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 01 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-01(RM1)KWh"; Rec."GEN. TODATE Meter-01(RM1)KWh")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 01 (RM1) KWh field.', Comment = '%';
                }
                field("GEN. TODATE Meter-02(RM1)KVAH"; Rec."GEN. TODATE Meter-02(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 02 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-02(RM1)KWH"; Rec."GEN. TODATE Meter-02(RM1)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 02 (RM1) KWH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-03(RM1)KVAH"; Rec."GEN. TODATE Meter-03(RM1)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 03 (RM1) KVAH field.', Comment = '%';
                }
                field("GEN. TODATE Meter -03(RM1)KWH"; Rec."GEN. TODATE Meter -03(RM1)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 03 (RM1)	KWH field.', Comment = '%';
                }
                field("GENTODATEMeter-04(O2Plant)KVAH"; Rec."GENTODATEMeter-04(O2Plant)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 04 (O2 Plant) KVAH field.', Comment = '%';
                }
                field("GEN.TODATEMeter-04(O2Plant)KWH"; Rec."GEN.TODATEMeter-04(O2Plant)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 04 (O2 Plant) KWH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-05(NSY)KVAH"; Rec."GEN. TODATE Meter-05(NSY)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 05 (NSY) KVAH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-05(NSY)KWH"; Rec."GEN. TODATE Meter-05(NSY)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 05 (NSY) KWH field.', Comment = '%';
                }
                field("GEN.TODATE Meter-06(B.Bar)KVAH"; Rec."GEN.TODATE Meter-06(B.Bar)KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 06 (B.Bar)	KVAH field.', Comment = '%';
                }
                field("GEN. TODATE Meter-06(B.Bar)KWH"; Rec."GEN. TODATE Meter-06(B.Bar)KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GENARATION TODATE Meter - 06 (B.Bar) KWH	 field.', Comment = '%';
                }
                field("PF TODATE Meter - 01 (RM1)"; Rec."PF TODATE Meter - 01 (RM1)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 01 (RM1) field.', Comment = '%';
                }
                field("PF TODATE Meter - 02 (RM1)"; Rec."PF TODATE Meter - 02 (RM1)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 02 (RM1) field.', Comment = '%';
                }
                field("PF TODATE Meter - 03 (RM1)"; Rec."PF TODATE Meter - 03 (RM1)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 03 (RM1) field.', Comment = '%';
                }
                field("PF TODATE Meter-04(O2 Plant)"; Rec."PF TODATE Meter-04(O2 Plant)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 04 (O2 Plant) field.', Comment = '%';
                }
                field("PF TODATE Meter - 05 (NSY)"; Rec."PF TODATE Meter - 05 (NSY)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 05 (NSY) field.', Comment = '%';
                }
                field("PF TODATE Meter - 06 (B.Bar)"; Rec."PF TODATE Meter - 06 (B.Bar)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PF TODATE Meter - 06 (B.Bar) field.', Comment = '%';
                }
                field("Total GEN. Todate	KVAH"; Rec."Total GEN. Todate	KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Genaration Todate	KVAH field.', Comment = '%';
                }
                field("Total GEN. Todate	KWH"; Rec."Total GEN. Todate	KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Genaration Todate	KWH field.', Comment = '%';
                }
                field("Total GEN. Today KVAH"; Rec."Total GEN. Today KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Genaration Today KVAH field.', Comment = '%';
                }
                field("Total GEN. Today KWH"; Rec."Total GEN. Today KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Genaration Today KWH field.', Comment = '%';
                }
                field("RM Gen. Total GEN. Today	KVAH"; Rec."RM Gen. Total GEN. Today	KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the RM Generation Total Genaration Today	KVAH field.', Comment = '%';
                }
                field("RM Gen. Total GEN. Today	KWH"; Rec."RM Gen. Total GEN. Today	KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the RM Generation Total Genaration Today	KWH field.', Comment = '%';
                }
                field("Reading Meter - 05 (NSY) KVAH"; Rec."Reading Meter - 05 (NSY) KVAH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 05 (NSY) KVAH field.', Comment = '%';
                }
                field("Reading Meter - 05 (NSY) KWH"; Rec."Reading Meter - 05 (NSY) KWH")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Reading Meter - 05 (NSY) KWH field.', Comment = '%';
                }
            }
        }
    }
}
