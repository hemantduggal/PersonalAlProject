page 50021 "Power Automate Setup page"
{
    PageType = Card;
    Caption = 'Power Automate Setup';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Hemant Power Automate Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("Test Setup Field"; Rec."Test Setup Field")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}