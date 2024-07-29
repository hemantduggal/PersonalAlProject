/// <summary>
/// PageExtension AccountScheduleExt (ID 50102) extends Record Account Schedule.
/// </summary>
pageextension 50102 AccountScheduleExt extends "Account Schedule"
{
    layout
    {
        ///Pru Neha 280823
        addafter(Description)
        {
            field("Note No."; rec."Note No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Show)
        {
            field(Detailed; rec.Detailed)
            {
                ApplicationArea = all;
            }
            field(Summary; rec.Summary)
            {
                ApplicationArea = all;
            }
        }
    }

}