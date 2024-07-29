/// <summary>
/// PageExtension general journal (ID 50025) extends Record General Journal.
/// </summary>
pageextension 50027 "general journals" extends "General Journal"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }
            field("Vendor Address"; Rec."Vendor Address")
            {
                ApplicationArea = all;
            }
            field("EFT/Document No"; Rec."EFT/Document No")
            {
                ApplicationArea = all;
            }
        }
    }

}