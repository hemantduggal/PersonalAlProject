/// <summary>
/// Page Cust (ID 50103).
/// </summary>
page 50103 EmployeePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeTable;
    AboutTitle = 'About Employee Details';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(empcode; Rec."emp code")
                {
                    ApplicationArea = All;
                }
                field(empSalary; Rec."Salary")
                {
                    ApplicationArea = All;

                }
                field(empName; Rec."emp name")
                {
                    ApplicationArea = All;
                }
                field(empEmail; Rec."Email")
                {
                    ApplicationArea = All;


                }
                field(empDOJ; Rec."DOJ")
                {
                    ApplicationArea = All;

                }
                field(empCity; Rec."City")
                {
                    ApplicationArea = All;
                    AboutText = 'Sales City  appear ';

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
                    Message('Data inserted');
                end;
            }
            
            action(Save)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data inserted');
                end;
            }
        }
    }



    var
        myInt: Integer;

}
