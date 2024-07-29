/// <summary>
/// Page powerbi (ID 50020).
/// </summary>
page 50020 powerbi
{
    ApplicationArea = All;
    Caption = 'Power BI';
    PageType = CardPart;
    layout
    {
        area(Content)
        {
            // usercontrol(WebPageViewer;)
            // {
            //     ApplicationArea = all;
            // }
        }
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        session: SessionSettings;
        url: text;
    begin
        session.Init();
    end;
}
