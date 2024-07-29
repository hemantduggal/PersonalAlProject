
/// <summary>
/// Page POSTED ASSEMBLY MASTER CARD  (ID 50009).
/// </summary>
page 50009 "POSTED ASSEMBLY MASTER CARD "
{
    PageType = Card;

    Caption = 'POSTED ASSEMBLY Master Card ';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "POSTED ASSEMBLY MASTER HEADER";
    CardPageId = "POSTED ASSEMBLY MASTER CARD ";
    AboutText = 'Card PAge ';
    AboutTitle = 'This Is a card Page ';


    layout
    {
        area(Content)
        {
            repeater(general)
            {

                Caption = 'general';
                field("Assembly No"; Rec."Assembly No")
                {
                    ApplicationArea = All;
                }
                field("Assembly Name"; Rec."Assembly Name")
                {
                    ApplicationArea = All;
                }
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = All;
                }
                field("Part No"; Rec."Part No")
                {
                    ApplicationArea = all;

                }
                field("Part Name"; Rec."Part Name")

                {
                    ApplicationArea = all;
                }
                field(Location; Rec.Location)
                { ApplicationArea = all; }
                field(Department; Rec.Department)
                {
                    ApplicationArea = all;
                }
                field("SUb assembly card"; Rec."SUb assembly card")
                {
                    ApplicationArea = all;
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = all;
                }
                field("Fixed Asset Description"; Rec."Fixed Asset Description")
                {
                    ApplicationArea = all;

                }
            }
        }
    }

}