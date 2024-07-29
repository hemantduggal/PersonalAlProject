pageextension 50011 location extends "Location List"
{
    layout
    {
        addafter(Code)
        {
            field("Store location"; Rec."Store location")
            {
                ApplicationArea = all;
                // trigger OnValidate()
                // var
                // begin
                //     if rec."Store location"=true then

                // end;
            }
        }
    }
}
