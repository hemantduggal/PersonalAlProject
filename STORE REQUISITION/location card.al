pageextension 50015 locationc extends "Location card"
{
    layout
    {
        addafter(Code)
        {
            field("Store location"; Rec."Store location")
            {
                ApplicationArea = all;
            }
        }
    }
}
