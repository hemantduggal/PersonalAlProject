tableextension 50025 "user setup" extends "User Setup"
{
    fields
    {
        field(50000; "1st approver"; Boolean)
        {
            Caption = '1st approver';
            DataClassification = ToBeClassified;
        }
        field(50001; "2nd approver"; Boolean)
        {
            Caption = '2nd approver';
            DataClassification = ToBeClassified;
        }
        field(50002; "ControlPoint"; Boolean)
        {

            DataClassification = ToBeClassified;
        }

    }
}
