table 50110 CalibrationCalender
{
    DataClassification = ToBeClassified;
    caption = 'Calibration Calender';


    fields
    {

        field(1; "Sr No."; integer)
        {
            DataClassification = ToBeClassified;
            autoincrement = true;
        }
        field(2; "Tag No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = CriticalCalibrationMaster."CriticalCalibration No";

            // trigger OnValidate()
            // var
            //     RecCal: Record CriticalCalibrationMaster;
            // begin
            //     if RecCal.Get(rec."Tag No.") then
            //         rec."Area" := RecCal."Area";
            //     rec.Description := RecCal.Description;
            // end;
        }
        field(3; Description; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Area"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Frequency; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Quaterly";
        }
        field(7; Startdate; date)
        {
            DataClassification = ToBeClassified;
            caption = 'Start Date';
        }
        field(8; Jan; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Feb; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Mar; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Apr; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; May; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Jun; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Jul; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Aug; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Sep; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Oct; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; Nov; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Dec; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Calibration; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","In House","Out House";
        }
        field(21; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; CalNo; code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(pk; CalNo)
        {
            Clustered = true;
        }
    }


    var
    // earth: Record EarthpitMaster;
}