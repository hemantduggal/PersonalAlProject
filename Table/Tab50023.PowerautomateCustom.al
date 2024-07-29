table 50023 "Hemant Power Automate Setup"
{
    Caption = 'Hemant Power Automate Setup';
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Test Setup Field"; Boolean)
        {
            Caption = 'Test Setup Field';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}