/// <summary>
/// Page safetguidelines (ID 50000).
/// </summary>
page 50000 safetyguidelines
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SafetyGuidlines;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Maintenance Start Time"; Rec."Maintenance Start Time")
                {
                    ApplicationArea = All;

                }
                field("Maintenance Closed Time"; Rec."Maintenance Closed Time")
                {
                    ApplicationArea = all;
                }
                field("Total Time"; Rec."Total Time")
                {
                    ApplicationArea = all;
                }
                field("Safety Guidelines"; Rec."Safety Guidelines")
                {
                    ApplicationArea = all;

                }
                field("Safety Norm to be maintained"; Rec."Safety Norm to be maintained")
                {
                    ApplicationArea = all;
                }
                field("Maintenance Job work"; Rec."Maintenance Job work")
                {
                    ApplicationArea = all;
                }
                field(flag; flag)
                {
                    ApplicationArea = all;
                    caption = 'Flag for action open page ';
                }
            }
        }
    }


    trigger OnOpenPage()
    var
        sh: record "Sales Header";
    begin
        if sh.visible = false then
            CurrPage.Editable(true)




    end;

    var
        myInt: Integer;
        flag: Boolean;
}