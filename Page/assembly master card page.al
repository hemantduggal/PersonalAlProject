page 50005 "ASSEMBLY MASTER CARD PAGE"
{
    PageType = Card;
    Caption = 'ASSEMBLY Master Card ';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "ASSEMBLY MASTER HEADER TABLE";
    layout
    {
        area(Content)
        {
            group(General)
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
            group(otherdetails)
            {
                part(ASSEMBLYMASTERSubform; "ASSEMBLY MASTER subform page")
                {
                    ApplicationArea = all;
                    UpdatePropagation = Both;
                    SubPageLink = "Assembly No" = FIELD("Assembly No");
                    Visible = true;
                    Editable = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Ellipsis = true;
                Image = PostOrder;
                ShortCutKey = 'F9';
                trigger OnAction()
                begin
                end;
            }
        }
    }
}