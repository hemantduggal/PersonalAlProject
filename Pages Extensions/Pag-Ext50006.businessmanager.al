pageextension 50006 "business manager" extends "O365 Activities"
{
    layout
    {
        addafter("Ongoing Sales")
        {
            cuegroup("Approval entries")
            {
                //CueGroupLayout = Wide;
                ShowCaption = false;
                Caption = 'Approval entry';
                field("Approval entry"; Rec."Approval entry")
                {
                    ApplicationArea = all;
                    DrillDownPageId = "Approval Entries";
                }
            }
        }

    }
}
