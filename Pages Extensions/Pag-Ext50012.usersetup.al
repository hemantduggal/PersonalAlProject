pageextension 50012 "user setup" extends "User Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field("1st approver"; Rec."1st approver")
            {
                ApplicationArea = all;
            }
            field("2nd approver"; Rec."2nd approver")
            {
                ApplicationArea = all;
            }
            field(ControlPoint; Rec.ControlPoint)
            {
                ApplicationArea = all;
            }
        }
    }
}
