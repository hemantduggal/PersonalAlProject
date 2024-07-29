/// <summary>
/// PageExtension posted gen jnl line (ID 50028) extends Record Posted General Journal.
/// </summary>
pageextension 50028 "posted gen jnl line" extends "Posted General Journal"
{
    layout
    {
        addafter("Journal Batch Name")
        {
            field("EFT/Document No"; Rec."EFT/Document No")
            {
                ApplicationArea = all;
            }
        }


    }




    var
        myInt: Integer;
}