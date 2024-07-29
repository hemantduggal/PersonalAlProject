table 50019 "Requistion approval entries"
{
    Caption = 'Requistion approval entries';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Type';
            OptionMembers = "Requisition";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Date';
        }
        field(4; "Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Approver ID';
        }

        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            OptionMembers = "",open,"2nd approval pending",Approved,Rejected;
        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
        field(7; approverid2; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
