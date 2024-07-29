/// <summary>
/// Page POSTED ASSEMBLY MASTER List (ID 50007).
/// </summary>
page 50007 "POSTED ASSEMBLY MASTER List"
{
    PageType = List;

    Caption = 'POSTED ASSEMBLY Master LIst';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "POSTED ASSEMBLY MASTER HEADER";
    CardPageId = "POSTED ASSEMBLY MASTER card ";


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

            }
        }
    }

}