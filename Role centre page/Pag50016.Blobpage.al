page 50016 "Blob page"
{
    ApplicationArea = All;
    Caption = 'Blob page';
    PageType = Card;
    SourceTable = "Blob Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Blob1; Rec.Blob1)
                {
                    ToolTip = 'Specifies the value of the Blob1 field.';
                }
                field(Blob2; Rec.Blob2)
                {
                    ToolTip = 'Specifies the value of the Blob2 field.';
                }
                field(Blob3; Rec.Blob3)
                {
                    ToolTip = 'Specifies the value of the Blob3 field.';
                }
                field(Blob4; Rec.Blob4)
                {
                    ToolTip = 'Specifies the value of the Blob4 field.';
                }
                field(Blob5; Rec.Blob5)
                {
                    ToolTip = 'Specifies the value of the Blob5 field.';
                }
                field(Blob6; Rec.Blob6)
                {
                    ToolTip = 'Specifies the value of the Blob6 field.';
                }
                field("Primary key"; Rec."Primary key")
                {
                    ToolTip = 'Specifies the value of the Primary key field.';
                }
            }
        }
    }
}
