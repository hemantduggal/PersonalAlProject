/// <summary>
/// Page ASSEMBLY MASTER List PAGE (ID 50001).
/// </summary>
page 50004 "ASSEMBLY MASTER List PAGE"
{
    PageType = List;

    Caption = 'ASSEMBLY Master LIst';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "ASSEMBLY MASTER HEADER TABLE";
    CardPageId = "ASSEMBLY MASTER card PAGE";


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
    actions
    {
        area(Processing)
        {
            action(check)
            {
                trigger OnAction()
                var
                    i: Integer;
                    f: Integer;
                begin
                    f := 0;
                    for i := 1 to 5 do begin
                        f += 1;
                        // Message('%1', f);
                    end;
                end;
            }
        }
    }
    var
        oag: page 388;
}