/// <summary>
/// TableExtension AccScheduleExt (ID 50102) extends Record Acc. Schedule Line.
/// </summary>
tableextension 50104 AccScheduleExt extends "Acc. Schedule Line"
{
    fields
    { ///Pru Neha 280823
        field(50000; Detailed; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Detailed';
        }

        field(50001; Summary; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Summary';
        }
        field(50002; "Note No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Note No.';
        }
    }

}