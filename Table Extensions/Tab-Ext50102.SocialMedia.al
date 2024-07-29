/// <summary>
/// TableExtension Social Media  (ID 50102) extends Record Employee.
/// </summary>
tableextension 50102 "Social Media " extends Employee
{
    fields
    {
        field(50100; Facebook; Text[50])
        {
            Caption = 'Facebook';
            DataClassification = ToBeClassified;
        }
        field(50101; instagram; Text[50])
        {
            Caption = 'instagram';
            DataClassification = ToBeClassified;
        }
        field(50102; twitter; Text[50])
        {
            Caption = 'twitter';
            DataClassification = ToBeClassified;
        }
        field(50103; linkedin; Text[50])
        {
            Caption = 'linkedin';
            DataClassification = ToBeClassified;
        }

    }
}
