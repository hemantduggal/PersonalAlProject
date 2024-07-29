table 50009 "Visual table"
{
    Caption = 'Visual table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; Blob1; Blob)
        {
            Caption = 'Blob1';
        }
        field(3; Blob2; Blob)
        {
            Caption = 'Blob2';
        }
        field(4; Item; Code[20])
        {

        }
        field(5; Customer; Code[20])
        {

        }

    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
