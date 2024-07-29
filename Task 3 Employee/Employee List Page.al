/// <summary>
/// Page Employee (ID 50121).
/// </summary>
page 50121 "Employee List 1 page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Employee Table";
    CardPageId = "Employee Card page";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';

                field(empName; Rec.FirstName)
                {
                    ApplicationArea = All;

                }
                field(EmpCode; Rec.EmpCode)
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
            action(Test)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data Inserted ');
                end;
            }
        }
    }


}