table 50008 "Blob Table"
{
    Caption = 'Blob Table';
    DataClassification = OrganizationIdentifiableInformation;

    fields
    {
        field(1; Blob1; Blob)
        {
            Caption = 'Blob1';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(2; Blob2; Blob)
        {
            Caption = 'Blob2';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(3; Blob3; Blob)
        {
            Caption = 'Blob3';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(4; Blob4; Blob)
        {
            Caption = 'Blob4';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(5; Blob5; Blob)
        {
            Caption = 'Blob5';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(6; Blob6; Blob)
        {
            Caption = 'Blob6';
            Subtype = Bitmap;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(7; "Primary key"; Code[20])
        {
            Caption = 'Primary key';

        }
    }
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }
}
